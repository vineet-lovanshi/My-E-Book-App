/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.UserDaoClass;
import com.DB.DbConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author jyoti
 *
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            String check = request.getParameter("check");

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhono(phno);
            us.setPassword(password);

            HttpSession session = request.getSession();
            if (check != null) {
                UserDaoClass dao = new UserDaoClass(DbConnect.getConn());
                boolean f2 = dao.checkUser(email);
                if (f2) {
                    boolean f = dao.userRegister(us);

                    if (f) {
                        session.setAttribute("message", "Registration Successfully.");
                        session.setAttribute("messageType", "success");
                        response.sendRedirect("register.jsp");
                    } else {
                        session.setAttribute("message", "Something went wrong.");
                        session.setAttribute("messageType", "danger");
                        response.sendRedirect("register.jsp");
                    }
                } else {
                    session.setAttribute("message", "User Allready Exist Try to Another Email..");
                    session.setAttribute("messageType", "danger");
                    response.sendRedirect("register.jsp");
                }
            } else {
//                    JOptionPane.showMessageDialog(null, "Please check agree terms & condition" ,"Error!",JOptionPane.ERROR_MESSAGE);
                session.setAttribute("message", "Please check Agree terms & condtion..");
                session.setAttribute("messageType", "terms");
                response.sendRedirect("register.jsp");
            }
//                }      response.sendRedirect("register.jsp");
        } catch (Exception e) {
            e.printStackTrace();
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
