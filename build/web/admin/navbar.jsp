<%@page import="com.entity.User"%>
<style>
  .text-success:hover {
    text-decoration: none;
  }
</style>

<div
  class="container-fluid"
  style="height: 10px; background-color: #3f51b5"
></div>
<div class="container-fluid p-3" style="background-color: white">
  <div class="row">
    <div class="col-md-3 text-success">
      <h3>
        <a href="../index.jsp" class="text-success">
          <i class="fa-solid fa-book text-success"></i> E-Book
        </a>
      </h3>
    </div>
    <!--        <div class="col-md-6">
                                <form class="form-inline my-2 my-lg-0">
                                    <input
                                        class="form-control mr-sm-2"
                                        type="search"
                                        placeholder="Search"
                                        aria-label="Search"
                                        />
                                    <button class="btn btn-primary my-2 my-sm-0" type="submit">
                                        Search
                                    </button>
                                </form>
                            </div>-->
    <!--        <div class="col-md-3 text-success">
                        <img src="../logo/Logo.book.png" alt="" />
                    </div>-->
    <div class="col-md-3" style="margin-left: 700px">
      <% User user = (User) session.getAttribute("userObj"); if (user != null) {
      if (user.getName().equals("Admin")) { %>
      <!-- Admin-specific options -->
      <a class="btn btn-primary text-white">
        <i class="fa-solid fa-user-cog"></i> Admin Panel
      </a>
      <a
        data-toggle="modal"
        data-target="#exampleModalCenter"
        class="btn btn-danger text-white"
      >
        <i class="fa-solid fa-right-from-bracket"></i> Logout
      </a>
      <% } else { %>
      <!-- Regular user options -->
      <a href="profile.jsp" class="btn btn-success">
        <i class="fa-solid fa-user"></i> Profile
      </a>
      <a href="logout.jsp" class="btn btn-danger text-white">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
      </a>
      <% } } else { %>
      <!-- Options for users who are not logged in -->
      <a href="../login.jsp" class="btn btn-success">
        <i class="fa-solid fa-right-to-bracket"></i> Login
      </a>
      <a href="../register.jsp" class="btn btn-primary text-white">
        <i class="fa-solid fa-user-pen"></i> Register
      </a>
      <% }%>
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
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
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
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"></a>
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent"
    aria-expanded="false"
    aria-label="Toggle navigation"
  >
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp"
          ><i class="fa-solid fa-house"></i> Home
          <span class="sr-only">(current)</span></a
        >
      </li>
    </ul>
    <!-- <form class="form-inline my-2 my-lg-0">
                      <button class="btn btn-light my-2 my-sm-0" type="submit">
                        <i class="fa-solid fa-gear"></i> Setting
                      </button>
                      <button class="btn btn-light my-2 my-sm-0 ml-2" type="submit">
                        <i class="fa-solid fa-phone"></i> Contact Us
                      </button>
                    </form> -->
  </div>
</nav>
