<%-- Document : all_book Created on : 10 Aug, 2024, 10:56:17 PM Author : jyoti
--%> <%@page import="com.DB.DbConnect,com.entity.BookDetails"%>
<%@page import="com.DAO.BookDaoClass, java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin: All Books</title>
        <%@ include file="allCss.jsp" %>
    </head>
    <body style=" overflow-x: hidden;">
        <%@ include file="navbar.jsp" %>
        <h3 class="text-center">Hello Admin</h3>
        <h4 class="text-center"><% if (session.getAttribute("message") != null) { String message =
              (String) session.getAttribute("message"); String messageType =
              (String) session.getAttribute("messageType"); if
              ("terms".equals(messageType) || "danger".equals(messageType)) {
              messageType = "danger"; }else{ messageType="success"; } %>
              <div class="alert alert-<%= messageType%>"><%= message%></div>
              <% session.removeAttribute("message");
              session.removeAttribute("messageType"); } %></h4>
        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>

            <tbody>
                <%
                    BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list = dao.getAllBook();
                    for (BookDetails b : list) {
                %>
                <tr>
                    <td><%= b.getBookId()%></td>
                    <td><img src="../book/<%= b.getPhotoName()%>" style="width: 50px; height: 50px;"></td>
                    <td><%= b.getBookName()%></td>
                    <td><%= b.getAuthor()%></td>
                    <td><%= b.getPrice()%></td>
                    <td><%= b.getBookCategory()%></td>
                    <td><%= b.getStatus()%></td>
                    <td>
                        <a href="edit_book.jsp?id=<%= b.getBookId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>  Edit</a>
                        <a href="../BookDeleteServlet?id=<%= b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>  Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div ><%@include file="footer.jsp" %></div>
    </body>
</html>
