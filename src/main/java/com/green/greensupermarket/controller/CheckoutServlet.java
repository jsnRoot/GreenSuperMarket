package com.green.greensupermarket.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckoutServlet", value = "/Checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int SubTotal = Integer.parseInt(request.getParameter("subtotal"));
        int Shipping = Integer.parseInt(request.getParameter("shipping"));
        int Tax = Integer.parseInt(request.getParameter("tax"));
        int Total = Integer.parseInt(request.getParameter("total")) + Shipping + Tax;
        String productDescription = request.getParameter("description");




        System.out.println(SubTotal);
        System.out.println(Total);

        request.setAttribute("description", productDescription);
        request.setAttribute("subtotal", SubTotal);
        request.setAttribute("shipping", Shipping);
        request.setAttribute("Tax", Tax);
        request.setAttribute("total", Total);

        RequestDispatcher dis = request.getRequestDispatcher("checkout.jsp");
        dis.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}