/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.CartDaoClass;
import com.DAO.OredrDaoClass;
import com.DB.DbConnect;
import com.entity.Cart;
import com.entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jyoti
 */
public class OrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phono = request.getParameter("phno");
            String address = request.getParameter("address");
            String landmark = request.getParameter("landmark");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String payment = request.getParameter("payment");

            String fullAdd = address + " ," + landmark + " ," + city + " ," + state + " ," + pincode;

            CartDaoClass dao = new CartDaoClass(DbConnect.getConn());
            List<Cart> blist = dao.getBookByUser(id);

            if (blist.isEmpty()) {
                session.setAttribute("message", "Please Add Item for Order.");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("cart.jsp");
            } else {
                OredrDaoClass dao2 = new OredrDaoClass(DbConnect.getConn());
                int i = dao2.getOrderNo();
                Order o = null;
                ArrayList orderList = new ArrayList<>();
                for (Cart c : blist) {
                    o = new Order();
                    o.setOrderId("Order-Id: 00" + i);
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhone(phono);
                    o.setAddress(fullAdd);
                    o.setBookName(c.getBookName());
                    o.setAuthor(c.getAuthorName());
                    o.setPrice(c.getPrice() + "");
                    o.setPayment(payment);
                    orderList.add(o);
                    i++;
                }

                if (payment.equals("noselect")) {
                    session.setAttribute("msg", "Choose Your Payment Mehtod.");
                    session.setAttribute("messageType", "danger");
                    response.sendRedirect("cart.jsp");
                } else {
                    boolean f = dao2.saveOrder(orderList);

                    if (f) {
                        response.sendRedirect("order_success.jsp");
                    } else {
                        session.setAttribute("message", "Choose Your Payment Mehtod.");
                        session.setAttribute("messageType", "danger");
                        response.sendRedirect("cart.jsp");
                    }
                }
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
