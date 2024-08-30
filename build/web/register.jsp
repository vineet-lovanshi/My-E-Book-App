<%-- Document : register Created on : 8 Aug, 2024, 2:54:29 PM Author : jyoti --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>EBook: register</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>

    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Registration here</h4>
                            <!-- Display Success/Failure Messages -->

                            <%
                                if (session.getAttribute("message") != null) {
                                    String message = (String) session.getAttribute("message");
                                    String messageType = (String) session.getAttribute("messageType");

                                    // Set both "terms" and "failed" message types to "danger"
                                    if ("terms".equals(messageType) || "danger".equals(messageType)) {
                                        messageType = "danger";
                                    }else{
                                         messageType="success";
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
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter full name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                           placeholder="Enter name" required="required" name="name" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                           placeholder="Enter email" required="required" name="email" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone No</label>
                                    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                           placeholder="Enter phone" required="required" name="phno" />
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"
                                               required="required" name="password" />
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" />
                                        <label class="form-check-label" for="exampleCheck1">Agree terms & condition</label>
                                    </div>
                                    <!-- Display the terms and conditions message at the bottom -->

                                    <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
        <!-- JavaScript to Clear Messages on Refresh -->
    </script>
</body>

</html>