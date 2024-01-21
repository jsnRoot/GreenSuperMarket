package com.green.greensupermarket.controller;

import com.green.greensupermarket.util.MessageUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "AddMessageServlet", value = "/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        boolean isSuccess = MessageUtil.addMessage(name,email,message);
        PrintWriter out = response.getWriter();
        if (isSuccess){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Thank you for your message');");
            out.println("location='contact.html';");
            out.println("</script>");
        }else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Sorry! Error Occured');");
            out.println("location='contact.html';");
            out.println("</script>");
        }
    }
}