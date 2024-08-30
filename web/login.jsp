<%-- Document : login Created on : 8 Aug, 2024, 3:48:49 PM Author : jyoti --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>EBook: Login</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Login here</h4>
                            <% if (session.getAttribute("message") != null) {
                                    String message
                                            = (String) session.getAttribute("message");
                                    String messageType
                                            = (String) session.getAttribute("messageType");
                                    if ("terms".equals(messageType) || "failed".equals(messageType)) {
                          messageType = "danger";
                      }%>
                            <div class="alert alert-<%= messageType%>"><%= message%></div>
                            <% session.removeAttribute("message");
                      session.removeAttribute("messageType");
                  } %>
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

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input
                                        type="email"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        required="required"
                                        name="email"
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        id="exampleInputPassword1"
                                        required="required"
                                        name="password"
                                        />
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button
                                    ><br />
                                    <a href="register.jsp">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 200px">
            <%@include file="all_component/footer.jsp" %>
        </div>
    </body>
</html>
