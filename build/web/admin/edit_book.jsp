<%-- Document : add_book Created on : 10 Aug, 2024, 10:45:10 PM Author : jyoti
--%> <%@page import="com.entity.BookDetails"%> <%@page
    import="com.DAO.BookDaoClass"%> <%@page import="com.DB.DbConnect"%> <%@page
        contentType="text/html" pageEncoding="UTF-8" %>
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
            <body style="background-color: #f0f1f2">
                <%@ include file="navbar.jsp" %>
                <div class="container p-3">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="text-center">Edit Books</h4>

                                    <% int id = Integer.parseInt(request.getParameter("id"));
                                        BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
                                        BookDetails b = dao.getBookbyId(id);%>
                                    <form action="../EditBookServlet" method="post">
                                        <input type="hidden" name="id" value="<%= b.getBookId()%>" />
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
                                                value="<%=b.getBookName()%>"
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
                                                value="<%=b.getAuthor()%>"
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
                                                value="<%=b.getPrice()%>"
                                                />
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Book Status</label>
                                            <select name="bstatus" id="inputState" class="form-control">
                                                <% if ("Active".equals(b.getStatus())) { %>
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                                <% } else {%>
                                                <option value="Inactive">Inactive</option>
                                                <option value="Active">Active</option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="footer.jsp" %>
            </body>
        </html>
