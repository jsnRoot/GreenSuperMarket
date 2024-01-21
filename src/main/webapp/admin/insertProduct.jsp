
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-light navbar-light">
            <a href="index.html" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ADMIN</h3>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">Jhon Doe</h6>
                    <span>Admin</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="../admin/" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-shopping-basket" aria-hidden="true"></i>Products</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="insertProduct.jsp" class="dropdown-item">Add Products</a>
                        <a href="../updateProductTable" class="dropdown-item">Update Products</a>
                        <a href="../deleteProductTable" class="dropdown-item">Delete Products</a>
                        <a href="../viewProductTable" class="dropdown-item">View Products</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-truck me-2"></i>Orders</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="signin.html" class="dropdown-item">Pending Orders</a>
                        <a href="signup.html" class="dropdown-item">Cancel Orders</a>
                    </div>
                </div>
                <a href="../admin/" class="nav-item nav-link "><i
                        class="fa fa-envelope me-2"></i>Comments
                </a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <!--                <form class="d-none d-md-flex ms-4">-->
            <!--                    <input class="form-control border-0" type="search" placeholder="Search">-->
            <!--                </form>-->
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">John Doe</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">My Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="#" class="dropdown-item">Log Out</a>
                    </div>

                </div>
            </div>
        </nav>
        <!-- Navbar End -->



        <div class=" rounded h-100 p-4">
            <h6 class="mb-4">Add new product</h6>

            <%
                String msg = (String) session.getAttribute("msg");
                if(msg!=null){ %>
                <%= msg %>
            <%
                    session.removeAttribute("msg");
                }
            %>

            <form method="post" action="../addProduct" enctype="multipart/form-data">

            <div class="form-floating mb-3">
                <input type="Text" class="form-control" id="itemName" placeholder="Item Name" name="itemName">
                <label for="itemName">Item Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="Text" class="form-control" id="stockAmount" placeholder="Stock Amount in Kg" name="stockAmount">
                <label for="stockAmount">Stock Amount in Kg</label>
            </div>

            <div class="form-floating mb-3">
                <input type="Text" class="form-control" id="weight" placeholder="Weight 1Kg" name="weight" disabled value="1">
                <label for="weight">Weight 1Kg</label>
            </div>

            <div class="form-floating mb-3">
                <input type="Text" class="form-control" id="price" placeholder="Price in Rs for 1Kg" name="price">
                <label for="price">Price in Rs for 1Kg</label>
            </div>

            <div class="form-floating mb-3">
                <select class="form-select" id="category" aria-label="Floating label select example" name="category">
                    <option value="Vegetables" selected="Vegetables">Vegetables</option>
                    <option value="Fruits">Fruits</option>
                    <option value="Meat">Meat</option>
                    <option value="Fish">Fish</option>

                </select>
                <label for="category">Category</label>
            </div>

            <div class="form-floating mb-3">
                <input type="file" class="form-control" id="image" placeholder="Image" name="image">
                <label for="image">Image</label>
            </div>

            <div class="form-floating mb-3">
                <select class="form-select" id="tags" aria-label="Floating label select example" name="tags">
                    <option value="Featured" selected="featured">Featured</option>
                    <option value="Discount">Discount</option>
                    <option value="None">None</option>
                </select>
                <label for="tags">Tags</label>
            </div>



            <div class="form-floating mb-3">
                <textarea class="form-control" placeholder="Leave a comment here" id="comments" style="height: 150px;" name="comment"></textarea>
                <label for="comments">Comments</label>
            </div>



            <div class="form-floating mb-3">
                <input type="Text" class="form-control" id="discounts" placeholder="Discount" name="discounts">
                <label for="discounts">Discounts</label>
            </div>

            <div class="form-floating mb-3">
                <select class="form-select" id="availability" aria-label="Floating label select example" name="availability">
                    <option value="INSTOCK" selected>INSTOCK</option>
                    <option value="OUTSTOCK">OUTSTOCK</option>
                </select>
                <label for="availability">Availability</label>
            </div>

            <button class="btn btn-primary w-100" type="submit">Submit</button>

            </form>
        </div>





        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Green Super Market</a>, All Right Reserved.
                    </div>
                    <div class="col-12 col-sm-6 text-center text-sm-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a href="https://htmlcodex.com">Group A7</a>
                        </br>
                        For <a class="border-bottom" href="https://themewagon.com" target="_blank">Software Engineering 2 Module</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/chart/chart.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>