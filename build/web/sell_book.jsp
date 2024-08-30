<%-- Document : sell_book Created on : 26 Aug, 2024, 1:05:30 PM Author : jyoti
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <% User u1 = (User)
session.getAttribute("useObj"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Sell Book Page</title>
    <%@ include file="all_component/allCss.jsp" %>
  </head>
  <body style="background-color: #f0f1f2">
    <%@ include file="all_component/navbar.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-md-4 offset-md-4 p-4">
          <div class="card">
            <div class="card-body">
              <h5 class="text-center">Sell Old Book</h5>
              <% if (session.getAttribute("message") != null) { String message =
              (String) session.getAttribute("message"); String messageType =
              (String) session.getAttribute("messageType"); if
              ("terms".equals(messageType) || "danger".equals(messageType)) {
              messageType = "danger"; } else { messageType = "success"; }%>
              <div class="alert alert-<%= messageType%>"><%= message%></div>
              <% session.removeAttribute("message");
              session.removeAttribute("messageType"); }%>
              <form action="AddOldBookServlet" method="post" enctype="multipart/form-data">
                  <input type="hidden" value="<%= u1.getEmail() %>" name="user" />
                <div class="form-group">
                  <label for="exampleInputEmail1">Book Name*</label>
                  <input
                    type="text"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    placeholder=""
                    required="required"
                    name="bname"
                  />
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Author Name*</label>
                  <input
                    type="text"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    placeholder=""
                    required="required"
                    name="author"
                  />
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Price*</label>
                  <input
                    type="number"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    placeholder=""
                    required="required"
                    name="price"
                  />
                </div>

                <div class="form-group">
                  <label for="exampleInputEmail1">Upload Photo</label>
                  <input
                    type="file"
                    class="form-control-file"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    placeholder=""
                    required="required"
                    name="bimg"
                  />
                </div>

                <button type="submit" class="btn btn-primary">Sell</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr />
    <%@include file="all_component/footer.jsp" %>
  </body>
</html>
