<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="style.css" />
    <title>SignUp|Green Supermarket </title>
  </head>
  <body>
    <!----------------------- Main Container -------------------------->

    <div class="container d-flex justify-content-center align-items-center min-vh-100">

        <!----------------------- Login Container -------------------------->

           <div class="row border rounded-5 p-3 bg-white shadow box-area">

        <!--------------------------- Left Box ----------------------------->

           <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background:#7fad39">

               <div class="featured-image mb-3">
                <img src="images/2.png" class="img-fluid" style="width: 250px;">
               </div>

               <p class="text-white fs-2" style="font-family: Cairo, sans-serif; font-weight: 600;">Fresh and Green</p>

               <small class="text-white text-wrap text-center" style="width: 17rem;font-family: Cairo, sans-serif;">Join us and experience the best of fresh and organic products.</small>
           </div> 

        <!-------------------- ------ Right Box ---------------------------->

<!--           <form method="post" action="../userVerify">-->

           <div class="col-md-6 right-box">
              <div class="row align-items-center">

                    <div class="header-text mb-0">
                         <h2>Welcome to Green Supermarket!</h2>
                         <p>Sign up to enjoy fresh and healthy groceries delivered to your doorsteps.</p>
                    </div>
                    <div class="error_message_rext">

                        <%
                            String msg = (String) session.getAttribute("msg");
                            if(msg!=null){ %>
                        <p style="font-family:Cairo, sans-serif ; color: red;"><%= msg %></p>
                        <%
                                session.removeAttribute("msg");
                            }
                        %>

                    </div>


                  <form method="post" action="../userVerify">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Create Username" name="username" required>
                    </div>

                    <div class="input-group mb-3">
                        <input type="email" class="form-control form-control-lg bg-light fs-6" placeholder="Email address" name="email" required>
                    </div>

                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Password" name="password" required>
                    </div>

                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Conform Password" name="confirmPassword" required>
                    </div>

                    <div class="input-group mb-4 d-flex justify-content-between">

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="formCheck">
                            <label for="formCheck" class="form-check-label text-secondary"><small>I agree terms and conditions.</small></label>
                        </div>

                    </div>

                    <div class="input-group mb-3">
                        <button class="btn btn-lg btn-primary w-100 fs-6" style="background-color: #7fad39;border-color:#7fad39 ;" type="submit">Signup</button>
                    </div>
                    <div class="row">
                        <small>Shopped with us before? Log in with your details <a href="index.jsp">Login</a></small>
                    </div>

                  </form>

     
              </div>
           </div>

<!--           </form>-->


          </div>
        </div>
  </body>
</html>
