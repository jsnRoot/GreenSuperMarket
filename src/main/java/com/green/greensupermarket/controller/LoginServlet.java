package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Admin;
import com.green.greensupermarket.entity.Customer;
import com.green.greensupermarket.util.LoginUtil;
import com.mysql.fabric.Response;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List user = LoginUtil.checkUser(username,password);

        if(user.get(0) instanceof Customer){
            HttpSession oldSession = request.getSession(false);
            if (oldSession!=null){
                oldSession.invalidate();
            }
            HttpSession newSession = request.getSession(true);
            newSession.setMaxInactiveInterval(5*60);
            Cookie currentUser= new Cookie("customer", (String) ((Customer) user.get(0)).getUsername());
            Cookie message = new Cookie("msg", "Welcome");
            Cookie userType = new Cookie("userType", "Customer");
            response.addCookie(currentUser);
            response.addCookie(message);
            response.addCookie(userType);
            response.sendRedirect("/index.jsp");
        } else if (user.get(0) instanceof  Admin) {
            HttpSession oldSession = request.getSession(false);
            if(oldSession!=null){
                oldSession.invalidate();
            }
            HttpSession newSession = request.getSession(true);
            newSession.setMaxInactiveInterval(5*60);
            Cookie currentUser = new Cookie("admin", ((Admin) user.get(0)).getUsername());
            Cookie message = new Cookie("msg", "Welcome");
            Cookie userType = new Cookie("userType", "Admin");
            response.addCookie(currentUser);
            response.addCookie(message);
            response.addCookie(userType);
            response.sendRedirect("/admin/index.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Invalid Username or Password");
            session.setAttribute("color", "red");
            response.sendRedirect("/Login_Signup/index.jsp");
        }
    }
}