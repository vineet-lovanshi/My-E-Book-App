<%-- Document : Setting Created on : 25 Aug, 2024, 12:44:54 PM Author : jyoti
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <% Object userObj =
session != null ? session.getAttribute("useObj") : null; if (userObj == null) {
response.sendRedirect("login.jsp"); return; } %> <% User u1 = (User)
session.getAttribute("useObj"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Setting Page</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
      a {
        text-decoration: none;
        color: black;
      }
      a:hover {
        text-decoration: none;
      }
    </style>
  </head>
  <body style="background-color: #f0f1f2">
    <%@ include file="all_component/navbar.jsp" %>
    <div class="container">
      <h3 class="text-success text-center mt-2">Hello, <%= u1.getName()%></h3>

      <div class="row p-5">
        <div class="col-md-4">
          <a href="sell_book.jsp">
            <div class="card">
              <div class="card-body text-center">
                <div class="text-primary">
                  <i class="fa-solid fa-book-open-reader fa-3x"></i>
                </div>
                <h4 class="p-2">Sell Old Book</h4>
              </div>
            </div>
          </a>
        </div>
        <div class="col-md-4">
          <a href="old_book.jsp">
            <div class="card">
              <div class="card-body text-center">
                <div class="text-primary">
                  <i class="fa-solid fa-book-open-reader fa-3x"></i>
                </div>
                <h4 class="p-2">Old Book</h4>
              </div>
            </div>
          </a>
        </div>
        <div class="col-md-4">
          <a href="edit_profile.jsp">
            <div class="card">
              <div class="card-body text-center">
                <div class="text-primary">
                  <i class="fa-solid fa-file-pen fa-3x"></i>
                </div>
                <h4 class="p-2">Edit Profile</h4>
              </div>
            </div>
          </a>
        </div>
        
        <div class="col-md-6 mt-3">
          <a href="orders.jsp">
            <div class="card">
              <div class="card-body text-center">
                <div class="text-danger">
                  <i class="fa-solid fa-box-open fa-3x"></i>
                </div>
                <h4 class="p-2">My Order</h4>
                <p>Track Your Order</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-md-6 mt-3">
          <a href="helpline.jsp">
            <div class="card">
              <div class="card-body text-center">
                <div class="text-primary">
                  <i class="fa-solid fa-circle-user fa-3x"></i>
                </div>
                <h4 class="p-2">Help Center</h4>
                <p>24 * 7 Service</p>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
    <hr />
    <%@include file="all_component/footer.jsp" %>
  </body>
</html>
