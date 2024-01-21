package com.green.greensupermarket.controller;

import com.green.greensupermarket.entity.Message;
import com.green.greensupermarket.entity.Order;
import com.green.greensupermarket.util.MessageUtil;
import com.green.greensupermarket.util.OrderUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewCommentsServlet", value = "/ViewCommentsServlet")
public class ViewCommentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Message> messages  = MessageUtil.allMessages();
        HttpSession session = request.getSession();
        session.setAttribute("messages",messages);
        response.sendRedirect("/admin/messageView.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}