/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author jyoti
 */
public class UserDaoClass implements UserDao {

    private Connection conn;

    public UserDaoClass(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean checkPassword(String ps, int id) {
        boolean f = false;

        try {
            String sql = "select * from user where password=? and id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, ps);
            pst.setInt(2, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    

@Override
        public User validateLogin(String email, String password) {
        User us = null;
        try {
//            String sql="Select* from user where email=?,password=?";
            String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhono(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAdress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    @Override
        public boolean userRegister(User us) {
        boolean f = false;
        try {
            String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhono());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;
    }
        @Override
    public boolean updateProfile(User us) {
        boolean f = false;
        try {
            String sql = "update user set name=? ,email=?, phno=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhono());
            ps.setInt(4, us.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkUser(String em) {
        boolean f=true;
        try{
            String sql="select* from user where email=?";
             PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,em);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                f=false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
}

