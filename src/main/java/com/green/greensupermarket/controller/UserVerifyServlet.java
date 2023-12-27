package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Customer;
import com.green.greensupermarket.util.CustomerUtil;
import com.green.greensupermarket.util.SendEmail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserVerifyServlet", value = "/UserVerifyServlet")
public class UserVerifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = "customer";
        String code = SendEmail.getRandom();

        Boolean usernameAvailability = CustomerUtil.usernameAvailability(username);

        if(password.equals(confirmPassword)){
            Customer customer = new Customer(username, email, password, role, code);
            boolean success =SendEmail.sendEmail(customer);

            if (success){
                HttpSession session =request.getSession();
                session.setAttribute("authcode", customer);
                session.setAttribute("email", email);
                response.sendRedirect("/verification/index.jsp");
            }
        } else if (!(usernameAvailability)) {
            HttpSession session = request.getSession();
            String msg = "This username is already taken😢! Try Again!";
            session.setAttribute("msg", msg);
            response.sendRedirect("/Login_Signup/SignUP.jsp");
        } else{
            HttpSession session = request.getSession();
            String msg = "Password and Confirm password is not matching";
            session.setAttribute("msg", msg);
            response.sendRedirect("/Login_Signup/SignUP.jsp");

        }
    }
}