/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jyoti
 */
public class CartDaoClass implements CartDao {

    private Connection conn;

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list=new ArrayList<Cart>();
        Cart c=null;
        double totalPrice=0;
        try {
            String sql="select * from cart where userId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                c=new Cart();
                c.setCartId(rs.getInt(1));
                c.setBookId(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthorName(rs.getString(5));
                c.setPrice(rs.getDouble(6));
                
                totalPrice=totalPrice+rs.getDouble(7);
                c.setTotalPrice(totalPrice);
                
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean cartDeletebyBookId(int bid,int uid,int cid) {
        boolean f=false;
        try{
            String sql = "delete from cart where bookId=? and userId=? and cartId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public CartDaoClass(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        try {
            String sql = "insert into cart(bookId,userId,bookName,authorName,price,totalPrice) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBookId());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthorName());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;
    }

}
