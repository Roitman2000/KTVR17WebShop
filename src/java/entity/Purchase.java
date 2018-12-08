/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author agloi
 */
@Entity
public class Purchase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private Product product;
    @OneToOne
    private Customer customer;
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateReturn;
    private Integer quantity;
   


public Purchase() {
    }

    public Purchase( Product product, Customer customer, Date date, Integer quantity) {
        this.id = id;
        this.product = product;
        this.customer = customer;
        this.date = date;
         this.dateReturn = dateReturn;
        this.quantity = quantity;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
  public Date getDateReturn() {
        return dateReturn;
    }

    public void setDateReturn(Date dateReturn) {
        this.dateReturn = dateReturn;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.id);
        hash = 97 * hash + Objects.hashCode(this.product);
        hash = 97 * hash + Objects.hashCode(this.customer);
        hash = 97 * hash + Objects.hashCode(this.date);
        hash = 61 * hash + Objects.hashCode(this.dateReturn);
        hash = 97 * hash + Objects.hashCode(this.quantity);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Purchase other = (Purchase) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.product, other.product)) {
            return false;
        }
        if (!Objects.equals(this.customer, other.customer)) {
            return false;
        }
        if (!Objects.equals(this.date, other.date)) {
            return false;
        }

        if (!Objects.equals(this.dateReturn, other.dateReturn)) {
            return false;
        }
        if (!Objects.equals(this.quantity, other.quantity)) {
            return false;
        }
        return true;
    }



//    public String toString() {
//        return "Purchase{" + "id=" + id + ", product=" + product + ", customer=" + customer + ", date=" + date + ", quantity=" + quantity + '}';
//    }
   public String toString() {
        SimpleDateFormat myformat = new SimpleDateFormat("dd.MM.yyyy");
        if (dateReturn != null) {
            return "ПОКУПКА: " + product.toString() + ". Покупатель - " + customer.getName() + " " + customer.getSurname() + ", " + myformat.format(date) + ", " + myformat.format(dateReturn) + ", купил в количестве " + quantity + " шт" + ' ';
        } else {
            return "ПОКУПКА: " + product.toString() + ". Покупатель - " + customer.getName() + " " + customer.getSurname() + ", " + myformat.format(date) + ", купил в количестве " + quantity + " шт" + ' ';
        }
    }
  
    
}
