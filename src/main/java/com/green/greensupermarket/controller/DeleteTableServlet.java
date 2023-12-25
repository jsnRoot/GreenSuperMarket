package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Product;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteTableServlet", value = "/DeleteTableServlet")
public class DeleteTableServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductUtil.allProducts();
        HttpSession session = request.getSession();

        if(session.getAttribute("msg")!= null){
            session.setAttribute("msg", session.getAttribute("msg"));
        }


//        request.setAttribute("products", products);
//        System.out.println(products);
        session.setAttribute("product",products);

//        RequestDispatcher dis = request.getRequestDispatcher("/admin/tableUpdate.jsp");
//        dis.forward(request,response);
        response.sendRedirect("/admin/tableDelete.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}