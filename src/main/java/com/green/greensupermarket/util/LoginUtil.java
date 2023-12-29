package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.green.greensupermarket.entity.Admin;
import com.green.greensupermarket.entity.Customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoginUtil {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    public static List checkUser(String username, String password){
        ArrayList user = new ArrayList<>();
        try{
            con = DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE username = '"+username+"' AND password = '"+password+"'";
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                int id = rs.getInt(1);
                String usrname = rs.getString(2);
                String email = rs.getString(3);
                String pwd = rs.getString(4);
                String role = rs.getString(5);

                if (role.equals("customer")){
                    Customer customer = new Customer(id , usrname, email, pwd, role);
                    user.add(customer);
                }else if(role.equals("admin")){
                    Admin admin = new Admin(id, email, usrname,pwd, role);
                    user.add(admin);
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return user;
    }


}
