package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Customer;
import com.green.greensupermarket.util.CustomerUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "VerifyCodeServlet", value = "/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("authcode");
        String code = request.getParameter("authcode");
        if(code.equals(customer.getCode())){
            out.println("verification done");
//            registering the user
//            out.println(customer.getUsername());
//            out.println(customer.getPassword());
//            out.println(customer.getEmail());
//            out.println(customer.getRole());

            String username = customer.getUsername();
            String password = customer.getPassword();
            String email = customer.getEmail();
            String role = customer.getRole();


                Boolean registered = CustomerUtil.registerCustomer(username, email, password, role);
                if(registered){
                    String msg = "All set! Ready to log in ❤";
                    String color = "#7fad39";
                    session.setAttribute("color", color);
                    session.setAttribute("msg", msg);
                    response.sendRedirect("/Login_Signup/");
                }else{
                    String msg = "Sorry, We cannot register your account 😢";
                    String color = "red";
                    session.setAttribute("color", color);
                    session.setAttribute("msg", msg);
                    response.sendRedirect("/Login_Signup/");
                }
        }else{
//            out.println("Incorrect verification code ");
//            sending back to verification code page
            HttpSession redirectSession = request.getSession();
            String msg = "Incorrect verification code! Try Again";
            redirectSession.setAttribute("msg", msg);
            response.sendRedirect("/verification/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}