<%-- Document : index Created on : 5 Aug, 2024, 3:35:43 PM Author : jyoti --%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDaoClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection, com.DB.DbConnect" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Ebook: Index</title>
        <%@ include file="all_component/allCss.jsp" %>
        <style>
            .back-img {
                background: url("img/Screenshot\ 2024-08-05\ 230341.png");
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .crd-ho:hover {
                background-color: #ececec;
            }
            .col-md-3 {
                font-size: 1em;
            }
        </style>
    </head>
    <body style="background-color: #f0f1f2  ; overflow-x: hidden;">
        <%
            User u = (User) session.getAttribute("useObj");
        %>
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container-fluid back-img">
            <h2 class="text-center text-white">EBook Management System</h2>
        </div>

        <!-- Start Recent Book -->
        <hr />
        <div class="container">
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                <%
                    BookDaoClass dao2 = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list2 = dao2.getRecentBook();
                    for (BookDetails b : list2) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img
                                src="book/<%= b.getPhotoName()%>"
                                alt=""
                                style="width: 150px; height: 200px; border: 1px solid;"
                                class="img-thumblin"
                                />
                            <p> <%=b.getBookName()%> </p>
                            <p><%= b.getAuthor()%></p>
                            <p>Categorie:<%=b.getBookCategory()%></p>
                            <% if (b.getBookCategory().equals("Old")) {%>
                            <div class="row">
                                <a href="view_details.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%= b.getPrice()%></a>
                            </div>
                            <% } else {%>
                            <div 
                                class="row">
                                <% if (u == null) {%>
                                <a href="login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping  "></i>Add Cart</a>
                                <% } else {%> 
                                <a href="AddCartServlet?bid=<%= b.getBookId()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping  "></i>Add Cart</a>
                                <%  }%> <a 
                                    href = "view_details.jsp?bid=<%= b.getBookId()%> " class="btn btn-success btn-sm ml-1">View Details</a
                                > <a 
                                    href = "" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign mr-1"></i ><%=b.getPrice()%></a>
                            </div>
                            <% } %>

                        </div>
                    </div>
                </div>
                <% }%>

            </div>
            <div class="text-center mt-2">
                <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-eye"></i> View All</a>
            </div>
        </div>
        <!-- End Recent Book -->
        <hr />
        <!-- Start New Book -->
        <div class="container">
            <h3 class="text-center">New Book</h3>
            <div class="row">
                <%
                    BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list = dao.getNewBook();
                    for (BookDetails b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img
                                src="book/<%= b.getPhotoName()%>"
                                alt=""
                                style="width: 150px; height: 200px; border: 1px solid;"
                                class="img-thumblin"
                                />
                            <p> <%=b.getBookName()%> </p>
                            <p><%= b.getAuthor()%></p>
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
            <div class="text-center mt-2">
                <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-eye"></i> View All</a>
            </div>

        </div>
        <!-- End New Book -->
        <hr />
        <!-- Start Old Book -->
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                <%
                    BookDaoClass dao3 = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list3 = dao3.getOldtBook();
                    for (BookDetails b : list3) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img
                                src="book/<%= b.getPhotoName()%>"
                                alt=""
                                style="width: 150px; height: 200px; border: 1px solid;"
                                class="img-thumblin"
                                />
                            <p> <%=b.getBookName()%> </p>
                            <p><%= b.getAuthor()%></p>
                            <p>Categorie:<%=b.getBookCategory()%></p>
                            <div class="row">
                                <a href="view_details.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%= b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>

            </div>
            <div class="text-center mt-2">
                <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-eye"></i> View All</a>
            </div>
        </div>
        <!-- End Old Book -->
        <hr />
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
