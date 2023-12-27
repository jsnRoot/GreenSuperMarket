package com.green.greensupermarket.util;

import com.green.greensupermarket.entity.Customer;

import java.util.Properties;
import java.util.Random;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendEmail {
    public static String getRandom(){
        Random rand = new Random();
        int number = rand.nextInt(99999);
        return String.format("%05d",number);

    }

    public static boolean sendEmail(Customer customer){
        boolean test =false;
        String toEmail = customer.getEmail();
        String fromEmail = "nishalkasachin@gmail.com";
        String password = "urvsvqjmryjfxxgr";

        try{
            Properties pr = new Properties();
            pr.put("mail.smtp.host","smtp.gmail.com");
            pr.put("mail.smtp.port","465");
            pr.put("mail.smtp.auth","true");
            pr.put("mail.smtp.starttls.enable","true");
            pr.put("mail.smtp.starttls.required", "true");
            pr.put("mail.smtp.ssl.protocols", "TLSv1.2");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");


            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(fromEmail, password);

                }
            });


            Message mess = new MimeMessage(session);
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(customer.getEmail()));
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setSubject("User email verification");
            mess.setText("Registered successfully. Please verify your account using this code: "+ customer.getCode());

            Transport.send(mess);
            test = true;

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return test;
    }
}
