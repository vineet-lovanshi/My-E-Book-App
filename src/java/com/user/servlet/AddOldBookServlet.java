/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.BookDaoClass;
import com.DB.DbConnect;
import com.entity.BookDetails;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author jyoti
 */
@MultipartConfig
public class AddOldBookServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String bookName = request.getParameter("bname");
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            String categories = "Old";
            String status = "Active";
            Part part = request.getPart("bimg");
            String fileName = part.getSubmittedFileName();
            
            String email=request.getParameter("user");

            BookDetails bd = new BookDetails(bookName, author, price, categories, status, fileName, email);
            BookDaoClass dao = new BookDaoClass(DbConnect.getConn());

            boolean f = dao.addBooks(bd);
            HttpSession session = request.getSession();
            if (f) {
                // Define the path where you want to save uploaded files
                String uploadPath = "D:\\Full Stack Prparation\\Projects\\Ebook-App1\\web\\book";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                // Save the file
                part.write(uploadPath + File.separator + fileName);
                session.setAttribute("message", "Book Added Successfully.");
                session.setAttribute("messageType", "success");
                response.sendRedirect("sell_book.jsp");
            } else {
                session.setAttribute("message", "Something went wrong.");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("sell_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace(); // For server log
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
