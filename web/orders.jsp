<%-- Document : orders Created on : 26 Aug, 2024, 2:10:02 PM Author : jyoti --%>
<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.OredrDaoClass"%>
<%@page import="com.DB.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Object userObj = session != null
            ? session.getAttribute("useObj") : null;
    if (userObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Order page</title>
        <%@ include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container p-2">
            <h3 class="text-center text-primary">Your Orders</h3>
            <table class="table table-striped mt-3">

                <tr class="bg-primary text-white">
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>

                <%
                    User u = (User) session.getAttribute("useObj");
                    OredrDaoClass dao = new OredrDaoClass(DbConnect.getConn());
                    List<Order> olist = dao.getOrder(u.getEmail());
                    for (Order o : olist) {

                %>

                <tr>
                    <th scope="row"><%=o.getOrderId()%></th>
                    <td><%= o.getUserName()%></td>
                    <td><%= o.getBookName()%></td>
                    <td><%=o.getAuthor()%></td>
                    <td><%=o.getPrice()%></td>
                    <td><%= o.getPayment()%></td>
                </tr>

                <%}%>
            </table>
        </div>
    </body>
</html>
