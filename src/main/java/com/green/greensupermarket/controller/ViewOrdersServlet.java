package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Order;
import com.green.greensupermarket.util.OrderUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "ViewOrdersServlet", value = "/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders  = OrderUtil.allOrders();
        HttpSession session = request.getSession();
        session.setAttribute("order",orders);
        response.sendRedirect("/admin/orderView.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}