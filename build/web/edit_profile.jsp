<%-- Document : edit_profile Created on : 26 Aug, 2024, 1:28:12 PM Author :
jyoti --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User u1 = (User) session.getAttribute("useObj");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Edit Profile Page</title>
        <%@ include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 p-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center">Edit Profile</h5>
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
                            <form action="UpdateProfileServlet" method="post">
                                <input type="hidden" value="<%= u1.getId()%>" name="id"/>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter full name</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        value="<%= u1.getName()%>"
                                        required="required"
                                        name="name"
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input
                                        type="email"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        value="<%= u1.getEmail()%>"
                                        required="required"
                                        name="email"
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone No</label>
                                    <input
                                        type="number"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        value="<%=u1.getPhono() %>"
                                        required="required"
                                        name="phno"
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        id="exampleInputPassword1"
                                        placeholder="Password"
                                        required="required"
                                        name="password"
                                        />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>

                                <!-- Display the terms and conditions message at the bottom -->
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
