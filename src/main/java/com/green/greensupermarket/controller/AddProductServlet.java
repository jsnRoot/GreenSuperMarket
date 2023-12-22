package com.green.greensupermarket.controller;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


@MultipartConfig
@WebServlet(name = "AddProductServlet", value = "/AddProductServlet")
public class AddProductServlet extends HttpServlet {





    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        int stockAmount = Integer.parseInt(request.getParameter("stockAmount"));
        int weight = 1;
        int price = Integer.parseInt(request.getParameter("price"));
        String category = request.getParameter("category");
        Part p = request.getPart("image");




        String fileName = p.getSubmittedFileName();
        System.out.println(fileName);

        String tags = request.getParameter("tags");
        String comment = request.getParameter("comment");
        int discounts = Integer.parseInt(request.getParameter("discounts"));
        String availability = request.getParameter("availability");



        boolean success = ProductUtil.addProduct(itemName, stockAmount, weight, price, category,tags,comment,discounts,availability,fileName);
        if(success == true){

            String path = getServletContext().getRealPath("")+"uploads";
            System.out.println(path);
            File file = new File("path");
            p.write(path+File.separator+fileName);

            HttpSession session = request.getSession();

            session.setAttribute("msg", " <div class=\"alert alert-primary alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <i class=\"fa fa-exclamation-circle me-2\"></i>Product added successfully!\n" +
                    "                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                    "            </div>");


//            RequestDispatcher dis = request.getRequestDispatcher("./admin/insertProduct.jsp");
//            dis.forward(request, response);

            response.sendRedirect("/admin/insertProduct.jsp");

        }else{

//            RequestDispatcher dis = request.getRequestDispatcher("./admin/insertProduct.jsp");
//            dis.forward(request, response);
            HttpSession session = request.getSession();

            session.setAttribute("msg", " <div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <i class=\"fa fa-exclamation-circle me-2\"></i>Error Occured!\n" +
                    "                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                    "            </div>");
            response.sendRedirect("/admin/insertProduct.jsp");
        }

    }
}