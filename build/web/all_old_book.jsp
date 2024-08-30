<%-- 
    Document   : all_old_book
    Created on : 20 Aug, 2024, 10:18:59 AM
    Author     : jyoti
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDaoClass"%>
<%@page import="com.DB.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Old Book</title>
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
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                <%
                    BookDaoClass dao3 = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list3 = dao3.getAllOldBook();
                    for (BookDetails b : list3) {
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
                            <div class="row">
                                <a href="view_details.jsp?bid=<%= b.getBookId()%> " class="btn btn-success btn-sm ml-5">View Details</a>
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
