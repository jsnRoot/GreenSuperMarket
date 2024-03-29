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

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
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
                <li class="active"><a href="index.jsp">Home</a></li>
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
                <li><i class="fa fa-envelope"></i> greensupermarket.com</li>
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
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> greensupermarket.com</li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">

                            </div>
                            <div class="header__top__right__language">

                            </div>
                            <div class="header__top__right__auth">
                                <a href="Login_Signup/index.jsp"><i class="fa fa-user"></i> Login</a>
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
                        <a href="index.jsp"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu text-center">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active"><a href="shop-grid.jsp">Shop</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>

                            <li><a href="shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span id="itemCount">0</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>Rs. </span> <span id="totalCost"></div>
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
    <section class="hero hero-normal">
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
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tableSection">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
<%--                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>--%>
<%--                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>--%>
<%--                            Upadate Cart</a>--%>
                    </div>
                </div>
                <div class="col-lg-6">
<%--                    <div class="shoping__continue">--%>
<%--                        <div class="shoping__discount">--%>
<%--                            <h5>Discount Codes</h5>--%>
<%--                            <form action="#">--%>
<%--                                <input type="text" placeholder="Enter your coupon code">--%>
<%--                                <button type="submit" class="site-btn">APPLY COUPON</button>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>Rs. <span id="subtotal">454.98</span> </span> </li>
                            <li>Total <span>Rs. <span id="total">454.98</span> </span> </li>
                        </ul>
                        <a class="primary-btn"
                           onclick="sendPay()">PROCEED TO
                            CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="index.jsp"><img src="img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: NSBM Green Univercity, Homagama</li>
                            <li>Phone: +94 567 8899</li>
                            <li>Email: greensupermarket@gmail.com</li>
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
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->

<script>
    const itemCountLabel = document.getElementById("itemCount");
    const totalPriceLabel = document.getElementById("totalCost");

    const subtotal = document.getElementById("subtotal");
    const total = document.getElementById("total");


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
        subtotal.innerText = currentTotalPrice;
        total.innerText = currentTotalPrice;
    } else {
        totalPriceLabel.innerText = currentTotalPrice;
    }

    console.log(cart);

    let tableOutput = cart.map((item)=>{
        return '<tr class="'+ item.id +'">' +
            '<td class="shoping__cart__item">' +
            '   <img src="uploads/'+item.image+'" alt="" /><h5> ' + item.name + '</h5>' +
            '</td>' +
            '<td class="shoping__cart__price">Rs. <span class="item-price" id="'+ item.id +'">' + item.price +'</span></td>' +
            '<td class="shoping__cart__quantity">' +
            '   <div class="quantity"><div class="pro-qty" id="'+ item.id +'"><input type="text" value="'+ item.amount +'" class="box" id="'+item.id+'"/></div></div>' +
            '</td>' +
            '<td class="shoping__cart__total">Rs. <span class="total-price" id="'+ item.id +'">' + item.price * item.amount + '</span> ' +
            '</td>' +
            '<td class="shoping__cart__item__close"><span class="icon_close" id="'+ item.id +'"></span></td>' +
            '</tr>'
    }).join('');
    console.log(tableOutput);

    const dataBinding = (cart) =>{
        let x = document.getElementById("tableSection");
        x.innerHTML = tableOutput;
    }
    dataBinding(cart);
</script>

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
    function sendPay(){
        var shipping = 100;
        var tax = 100;
        var subtotal = parseInt(document.getElementById('subtotal').innerText);
        var total =  parseInt(document.getElementById('total').innerText);

        let theList = [];
        if (localStorage.getItem("cart")) {
            // alert("cart is present");
            theList = JSON.parse(localStorage.getItem("cart"));
        } else {
            // alert("cart is not present");
        }

        var allItems = " "
        theList.map((item)=>{
            var oneItem = item.name + " - " + item.amount + " "
            allItems = allItems + oneItem
        })

        alert(subtotal);
        alert(total);
        alert(allItems);




        location.href="/Checkout?subtotal="+subtotal+"&shipping="+shipping+"&tax="+tax+"&total="+(total+shipping+tax)+"&description="+allItems;

    }
</script>

</body>

</html>