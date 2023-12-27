package com.green.greensupermarket.controller;

import com.green.greensupermarket.util.AdminUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdminRegisterServlet", value = "/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username  = request.getParameter("username");
        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");

        String password = request.getParameter("password");
//        String username = request.getParameter("username");
        String role = "admin";
//        boolean result = AdminUtil.registerAdmin(name,email,phone,username,password);

        boolean result = AdminUtil.usernameAvailability(username);

        if(result == true){
            boolean success = AdminUtil.registerAdmin(username,email,password,role);

            if(success == true){
                String message = " <div class=\"container\">\n" +
                        "    <div class=\"alert alert-success\" role=\"alert\">\n" +
                        "        You are Registered! Try Log in😊\n" +
                        "    </div>\n" +
                        "</div> ";
                request.setAttribute("message",message);
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request,response);


            }


        }else{
            String message = " <div class=\"container\">\n" +
                    "    <div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "        Username already taken!\n" +
                    "    </div>\n" +
                    "</div> ";
            request.setAttribute("message", message);
            RequestDispatcher dis2 = request.getRequestDispatcher("/admin/register_admin.jsp");
            dis2.forward(request, response);
        }
    }
}