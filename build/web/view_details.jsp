<%-- Document : view_details Created on : 21 Aug, 2024, 10:10:39 AM Author :
jyoti --%> <%@page import="com.entity.BookDetails"%> <%@page
    import="com.DAO.BookDaoClass"%> <%@page import="com.DB.DbConnect"%> <%@page
        contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>View Details Page</title>
                <%@ include file="all_component/allCss.jsp" %>
            </head>
            <body style="background-color: #f0f1f2">
                <%@ include file="all_component/navbar.jsp" %> 
                <% int id
                            = Integer.parseInt(request.getParameter("bid"));
                    BookDaoClass dao = new BookDaoClass(DbConnect.getConn());
                    BookDetails b = dao.getBookbyId(id);%>
                <div class="container p-5">
                    <div class="row">
                        <div class="col-md-6 text-center p-5 border bg-white">
                            <img
                                src="book/<%= b.getPhotoName()%>"
                                height="150px"
                                width="150px"
                                alt=""
                                style="border: 1px solid"
                                />
                            <br />
                            <h4 class="mt-2">
                                Book Name: <span class="text-success"><%= b.getBookName()%></span>
                            </h4>
                            <h4>
                                Author Name: <span class="text-success"><%= b.getAuthor()%></span>
                            </h4>
                            <h4>
                                Cetegory:
                                <span class="text-success"><%= b.getBookCategory()%></span>
                            </h4>
                        </div>
                        <div class="col-md-6 text-center p-5 border bg-white">
                            <h2><%= b.getBookName()%></h2>
                            <h5 class="text-primary">Contact To Seller</h5>
                            <h5 class="text-primary"><i class="fa-solid fa-envelope"></i> EMail: <%=b.getEmail()%></h5>
                            <div class="row p-3">
                                <div class="text-center col-md-4 text-danger p-2">
                                    <i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
                                    <p>Cash On Delivery</p>
                                </div>
                                <div class="text-center col-md-4 text-danger p-2">
                                    <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
                                    <p>Return Available</p>
                                </div>
                                <div class="text-center col-md-4 text-danger p-2">
                                    <i class="fa-solid fa-truck fa-2x"></i>
                                    <p>Free Delivery</p>
                                </div>
                            </div>
                            <% if (b.getBookCategory().equals("Old")) {%>
                            <div class="text-center p-1">
                                <a href="index.jsp" class="btn btn-success"
                                   ><i class="fa-solid fa-cart-shopping "></i> Continue Shopping</a
                                >
                                <a href="" class="btn btn-danger"
                                   ><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a
                                >
                            </div>
                            <% } else {%>
                            <div class="text-center p-1">
                                <a href="" class="btn btn-primary"
                                   ><i class="fa-solid fa-cart-shopping"></i> Add Cart</a
                                >
                                <a href="" class="btn btn-danger"
                                   ><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a
                                >
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
                <hr />
                <%@include file="all_component/footer.jsp" %>
            </body>
        </html>
