<%-- Document : all_book Created on : 10 Aug, 2024, 10:56:17 PM Author : jyoti
--%> <%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.OredrDaoClass"%>
<%@page import="com.DB.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    Object userObj = session != null ? session.getAttribute("userObj") : null;
    if (userObj == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin: All Orders</title>
        <%@ include file="allCss.jsp" %>
    </head>
    <body style="  overflow-x: hidden;" >
        <%@ include file="navbar.jsp" %>
        <h3 class="text-center">Hello Admin</h3>
        <table class="table table-striped">

            <tr class="bg-primary text-white">
                <th scope="col">Order Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Phone No</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
            <%
                OredrDaoClass dao = new OredrDaoClass(DbConnect.getConn());
                List<Order> alist = dao.getAllOrder();
                for (Order o : alist) {%>

            <tr>
                <th scope="row"><%=o.getOrderId()%></th>
                <td><%=o.getUserName()%></td>
                <td><%=o.getEmail() %></td>
                <td><%=o.getAddress()%></td>
                <td><%=o.getPhone()%></td>
                <td><%=o.getBookName()%></td>
                <td><%=o.getAuthor()%></td>
                <td><%=o.getPrice()%></td>
                <td><%=o.getPayment()%></td>
            </tr>

            <% }
            %>

        </table>
        <div style="margin-top: 280px"><%@include file="footer.jsp" %></div>
    </body>
</html>
