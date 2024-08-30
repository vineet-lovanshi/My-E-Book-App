<%-- Document : add_book Created on : 10 Aug, 2024, 10:45:10 PM Author : jyoti
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Admin: Add Books</title>
        <%@ include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2 ; overflow-x: hidden;">
        <%@ include file="navbar.jsp" %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
                            <% if (session.getAttribute("message") != null) {
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
                                }%>
                            <form
                                action="../BookAddServlet"
                                method="post"
                                enctype="multipart/form-data"
                                >
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
                                    <label for="exampleInputPassword1">Book Categories</label>
                                    <select name="btype" id="inputState" class="form-control">
                                        <option selected>---Select---</option>
                                        <option value="New">New Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Book Status</label>
                                    <select name="bstatus" id="inputState" class="form-control">
                                        <option selected>---Select---</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
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

                                <button type="submit" class="btn btn-primary">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
