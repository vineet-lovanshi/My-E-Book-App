/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Cart;
import java.util.List;

/**
 *
 * @author jyoti
 */
public interface CartDao {
    public boolean addCart(Cart c);
    
    public List<Cart> getBookByUser(int userId);
    public boolean cartDeletebyBookId(int bid,int uid,int cid);
}
