/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Product;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author agloi
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> {

    @PersistenceContext(unitName = "KTVR17WebShopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

//  public List<Product> findActived(boolean active) {
//       return em.createQuery("SELECT p FROM Product p WHERE p.active = :active AND p.count > 0" ).setParameter("active", active).getResultList();
//        }

    public List<Product> findExistingProducts() {
      return em.createQuery("SELECT p FROM Product p WHERE  p.count > 0")            
                .getResultList();
    }
}
