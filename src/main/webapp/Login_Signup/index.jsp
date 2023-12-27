<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="style.css" />
    <title>Login Green SuperMarket </title>
  </head>
  <body>
    <!----------------------- Main Container -------------------------->

    <div class="container d-flex justify-content-center align-items-center min-vh-100">

        <!----------------------- Login Container -------------------------->

           <div class="row border rounded-5 p-3 bg-white shadow box-area">

        <!--------------------------- Left Box ----------------------------->

           <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #7fad39;">

               <div class="featured-image mb-3">
                <img src="images/2.png" class="img-fluid" style="width: 250px;">
               </div>

               <p class="text-white fs-2" style="font-family: Cairo, sans-serif; font-weight: 600;">Explore Freshness</p>

               <small class="text-white text-wrap text-center" style="width: 17rem;font-family: Cairo, sans-serif;">Your one-stop shop for fresh and organic produce.</small>
           </div> 

        <!-------------------- ------ Right Box ---------------------------->
            
           <div class="col-md-6 right-box">
              <div class="row align-items-center">

                    <div class="header-text mb-0">
                         <h2>Hello,Again</h2>
                         <p>We are happy to have you back.</p>
                    </div>
                    <div class="error_message_rext">
                        <%
                            String msg = (String) session.getAttribute("msg");
                            String color = (String) session.getAttribute("color");
                            if(msg!=null){ %>
                        <p style="font-family:Cairo, sans-serif ; color: <%= color %>;"><%= msg %></p>
                        <%
                                session.removeAttribute("msg");
                            }
                        %>
                    </div>

                    <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Email address">
                    </div>

                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Password">
                    </div>

                    <div class="input-group mb-4 d-flex justify-content-between">

                        <div class="form-check ">
                            <input type="checkbox" class="form-check-input" id="formCheck">
                            <label for="formCheck" class="form-check-label text-secondary"><small>Remember Me</small></label>
                        </div>

                        <div class="forgot">
                            <small><a href="#">Forgot Password?</a></small>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <button class="btn btn-lg btn-primary w-100 fs-6" style="background-color: #7fad39; border-color: #7fad39;">Login</button>
                    </div>

                    

                    <div class="row">
                        <small>New member? <a href="SignUP.jsp">Sign Up</a></small>
                    </div>
              </div>
           </div> 
          </div>
        </div>
  </body>
</html>
