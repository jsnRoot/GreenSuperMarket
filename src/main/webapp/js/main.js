/*  ---------------------------------------------------
    Template Name: Ogani
    Description:  Ogani eCommerce  HTML Template
    Author: Colorlib
    Author URI: https://colorlib.com
    Version: 1.0
    Created: Colorlib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.featured__controls li').on('click', function () {
            $('.featured__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.featured__filter').length > 0) {
            var containerEl = document.querySelector('.featured__filter');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Categories Slider
    ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function(){
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
        Latest Product Slider
    ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
        Product Discount Slider
    -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
        Product Details Pic Slider
    ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
		Price Range Slider
	------------------------ */
    var rangeSlider = $(".price-range"),
        minamount = $("#minamount"),
        maxamount = $("#maxamount"),
        minPrice = rangeSlider.data('min'),
        maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val('$' + ui.values[0]);
            maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*------------------
		Single Product
	--------------------*/
    $('.product__details__pic__slider img').on('click', function () {

        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product__details__pic__item--large').attr('src');
        if (imgurl != bigImg) {
            $('.product__details__pic__item--large').attr({
                src: imgurl
            });
        }
    });













    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        var objectId = $(this).parent().attr("id");
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
            // alert($button.parents().find(".item-price").attr("id"));
            // alert(objectId);
            var total = $button.parents().find(`#${objectId}.item-price`).html() * newVal;
            $button.closest('td').siblings().find(`#${objectId}.total-price`).html(total);

        //     adding an item to cart

            let cart = [];
            cart = JSON.parse(localStorage.getItem("cart"));

            let currentNumberOfItems = parseInt(localStorage.getItem("currentNumberOfItems"));
            let currentTotalPrice = parseInt(localStorage.getItem("currentTotalPrice"));

            let selectedItem = JSON.parse(JSON.stringify(cart.find(cart => cart.id == objectId)));

            // adding item to the cart at the moment

            let obj = {
                image:selectedItem.image,
                id: selectedItem.id,
                name : selectedItem.name,
                price : selectedItem.price,
                amount : 1

            }

            const existingObjectIndex = cart.findIndex((item) => item.id === obj.id && item.price === obj.price);

            if (existingObjectIndex !== -1) {
                // If the object exists, update the amount
                cart[existingObjectIndex].amount += obj.amount;
            } else {
                // If the object doesn't exist, push it to the array
                cart.push(obj);
            }


            // cart.push(product);

            localStorage.setItem("cart", JSON.stringify(cart));
            currentNumberOfItems++;
            currentTotalPrice = currentTotalPrice + selectedItem.price;

            // setting the other items to the local storage
            localStorage.setItem("currentNumberOfItems", currentNumberOfItems);
            localStorage.setItem("currentTotalPrice", currentTotalPrice);

            // changing the front end values

            $('#itemCount').html(currentNumberOfItems);
            $('#totalCost').html(currentTotalPrice);

        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
                var total = $button.parents().find(`#${objectId}.item-price`).html() * newVal;
                $button.closest('td').siblings().find(`#${objectId}.total-price`).html(total);

            //     removing item from the cart
                let cart = [];
                cart = JSON.parse(localStorage.getItem("cart"));

                let currentNumberOfItems = parseInt(localStorage.getItem("currentNumberOfItems"));
                let currentTotalPrice = parseInt(localStorage.getItem("currentTotalPrice"));

                let selectedItemId = JSON.parse(JSON.stringify(cart.findIndex(cart => cart.id == objectId)));
                let selectedItem = JSON.parse(JSON.stringify(cart.find(cart => cart.id == objectId)));


                let obj = {
                    image: selectedItem.image,
                    id: selectedItem.id,
                    name : selectedItem.name,
                    price : selectedItem.price,
                    amount : 1

                }

                const existingObjectIndex = cart.findIndex((item) => item.id === obj.id && item.price === obj.price);

                if (existingObjectIndex !== -1) {
                    // If the object exists, update the amount
                    cart[existingObjectIndex].amount -= obj.amount;
                } else {
                    // If the object doesn't exist, push it to the array
                    cart.push(obj);
                }




                // cart.splice(selectedItemId,1);

                localStorage.setItem("cart", JSON.stringify(cart));
                currentNumberOfItems--;
                currentTotalPrice = currentTotalPrice - selectedItem.price;
                localStorage.setItem("currentNumberOfItems", currentNumberOfItems);
                localStorage.setItem("currentTotalPrice", currentTotalPrice);
                $('#itemCount').html(currentNumberOfItems);
                $('#totalCost').html(currentTotalPrice);

            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });

    proQty.on('click', function () {
        var total=0;
        $(".total-price").each(function (index, element) {
            // element == this
            // alert($(this).html());
            // total = total + element.html();

            if($(this)!=undefined){
                total = total + parseInt($(this).html());
            }
        });
        // alert(total);
        $("#subtotal").html(total);
        $("#total").html(total);
    })
})(jQuery);

var removeFromCart = $('.icon_close');
removeFromCart.on('click', function () {
    var $button = $(this);
    var objectId = $(this).attr("id");

    // taking the total
    var total = $(`#${objectId}.total-price`).html();
    // taking the quentity
    var deleteCount = $(`#${objectId}.box`).val();



    // alert("Obejct Id" + objectId);
    // alert("Quentity" + deleteCount);
    // alert("Total" + total);

//     remove the object from the cart

    let cart = [];
    cart = JSON.parse(localStorage.getItem("cart"));
    let selectedItem = JSON.parse(JSON.stringify(cart.find(cart => cart.id == objectId)));
    // let itemToBeRemoved = JSON.stringify(selectedItem);
    cart.splice(
        cart.findIndex((a) => a.id === selectedItem.id),
        1
    );
    // alert(JSON.stringify(cart));
    localStorage.setItem("cart", JSON.stringify(cart));

//     update current total price in the storage
    let currentTotalPrice = parseInt(localStorage.getItem("currentTotalPrice"));
    currentTotalPrice = currentTotalPrice - total;
    $('#totalCost').html(currentTotalPrice);

    localStorage.setItem("currentTotalPrice", currentTotalPrice);


//     update the current number of items in the storage
    let currentNumberOfItems = parseInt(localStorage.getItem("currentNumberOfItems"));
    currentNumberOfItems = currentNumberOfItems - deleteCount;
    $('#itemCount').html(currentNumberOfItems);
    localStorage.setItem("currentNumberOfItems", currentNumberOfItems);

    $("#subtotal").html(currentTotalPrice);
    $("#total").html(currentTotalPrice);
    $button.parents().find(`tr.${objectId}`)
    $button.closest('tr').remove();
})(jQuery);




