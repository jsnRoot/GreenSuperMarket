package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Product;
import com.green.greensupermarket.util.ProductUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteProductServlet", value = "/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productID"));
        System.out.println(id);
        boolean success = ProductUtil.deleteProduct(id);
        if(success){
            HttpSession session = request.getSession();
            session.setAttribute("msg", " <div class=\"alert alert-primary alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <i class=\"fa fa-exclamation-circle me-2\"></i>Product deleted successfully!\n" +
                    "                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                    "            </div>");

            List<Product> products = ProductUtil.allProducts();
            session.setAttribute("product",products);
            response.sendRedirect("/admin/tableDelete.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("msg", " <div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <i class=\"fa fa-exclamation-circle me-2\"></i>Sorry, We can not delete your product!\n" +
                    "                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
                    "            </div>");

            List<Product> products = ProductUtil.allProducts();
            session.setAttribute("product",products);
            response.sendRedirect("/admin/tableDelete.jsp");
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}