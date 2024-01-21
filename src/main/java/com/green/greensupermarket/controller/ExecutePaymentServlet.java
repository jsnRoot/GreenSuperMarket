package com.green.greensupermarket.controller;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "ExecutePaymentServlet", value = "/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentID = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerId");

        PaymentServices payePaymentServices = new PaymentServices();
        try {
            Payment payment = payePaymentServices.executePayment(paymentID, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("shippingAddress", shippingAddress);






            try {

                con= DbConnect.getConnection();
                stmt = con.createStatement();
                String sql =
                        "INSERT INTO ordertable(payer, transaction, shipping, description) VALUES('"+ payerInfo.getFirstName() +"', '"+ transaction.getAmount().getTotal().toString() +
                                "', '"+ shippingAddress.getLine1().toString() +"', '"+ transaction.getDescription().toString() +"')";
                int rs = stmt.executeUpdate(sql);

            }catch (Exception ex){
                ex.printStackTrace();
            }




            request.getRequestDispatcher("receipt.jsp").forward(request, response);
        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Could not execute payment");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }
}