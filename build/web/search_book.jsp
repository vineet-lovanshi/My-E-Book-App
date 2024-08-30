<%-- Document : all_recent_book Created on : 20 Aug, 2024, 10:17:56 AM Author :
jyoti --%> <%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDaoClass"%>
<%@page import="com.DB.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>All Recent Book</title>
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
    <body style="background-color: #f7f7f7">
        <%
            User u = (User) session.getAttribute("useObj");
        %>
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container">
            <h3 class="text-center">Search Book</h3>
            <div class="row">
                <%
                    String chr=request.getParameter("search");
                    BookDaoClass dao2 = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list2 = dao2.getSearchBook(chr);
                    for (BookDetails b : list2) {
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
                            <p ><%= b.getAuthor()%></p>
                            <p>Categorie:<%=b.getBookCategory()%></p>
                            <% if (b.getBookCategory().equals("Old")) {%>
                            <div class="row">
                                <a href="view_details.jsp?bid=<%= b.getBookId()%> " class="btn btn-success btn-sm ml-5">View Details</a>
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
        </div>
        
    </body>
</html>
