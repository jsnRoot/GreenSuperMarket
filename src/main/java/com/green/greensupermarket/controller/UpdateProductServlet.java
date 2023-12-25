package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Product;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet(name = "UpdateProductServlet", value = "/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String itemName = request.getParameter("itemName");
        int stockAmount = Integer.parseInt(request.getParameter("stockAmount"));
        int weight = Integer.parseInt(request.getParameter("weight"));
        int price = Integer.parseInt(request.getParameter("price"));
        String category = request.getParameter("category");



        String tags = request.getParameter("tags");
        String comment = request.getParameter("comment");
        int discounts = Integer.parseInt(request.getParameter("discounts"));
        String availability = request.getParameter("availability");

//        String id = request.getParameter("id");
//        String itemName = request.getParameter("itemName");
//        String stockAmount = request.getParameter("stockAmount");
//        String weight = request.getParameter("weight");
//        String price = request.getParameter("price");
//        String category = request.getParameter("category");
//        String fileName = "fileName";
//        String tags = request.getParameter("tags");
//        String comment = request.getParameter("comment");
//        String discount = request.getParameter("discount");
//        String availability = request.getParameter("availability");
//
//



        boolean success;
        String fileName;
        String prevImage = request.getParameter("prevImg");

        Part p = request.getPart("image");

        System.out.println("id"+ id);
        System.out.println( "itemName" + itemName);
        System.out.println( "stock amount" + stockAmount);
        System.out.println("weight" + weight);
        System.out.println( "price"  + price);
        System.out.println( "category" + category);
        System.out.println( "p" + p);
        System.out.println("tags" + tags);
        System.out.println("comments" + comment);
        System.out.println("discounts" + discounts);
        System.out.println("availbility" + availability);

        if (p.getSubmittedFileName()!=""){
            fileName = p.getSubmittedFileName();
            success = ProductUtil.updateProduct(id, itemName, stockAmount, weight, price, category, tags, comment, discounts, availability, fileName);
        }else{
            success = ProductUtil.updateProduct(id, itemName, stockAmount, weight, price, category, tags, comment, discounts, availability, prevImage);
        }


        if (success == true){

            if(p.getSubmittedFileName()!=""){
                String path = getServletContext().getRealPath("")+"uploads";

                File file = new File("path");
                fileName = p.getSubmittedFileName();
                p.write(path+File.separator+fileName);

            }


            HttpSession session = request.getSession();

            session.setAttribute("msg", " <div class=\"alert alert-primary alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <i class=\"fa fa-exclamation-circle me-2\"></i>Product updated successfully!\n" +
                    "                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                    "            </div>");


            List<Product> products = ProductUtil.allProducts();
            session.setAttribute("product",products);
            response.sendRedirect("/admin/tableUpdate.jsp");

//            response.sendRedirect("../updateProductTable");
//            RequestDispatcher dis = request.getRequestDispatcher("UpdateTableServlet");
//            dis.forward(request, response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("msg", " <div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <i class=\"fa fa-exclamation-circle me-2\"></i>Sorry, We can not update your product!\n" +
                    "                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                    "            </div>");

            List<Product> products = ProductUtil.allProducts();
            session.setAttribute("product",products);
//            response.sendRedirect("/updateProductTable");
            response.sendRedirect("/admin/tableUpdate.jsp");
        }
    }
}