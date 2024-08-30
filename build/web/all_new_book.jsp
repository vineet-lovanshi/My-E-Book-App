<%-- 
    Document   : all_new_book
    Created on : 20 Aug, 2024, 10:18:42 AM
    Author     : jyoti
--%>

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDaoClass"%>
<%@page import="com.DB.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Book</title>
        <%@ include file="all_component/allCss.jsp" %>
        <style>

            .crd-ho:hover {
                background-color: #ececec;
            }
            .col-md-3 {
                font-size: 1em;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7  ; overflow-x: hidden;">
        <%
            User u = (User) session.getAttribute("useObj");
        %>
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container">
            <h3 class="text-center">New Book</h3>
            <%
                if (session.getAttribute("message") != null) {
                    String message = (String) session.getAttribute("message");
                    String messageType = (String) session.getAttribute("messageType");

                    // Set both "terms" and "failed" message types to "danger"
                    if ("terms".equals(messageType) || "danger".equals(messageType)) {
                        messageType = "danger";
                    } else {
                        messageType = "success";
                    }
            %>
            <div class="alert alert-<%= messageType%> text-center" style="background-color: ">
                <%= message%>
            </div>
            <%
                    session.removeAttribute("message");
                    session.removeAttribute("messageType");
                }
            %>
            <div class="row">
                <%
                    BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list = dao.getAllNewtBook();
                    for (BookDetails b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img
                                src="book/<%= b.getPhotoName()%>"
                                alt=""
                                style="width: 150px; height: 200px; border: 1px solid;"
                                class="img-thumblin"
                                />
                            <p> <%=b.getBookName()%> </p>
                            <p style=""><%= b.getAuthor()%></p>
                            <p>Categorie:<%=b.getBookCategory()%></p>
                            <div class="row">
                               <% if (u == null) {%>
                                <a href="login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping  "></i>Add Cart</a>
                                <% } else {%> 
                                <a href="AddCartServlet?bid=<%= b.getBookId()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping  "></i>Add Cart</a>
                                <%  }%>
                                <a href="view_details.jsp?bid=<%= b.getBookId()%> " class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%= b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <hr />
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
