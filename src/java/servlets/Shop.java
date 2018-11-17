/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Customer;
import entity.Product;
import entity.Purchase;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.CustomerFacade;
import session.ProductFacade;
import session.PurchaseFacade;
import util.PageReturner;

/**
 *
 * @author agloi
 */
@WebServlet(name = "Shop", urlPatterns = {
    "/newProduct",
    "/addProduct",
    "/newCustomer",
    "/addCustomer",
    "/showProducts",
    "/showCustomer",
    "/shop",
    "/buyProduct",
    "/showBuyProduct",
    "/listBuyProducts",
    "/deleteProduct",
    })

public class Shop extends HttpServlet {
@EJB ProductFacade productFacade;
@EJB CustomerFacade customerFacade;
@EJB PurchaseFacade purchaseFacade;


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF8");
        String path = request.getServletPath();
        if(null != path)switch (path) {
        case "/newProduct":
            request.getRequestDispatcher(PageReturner.getPage("newProduct")).forward(request, response);
            break;
        case "/addProduct":{
            String nameProduct= request.getParameter("name");
            String price = request.getParameter("price");
            String count=request.getParameter("count");
            Product product = new Product(nameProduct, new Integer(price),new Integer(count));
            productFacade.create(product);
            request.setAttribute("product", product);
            request.getRequestDispatcher(PageReturner.getPage("welcom")).forward(request, response);
                break;
            }
        case "/newCustomer":{
            request.getRequestDispatcher(PageReturner.getPage("newCustomer")).forward(request, response);
            break;
        }
        case "/addCustomer":{
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String money = request.getParameter("money");
            Customer customer = new Customer(name, surname, money);
            customerFacade.create(customer);
            request.setAttribute("customer", customer);
            request.getRequestDispatcher(PageReturner.getPage("welcom")).forward(request, response);
                break;
            }
        case "/showProducts":{
            List<Product> listProducts = productFacade.findExistingProducts();
            request.setAttribute("listProducts", listProducts);
            request.getRequestDispatcher(PageReturner.getPage("listProduct")).forward(request, response);
                break;
            }
        case "/showCustomer":{
            List<Customer> listCustomers = customerFacade.findAll();
            request.setAttribute("listCustomers", listCustomers);
            request.getRequestDispatcher(PageReturner.getPage("listCustomer")).forward(request, response);
            break;
        }
        case "/purchase":{
            request.setAttribute("listProducts", productFacade.findAll());
            request.setAttribute("listCustomers", customerFacade.findAll());
            request.getRequestDispatcher(PageReturner.getPage("ListBuyProducts")).forward(request, response);
            break;
        }
        case "/showBuyProduct":{
            List<Purchase> buyProducts = purchaseFacade.findAll();
            request.setAttribute("buyProducts", buyProducts);
            request.getRequestDispatcher(PageReturner.getPage("listBuyProducts")).forward(request, response);
                break;
            }
        case "/buyProduct":{
            String selectedProduct = request.getParameter("selectedProduct");
            String selectedCustomer = request.getParameter("selectedCustomer");
            Product product = productFacade.find(new Long(selectedProduct));
            Customer customer = customerFacade.find(new Long(selectedCustomer));
            Calendar c = new GregorianCalendar();
            Purchase purchase;
            if(product.getCount()>0){
                product.setCount(product.getCount()-1);
                productFacade.edit(product);
                purchase = new Purchase(product, customer, c.getTime(), null);
                purchaseFacade.create(purchase);
            }else{
                request.setAttribute("info", "данного продукта нет на складе");
            }
            List<Purchase> buyProducts = purchaseFacade.findBuyProducts(product);
            request.setAttribute("buyProducts", buyProducts);
            request.getRequestDispatcher(PageReturner.getPage("listBuyProducts")).forward(request, response);
                break;
            }
        case "/deleteProduct":{
            String deleteProductId = request.getParameter("deleteProductId");
            Product product = productFacade.find(new Long(deleteProductId));
            product.setActive(Boolean.FALSE);
            productFacade.edit(product);
            List<Product> listProducts = productFacade.findAll();
            request.setAttribute("listProducts", listProducts);
            request.getRequestDispatcher(PageReturner.getPage("listBuyProducts")).forward(request, response);
                break;
            }
        default:
            request.getRequestDispatcher(PageReturner.getPage("welcom")).forward(request, response);
            break;
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public void init() throws ServletException {
        getServletContext().setAttribute("customers", customerFacade.findAll());
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Object listCustomer() {
    return null;

    }

}
