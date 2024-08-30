<%-- Document : old_book Created on : 27 Aug, 2024, 3:15:57 PM Author : jyoti
--%> <%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDaoClass"%>
<%@page import="com.DB.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Old Book Page</title>
        <%@ include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@ include file="all_component/navbar.jsp" %>

        <div class="container p-4">
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
            <div class="alert alert-<%= messageType%>">
                <%= message%>
            </div>
            <%
                    session.removeAttribute("message");
                    session.removeAttribute("messageType");
                }
            %>
            <table class="table table-striped">

                <tr class="bg-primary text-white">
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Action</th>
                </tr>

                <%
                    User u = (User) session.getAttribute("useObj");
                    String email = u.getEmail();
                    BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
                    List<BookDetails> list = dao.getUserOldBook(email, "Old");
                    for (BookDetails b : list) {%> 


                <tr>
                    <td><%=b.getBookName()%></td>
                    <td><%= b.getAuthor()%></td>
                    <td><%= b.getPrice()%></td>
                    <td><%= b.getBookCategory()%></td>
                    <td>
                        <a href="DeleteOldBookServlet?em=<%= email%>&&bid=<%= b.getBookId() %>" class="btn btn-sm btn-danger"
                           ><i class="fa-solid fa-trash-can"></i> Delete</a
                        >
                    </td>
                </tr>

                <%}%>
            </table>
        </div>
    </body>
</html>
