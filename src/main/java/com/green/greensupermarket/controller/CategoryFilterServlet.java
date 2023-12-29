package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Product;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryFilterServlet", value = "/CategoryFilterServlet")
public class CategoryFilterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String category = request.getParameter("category");
            List<Product> filteredProducts = ProductUtil.getProductsByCategory(category);
            HttpSession session = request.getSession();
            session.setAttribute("filteredProducts", filteredProducts);
            session.setAttribute("category", category);
            response.sendRedirect("/category.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}