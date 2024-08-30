
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

/**
 *
 * @author jyoti
 */
public class UpdateProfileServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id=Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            
            User us=new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhono(phno);
            
            UserDaoClass dao=new UserDaoClass(DbConnect.getConn());
            boolean f=dao.checkPassword(password, id);
             HttpSession session = request.getSession();
            if(f){
                boolean f2=dao.updateProfile(us);
                 if (f2) {
                     session.setAttribute("useObj", us);
                    session.setAttribute("message", "Profile Update Successfully.");
                    session.setAttribute("messageType", "success");
                    response.sendRedirect("edit_profile.jsp");
                } else {
                    session.setAttribute("message", "Something went wrong.");
                    session.setAttribute("messageType", "danger");
                    response.sendRedirect("edit_profile.jsp");
                }
            }else{
                session.setAttribute("message", "Your Password is incorrect.");
                    session.setAttribute("messageType", "danger");
                    response.sendRedirect("edit_profile.jsp");
            }
        }catch(Exception e){
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
