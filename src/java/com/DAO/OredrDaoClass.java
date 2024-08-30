/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jyoti
 */
public class OredrDaoClass implements OrderDao {

    private Connection conn;

    public OredrDaoClass(Connection conn) {
        this.conn = conn;
    }

    @Override
    public int getOrderNo() {
        int i = 1;
        try {
            String sql = "select*from order_details";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public List<Order> getOrder(String email) {
        List<Order> list = new ArrayList<Order>();
        Order o = null;
        try {
            String sql = "select * from order_details where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPayment(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean saveOrder(List<Order> blist) {
        boolean f = false;
        try {
            String sql = "insert into order_details (orderId,userName,email,address,phone,bookName,author,price,payment) values(?,?,?,?,?,?,?,?,?)";

            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for (Order b : blist) {
                ps.setString(1, b.getOrderId());
                ps.setString(2, b.getUserName());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getAddress());
                ps.setString(5, b.getPhone());
                ps.setString(6, b.getBookName());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPayment());
                ps.addBatch();
            }
            int[] count = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<Order>();
        Order o = null;
        try {
            String sql = "select * from order_details";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPayment(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
