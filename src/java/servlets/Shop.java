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
import util.EncriptPass;
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
    "/welcome",
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
          
         
        case "/addProduct":
            String nameProduct= request.getParameter("name");
            String price = request.getParameter("price");
            String count=request.getParameter("count");
            Product product = new Product(nameProduct, new Integer(price),new Integer(count));
            productFacade.create(product);
            request.setAttribute("product", product);
            request.setAttribute("customer", new Customer());
            request.getRequestDispatcher(PageReturner.getPage("welcome")).forward(request, response);
            break;
           
        case "/newCustomer":{
            request.getRequestDispatcher(PageReturner.getPage("newCustomer")).forward(request, response);
            break;
        }
        case "/addCustomer":{
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String money = request.getParameter("money");
            String login = request.getParameter("login");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            if(!password1.equals(password2)){
                request.setAttribute("info","Неправильный логин или пароль");
                request.getRequestDispatcher(PageReturner.getPage("welcome")).forward(request, response);
                break;
            }
            EncriptPass ep = new EncriptPass();
            String salts = ep.createSalts();
            String encriptPass = ep.setEncriptPass(password1,salts);
            Customer customer = new Customer(name, surname, money, login, encriptPass, salts);
            customerFacade.create(customer);
            request.setAttribute("customer", customer);
            request.setAttribute("product", new Product());
            request.getRequestDispatcher(PageReturner.getPage("welcome")).forward(request, response);
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
        case "/shop":{
            request.setAttribute("listProducts", productFacade.findAll());//findActived(true));
            request.setAttribute("listCustomer", customerFacade.findAll());
            request.getRequestDispatcher(PageReturner.getPage("buyProduct")).forward(request, response);
            break;
        }
        case "/showBuyProduct":{
            List<Purchase> buyProducts = purchaseFacade.findAll();
            request.setAttribute("buyProducts", buyProducts);
            request.getRequestDispatcher(PageReturner.getPage("listBuyProduct")).forward(request, response);
                break;
            }
        case "/buyProduct":{
            String selectedProduct = request.getParameter("selectedProduct");
//            String selectedCountProduct = request.getParameter("selectedCountProduct");
            String selectedCustomer = request.getParameter("selectedCustomer");
            product = productFacade.find(new Long(selectedProduct));
            Customer customer = customerFacade.find(new Long(selectedCustomer));
            Calendar c = new GregorianCalendar();
            Purchase purchase;
                if(product.getCount()>0){
                    product.setCount(product.getCount()-1);
                    productFacade.edit(product);
//                     purchase.setQuantity(Integer.parseInt(request.getParameter("guantity")));
//                    purchase.setTotal(purchase.getQuantity()* product.getPrice());
                    purchase = new Purchase(product, customer, c.getTime(), null);
                    purchaseFacade.create(purchase);
                }else{
                    request.setAttribute("info", "Товар весь распродан!Ждите нового привоза товара!");
                }       List<Purchase> buyProducts = purchaseFacade.findBuyProducts();
                request.setAttribute("buyProducts", buyProducts);
                request.getRequestDispatcher(PageReturner.getPage("listBuyProduct")).forward(request, response);
                    break;
                }
//            purchase.getCustomer().setMoney(purchase.getCustomer().getMoney()-purchase.getProduct().getPrice()*quantity);
//             if (purchase.getMoney()<0){
////                    customer.setMoney(customer.getMoney()-1);
//                 customerFacade.edit(customer);
//                purchase = new Purchase(product, customer, c.getTime(), null);
//                purchaseFacade.create(purchase); 
//                 }else{
//               request.setAttribute("info","Извините.У Вас не хватает денег");
//        }

            case "/returnProduct":{

                String purchaseId = request.getParameter("purchaseId");
                Purchase purchase = purchaseFacade.find(new Long(purchaseId));
                Calendar c = new GregorianCalendar();
                purchase.setDateReturn(c.getTime());
                purchase.getProduct().setCount(purchase.getProduct().getCount()+1);
                purchaseFacade.edit(purchase);

                List<Purchase> buyProducts = purchaseFacade.findBuyProducts();
                request.setAttribute("buyProducts", buyProducts);
                request.getRequestDispatcher("/listBuyProducts.jsp").forward(request, response);

                    break;
                }
        case "/deleteProduct":{
            String deleteProductId = request.getParameter("deleteProductId");
            product = productFacade.find(new Long(deleteProductId));
//            product.setActive(Boolean.FALSE);
            productFacade.edit(product);
            List<Product> listProducts = productFacade.findAll();
            request.setAttribute("listProducts", listProducts);
            request.getRequestDispatcher(PageReturner.getPage("listBuyProduct")).forward(request, response);
                break;
            }
        default:
            request.getRequestDispatcher(PageReturner.getPage("welcome")).forward(request, response);
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
        getServletContext().setAttribute("customer", customerFacade.findAll());
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

}