<%-- Document : cart Created on : 22 Aug, 2024, 1:49:40 PM Author : jyoti --%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDaoClass"%>
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
        <title>Cart Page</title>
        <%@ include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2 ; overflow-x: hidden;">
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container">
            <h4 class="text-center"><% if (session.getAttribute("message") != null) {
                    String message
                            = (String) session.getAttribute("message");
                    String messageType
                            = (String) session.getAttribute("messageType");
                    if ("terms".equals(messageType) || "danger".equals(messageType)) {
                        messageType = "danger";
                    } else {
                        messageType = "success";
                    }%>
                <div class="alert alert-<%= messageType%>"><%= message%></div>
                <% session.removeAttribute("message");
                        session.removeAttribute("messageType");
                    } %></h4>
            <div class="row p-2">
                <div class="col-md-6">
                    <div class="card">
                        <div class="car-body">
                            <h3 class="text-center text-success">Your selected items</h3>
                            <table class="table table-striped">

                                <tr class="text-primary" style="background-color: #d5e5f6d0;">
                                    <th >Book Name</th>
                                    <th >Author</th>
                                    <th >Price</th>
                                    <th >Action</th>
                                </tr>

                                <%
                                    User u = (User) session.getAttribute("useObj");
                                    CartDaoClass dao = new CartDaoClass(DbConnect.getConn());
                                    List<Cart> cart = dao.getBookByUser(u.getId());
                                    double totalPrice = 0.00;
                                    for (Cart c : cart) {
                                        totalPrice = c.getTotalPrice();
                                %>

                                <tr>
                                    <th scope="row"><%= c.getBookName()%></th>
                                    <td><%=c.getAuthorName()%></td>
                                    <td><i class="fa-solid fa-indian-rupee-sign"></i> <%= c.getPrice()%></td>
                                    <td>
                                        <a href="RemoveCartServlet?bid=<%=c.getBookId()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCartId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Remove</a>
                                    </td>
                                </tr>

                                <%  }
                                %>

                                <tr class="text-danger" style="background-color: #bee5edda;">
                                    <td><b><i class="fa-solid fa-calculator"></i> Total Price</b></td>
                                    <td></td>
                                    <td></td>
                                    <td><i class="fa-solid fa-indian-rupee-sign"></i> <b><%= totalPrice%></b></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="text-center text-success">Your details for order</h3>
                        <hr />
                        <div class="card-body">
                            <form action="OrderServlet" method="post">
                                <input type="hidden" value="<%=u.getId()%>" name="id"/>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="inputEmail4"
                                            placeholder=""
                                            value="<%=u.getName()%>"
                                            name="name"
                                            required
                                            />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email</label>
                                        <input
                                            type="email"
                                            class="form-control"
                                            id="inputPassword4"
                                            placeholder=""
                                            value="<%=u.getEmail()%>"
                                            name="email"
                                            required
                                            />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone Number</label>
                                        <input
                                            type="number"
                                            class="form-control"
                                            id="inputEmail4"
                                            value="<%=u.getPhono()%>"
                                            name="phno"
                                            required
                                            />

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="inputPassword4"
                                            name="address"
                                            required
                                            />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" class="form-control" id="inputEmail4" name="landmark" required/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="inputPassword4"
                                            name="city"
                                            required
                                            />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">State</label>
                                        <input type="text" class="form-control" id="inputEmail4" name="state" required/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Pin code</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="inputPassword4"
                                            name="pincode"
                                            required
                                            />
                                    </div>
                                </div>
                                <div class="form-group col-md-14">
                                    <label for="inputState">Payment Mode</label>
                                    <select id="inputState" class="form-control" name="payment">
                                        <option value="noselect" selected>--Select--</option>
                                        <option value="COD">Cash on Delivery</option>
                                    </select>
                                </div>
                                <% if (session.getAttribute("msg") != null) {
                                        String message
                                                = (String) session.getAttribute("msg");
                                        String messageType
                                                = (String) session.getAttribute("messageType");
                                        if ("terms".equals(messageType) || "danger".equals(messageType)) {
                                            messageType = "danger";
                                                     } else {
                                                         messageType = "success";
                                                     }%>
                                <div class="alert alert-<%= messageType%>"><%= message%></div>
                                <% session.removeAttribute("msg");
                                        session.removeAttribute("messageType");
                                    }%>
                                <div class="text-center">
                                    <button class="btn btn-warning">
                                        <i class="fa-solid fa-cart-plus"></i> Order Now
                                    </button>
                                    <a href="index.jsp" class="btn btn-success text-white"
                                       ><i class="fa-solid fa-right-long"></i> Continue Shopping</a
                                    >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
