package com.green.greensupermarket.controller;

import com.green.greensupermarket.util.CustomerUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerRegister", value = "/CustomerRegister")
public class CustomerRegisterServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "customer";

        Boolean result = CustomerUtil.usernameAvailability(username);

        if(result == true){
            boolean success = CustomerUtil.registerCustomer(username,email,password,role);
            if (success == true){
                String message ="<p style='color:blue'>Congradulations 😊 Try Login!</p>";
                request.setAttribute("message",message);
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request,response);
            }else{
                String message = "<p style='color:blue'>Sorry 😔 Your request cannot be compleated!</p>";
                request.setAttribute("message",message);
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request,response);
            }
        }else{
//            String message = " <div class=\"container\">\n" +
//                    "    <div class=\"alert alert-danger\" role=\"alert\">\n" +
//                    "        Username already taken!\n" +
//                    "    </div>\n" +
//                    "</div> ";

            String message ="<p style='color:red'>Username already taken! 😢</p>";
            request.setAttribute("message", message);
            RequestDispatcher dis2 = request.getRequestDispatcher("login.jsp");
            dis2.forward(request, response);
        }
    }
}