<%@page import="com.entity.User"%> <% User u2 = (User)
session.getAttribute("useObj"); %>
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
        <a href="index.jsp" class="text-success">
          <i class="fa-solid fa-book text-success"></i> E-Book
        </a>
      </h3>
    </div>
    <div class="col-md-4">
      <form
        class="form-inline my-2 my-lg-0"
        action="search_book.jsp"
        method="post"
      >
        <input
          class="form-control mr-sm-2"
          type="search"
          placeholder="Search"
          aria-label="Search"
          name="search"
        />
        <button class="btn btn-primary my-2 my-sm-0" type="submit">
          Search
        </button>
      </form>
    </div>
    <div class="col-md-5">
      <% if (u2 == null) {%>
      <a href="login.jsp" style="margin-left: 200px" class="btn btn-success"
        ><i class="fa-solid fa-right-to-bracket"></i> Login</a
      >
      <a href="register.jsp" class="btn btn-primary text-white"
        ><i class="fa-solid fa-user-pen"></i> Register</a
      >
      <% } else {%>
      <!-- <a href="" title="View Cart List " class="mr-2 btn btn-danger"
              ><i class="fa-solid fa-bag-shopping"></i
            ></a> --><a
        href="cart.jsp"
        class="tooltip-custom btn btn-danger mr-2"
      >
        <i class="fa-solid fa-bag-shopping"></i>
        <span class="tooltip-text">View Cart</span>
      </a>
      <a href="index.jsp" style="margin-left: 150px" class="btn btn-success"
        ><i class="fa-solid fa-user"></i> <%= u2.getName()%></a
      >
      <a href="LogoutServlet" class="btn btn-primary text-white"
        ><i class="fa-solid fa-right-from-bracket"></i> Logout</a
      >
      <% }%>
    </div>
  </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <!--    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>-->
  <!--    <button
              class="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent"
              aria-expanded="false"
              aria-label="Toggle navigation"
              >
              <span class="navbar-toggler-icon"></span>
          </button>-->

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"
          ><i class="fa-solid fa-house"></i> Home
          <span class="sr-only">(current)</span></a
        >
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_recent_book.jsp"
          ><i class="fa-solid fa-book-open"></i> Recent Book</a
        >
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_new_book.jsp"
          ><i class="fa-solid fa-book-open"></i> New Book</a
        >
      </li>

      <li class="nav-item active">
        <a class="nav-link disabled" href="all_old_book.jsp"
          ><i class="fa-solid fa-book-open"></i> Old Book</a
        >
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
        <i class="fa-solid fa-gear"></i> Setting
      </a>
      <a
        href="helpline.jsp"
        class="btn btn-light my-2 my-sm-0 ml-1"
        type="submit"
        ><i class="fa-solid fa-phone"></i> Contact Us</a
      >
    </form>
  </div>
</nav>
