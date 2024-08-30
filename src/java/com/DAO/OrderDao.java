/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Order;
import java.util.List;

/**
 *
 * @author jyoti
 */
public interface OrderDao {
    public int getOrderNo();
    public boolean saveOrder(List<Order> blist);
    public List<Order> getOrder(String email);
    public List<Order> getAllOrder();
}
