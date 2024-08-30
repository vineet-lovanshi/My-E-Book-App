<%-- Document : order_success Created on : 29 Aug, 2024, 11:32:40 AM Author :
jyoti --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Order Success</title>

    <%@ include file="all_component/allCss.jsp" %>
  </head>
  <body style="background-color: #f0f1f2">
    <%@ include file="all_component/navbar.jsp" %>
    <div class="container text-center mt-3">
      <i class="fa-solid fa-circle-check fa-5x text-success"></i>
      <h1>Thank You</h1>
      <h2>Your Order Successfully</h2>
      <h4>With in 7 Days Your Product will we Delivered in your Address</h4>
      <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
      <a href="orders.jsp" class="btn btn-danger mt-3">View Order</a>
    </div>
    <div style="margin-top: 220px">
      <hr />
      <%@include file="all_component/footer.jsp" %>
    </div>
  </body>
</html>
