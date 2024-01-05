<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.List" %>
<%@ page import="com.green.greensupermarket.entity.Product" %>
<%@ page import="com.green.greensupermarket.util.ProductUtil" %>


<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>

    <%
        String message = null;
        String sessionID = null;
        String userType = null;
        String currentUser = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("msg")) message = cookie.getValue();
                if(cookie.getName().equals("userType")) userType = cookie.getValue();
                if(cookie.getName().equals("customer")) currentUser = cookie.getValue();
                if(cookie.getName().equals("admin")) currentUser = cookie.getValue();
//
//                if(userType.equals("customer")){
//                    if(cookie.getName().equals("customer")) currentUser = cookie.getValue();
//                }else if (userType.equals("admin")){
//                    if(cookie.getName().equals("admin")) currentUser = cookie.getValue();
//
//                }
            }
            request.setAttribute("currentUser",currentUser);

        }

        List<Product> featuredProducts = ProductUtil.getFeaturedProducts();
        request.setAttribute("featuredProducts", featuredProducts);

        List<Product> allProducts = ProductUtil.allProducts();
        request.setAttribute("allProducts", allProducts);



    %>

<%--    <c:set var="currentUser" value="${}" >--%>
<%--    <%=message%><%=sessionID%><%=userType%><%=currentUser%>--%>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="shop-grid.jsp">Shop</a></li>

                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> greensupermartket.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> greensupermarket.com</li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">

                            </div>

                            <div class="header__top__right__auth">


                                <c:choose>
                                    <c:when test="${empty currentUser}">
                                        <a href="Login_Signup/index.jsp"> <i class="fa fa-user"> </i> Login</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/logout"> <i class="fa fa-user"> </i> ${currentUser}</a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu text-center">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="shop-grid.jsp">Shop</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="shoping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span id="itemCount">0</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>Rs. </span> <span id="totalCost">0</div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul id="categories">

                            <c:forEach var="products" items="${allProducts}" >
                                <li><a href="/category?category=${products.category}">${products.category}</a></li>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+94 5678 998</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">
                            <h5><a href="#">Fresh Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
                            <h5><a href="#">Dried Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
                            <h5><a href="#">Vegetables</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->


    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <c:forEach var="product" items="${featuredProducts}">
                                <li data-filter=".${product.category}">${product.category}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">


                <c:forEach var="product" items="${featuredProducts}">
                    <div class="col-lg-3 col-md-4 col-sm-6 mix ${product.category}">
                        <div class="featured__item">
                            <div class="featured__item__pic set-bg" data-setbg="uploads/${product.image}">
                                <ul class="featured__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li onclick="addToCart(${product.id},'${product.item_name}',${product.price}, 1)"><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="featured__item__text">
                                <h6><a href="#">${product.item_name}</a></h6>
                                <h5>RS ${product.price}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: NSBM Green Univercity</li>
                            <li>Phone: +94 5678 998</li>
                            <li>Email: greensupermart@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Shop</a></li>

                        </ul>
                        <ul>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Shop Details</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p>
                            Copyright © Green Super Market, All Right Reserved |Designed By <a href="#aboutUs" target="_blank">Group A7</a> For Software Engineering 2 Module.</p></div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>


        <script>
            var listForRemove = [];
            var listOfUniqe = [];
            $('#categories li').each(function () {

            var text = $(this).text().trim();

            if (listOfUniqe.indexOf(text) === -1)
            listOfUniqe.push(text);
            else
            listForRemove.push($(this));
        });

            $(listForRemove).each(function () { $(this).remove(); });
    </script>


    <script>
        const itemCountLabel = document.getElementById("itemCount");
        const totalPriceLabel = document.getElementById("totalCost");

        let cart = [];
        let currentNumberOfItems = 0;
        let currentTotalPrice = 0;

        if (localStorage.getItem("cart")) {
            // alert("cart is present");
            cart = JSON.parse(localStorage.getItem("cart"));
        } else {
            // alert("cart is not present");
        }

        if (localStorage.getItem("currentNumberOfItems")) {
            currentNumberOfItems = parseInt(
                localStorage.getItem("currentNumberOfItems")
            );
            itemCountLabel.innerText = currentNumberOfItems;
        } else {
            itemCountLabel.innerText = currentNumberOfItems;
        }

        if (localStorage.getItem("currentTotalPrice")) {
            currentTotalPrice = parseInt(localStorage.getItem("currentTotalPrice"));
            totalPriceLabel.innerText = currentTotalPrice;
        } else {
            totalPriceLabel.innerText = currentTotalPrice;
        }

        function addToCart(id, name, price, amount) {

            // have the change the function here

            let obj = {
                id,
                name,
                price,
                amount
            };


            const existingObjectIndex = cart.findIndex((item) => item.id === obj.id && item.price === obj.price);
            if (existingObjectIndex !== -1) {
                // If the object exists, update the amount
                cart[existingObjectIndex].amount += obj.amount;
            } else {
                // If the object doesn't exist, push it to the array
                cart.push(obj);
            }

            // cart.push(product);

            currentNumberOfItems++;
            currentTotalPrice = currentTotalPrice + price;
            itemCountLabel.innerText = currentNumberOfItems;
            totalPriceLabel.innerText = currentTotalPrice;
            // setting items to the local storage
            localStorage.setItem("cart", JSON.stringify(cart));
            localStorage.setItem("currentNumberOfItems", currentNumberOfItems);
            localStorage.setItem("currentTotalPrice", currentTotalPrice);
        }
    </script>




</body>

</html>