/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.BookDaoClass;
import com.DAO.CartDaoClass;
import com.DB.DbConnect;
import com.entity.BookDetails;
import com.entity.Cart;
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
public class AddCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int uid = Integer.parseInt(request.getParameter("uid"));

            BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
            BookDetails b = dao.getBookbyId(bid);

            Cart c = new Cart();
            c.setBookId(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthorName(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDaoClass dao2 = new CartDaoClass(DbConnect.getConn());
            boolean f = dao2.addCart(c);

            HttpSession session = request.getSession();
            if (f) {
                session.setAttribute("message", "Book Added to Cart Successfully");
                session.setAttribute("messageType", "success");
                response.sendRedirect("all_new_book.jsp");
            } else {
                session.setAttribute("message", "Something went wrong.");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("all_new_book.jsp");
            }

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
