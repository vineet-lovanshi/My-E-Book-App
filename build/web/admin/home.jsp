<%-- Document : home Created on : 9 Aug, 2024, 11:21:54 PM Author : jyoti --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@page
    import="javax.servlet.http.HttpSession"%> 
    <% Object userObj = session != null
                ? session.getAttribute("userObj") : null;
        if (userObj == null) {
            response.sendRedirect("../login.jsp");
        return;
    }
   %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Admin: Home</title>
            <%@ include file="allCss.jsp" %>
            <style>
                a {
                    text-decoration: none;
                    color: black;
                }
                a:hover {
                    text-decoration: none;
                    color: black;
                }
                .crd-ho:hover {
                    background-color: #f4f4f4;
                    transition: color 0.4s ease, background-color 0.4s ease;
                }
            </style>
        </head>

        <body style="background-color: #f0f1f2">
            <%@ include file="navbar.jsp" %>
            <div class="container">
                <div class="row p-5">
                    <div class="col-md-3">
                        <a href="add_book.jsp">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                    <i class="fa-solid fa-square-plus fa-3x text-primary"></i><br />
                                    <h4>Add Books</h4>
                                    ------------
                                </div>
                            </div></a
                        >
                    </div>
                    <div class="col-md-3">
                        <a href="all_book.jsp">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                    <i class="fa-solid fa-book-open-reader fa-3x text-danger"></i
                                    ><br />
                                    <h4>All Books</h4>
                                    ------------
                                </div>
                            </div></a
                        >
                    </div>
                    <div class="col-md-3">
                        <a href="orders.jsp">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                    <i class="fa-solid fa-box-open fa-3x text-warning"></i><br />
                                    <h4>Orders</h4>
                                    ------------
                                </div>
                            </div></a
                        >
                    </div>
                    <div class="col-md-3">
                        <a data-toggle="modal" data-target="#exampleModalCenter">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                    <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i
                                    ><br />
                                    <h4>Logout</h4>
                                    ------------
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!--logout model -->

            <!-- Modal -->
            <div
                class="modal fade"
                id="exampleModalCenter"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalCenterTitle"
                aria-hidden="true"
                >
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <h4>Do you want logout</h4>
                                <button
                                    type="button"
                                    class="btn btn-secondary"
                                    data-dismiss="modal"
                                    >
                                    <i class="fa-regular fa-circle-xmark"></i>
                                    Close
                                </button>
                                <a
                                    href="../LogoutServlet"
                                    type="button"
                                    class="btn btn-primary text-white"
                                    >
                                    <i class="fa-solid fa-check"></i> Logout
                                </a>
                            </div>
                        </div>
                        <div class="modal-footer"></div>
                    </div>
                </div>
            </div>
            <!--end logout model-->
            <div style="margin-top: 280px"><%@include file="footer.jsp" %></div>
        </body>
    </html>
