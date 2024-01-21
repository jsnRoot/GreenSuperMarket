package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.green.greensupermarket.entity.Order;
import com.green.greensupermarket.entity.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static List<Order> allOrders(){
        ArrayList<Order> orders = new ArrayList<>();
        try{
            con = DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM ordertable";
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                int id = rs.getInt(1);
                String payer = rs.getString(2);
                String transaction = rs.getString(3);
                String shipping = rs.getString(4);
                String description = rs.getString(5);

                Order order = new Order(id,payer,transaction,shipping,description);
                orders.add(order);
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }
        return orders;
    }
}
