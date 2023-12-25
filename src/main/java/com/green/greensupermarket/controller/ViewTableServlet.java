package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Product;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewTableServlet", value = "/ViewTableServlet")
public class ViewTableServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductUtil.allProducts();
        HttpSession session = request.getSession();


//        request.setAttribute("products", products);
//        System.out.println(products);
        session.setAttribute("product",products);

//        RequestDispatcher dis = request.getRequestDispatcher("/admin/tableUpdate.jsp");
//        dis.forward(request,response);
        response.sendRedirect("/admin/tableView.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}