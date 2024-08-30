<%-- Document : user_address Created on : 26 Aug, 2024, 1:38:21 PM Author :
jyoti --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User Address Page</title>
    <%@ include file="all_component/allCss.jsp" %>
  </head>
  <body style="background-color: #f0f1f2">
    <%@ include file="all_component/navbar.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-md-6 offset-md-3 mt-5">
          <div class="card">
            <div class="card-body">
              <h4 class="text-center">Add Address</h4>
              <form action="">
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="inputPassword4">Address</label>
                    <input
                      type="text"
                      class="form-control"
                      id="inputPassword4"
                    />
                  </div>
                  <div class="form-group col-md-6">
                    <label for="inputEmail4">Landmark</label>
                    <input type="text" class="form-control" id="inputEmail4" />
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-4">
                    <label for="inputPassword4">City</label>
                    <input
                      type="text"
                      class="form-control"
                      id="inputPassword4"
                    />
                  </div>
                  <div class="form-group col-md-4">
                    <label for="inputEmail4">State</label>
                    <input type="text" class="form-control" id="inputEmail4" />
                  </div>
                  <div class="form-group col-md-4">
                    <label for="inputPassword4">Pin code</label>
                    <input
                      type="text"
                      class="form-control"
                      id="inputPassword4"
                    />
                  </div>
                </div>
                <div class="text-center">
                  <button class="text-center btn btn-warning">
                    Add Address
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div style="margin-top: 180px">
      <hr />
      <%@include file="all_component/footer.jsp" %>
    </div>
  </body>
</html>
