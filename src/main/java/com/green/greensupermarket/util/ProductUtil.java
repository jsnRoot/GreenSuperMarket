package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ProductUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private static boolean isSuccess = false;

    public static boolean addProduct(String item_name, int stock_amount, int weight, int price, String category, String tags, String comments, int discount, String availability){
        isSuccess = false;

        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO product(item_name, stock_amount, weight, price, category, tags, comments, discount, availability) VALUES('"+item_name+"', '"+stock_amount+"', '"+weight+"', '"+price+"', '"+category+"', '"+tags+"', '"+comments+"', '"+discount+"', '"+availability+"')";
            int rs = stmt.executeUpdate(sql);
            if(rs == 1){
                isSuccess = true;

            }else{
                isSuccess = false;
            }

        }catch (Exception ex){
            ex.printStackTrace();
        }

        return isSuccess;
    }
}
