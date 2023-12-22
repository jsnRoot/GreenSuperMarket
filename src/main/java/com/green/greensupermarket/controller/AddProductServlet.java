package com.green.greensupermarket.controller;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddProductServlet", value = "/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        int stockAmount = Integer.parseInt(request.getParameter("stockAmount"));
        int weight = 1;
        int price = Integer.parseInt(request.getParameter("price"));
        String category = request.getParameter("category");
//        image
        String tags = request.getParameter("tags");
        String comment = request.getParameter("comment");
        int discounts = Integer.parseInt(request.getParameter("discounts"));
        String availability = request.getParameter("availability");

        boolean success = ProductUtil.addProduct(itemName, stockAmount, weight, price, category,tags,comment,discounts,availability);
        if(success == true){
            RequestDispatcher dis = request.getRequestDispatcher("/admin/viewProducts.jsp");
            dis.forward(request, response);
        }else{
            RequestDispatcher dis = request.getRequestDispatcher("/admin/insertProduct.jsp");
            dis.forward(request, response);
        }

    }
}