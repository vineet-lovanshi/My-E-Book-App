/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author jyoti
 */
public class DbConnect {
    private static Connection conn;
    public static Connection getConn(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app", "root","admin@321");
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return conn;
    }
}
