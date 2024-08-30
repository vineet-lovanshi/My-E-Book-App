/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.User;

/**
 *
 * @author jyoti
 */
public interface UserDao {
    public boolean userRegister(User us);
    public User validateLogin(String email, String password);
    public boolean checkPassword(String ps,int id);
    public boolean updateProfile(User us);
    public boolean checkUser(String em);
}
