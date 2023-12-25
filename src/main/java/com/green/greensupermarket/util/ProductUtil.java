package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.green.greensupermarket.entity.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private static boolean isSuccess = false;

    public static boolean addProduct(String item_name, int stock_amount, int weight, int price, String category, String tags, String comments, int discount, String availability, String fileName){
        isSuccess = false;

        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO product(item_name, stock_amount, weight, price, category, tags, comments, discount, availability, image) VALUES('"+item_name+"', '"+stock_amount+"', '"+weight+"', '"+price+"', '"+category+"', '"+tags+"', '"+comments+"', '"+discount+"', '"+availability+"', '"+fileName+"')";
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

    public static boolean updateProduct(int id ,String item_name, int stock_amount, int weight, int price, String category, String tags, String comments, int discount, String availability, String fileName){
        isSuccess = false;
        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "UPDATE product set item_name = '"+item_name+"', stock_amount = '"+stock_amount+"', weight='"+weight+"', price='"+price+"', category='"+category+"', tags='"+tags+"', comments='"+comments+"', discount='"+discount+"', availability='"+availability+"', image='"+fileName+"' WHERE id ='"+id+"'  ";
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



    public static List<Product> allProducts(){
        ArrayList<Product> products = new ArrayList<>();

        try{
            con = DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM product";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String itemName = rs.getString(2);
                int stockAmount = rs.getInt(3);
                int weight = rs.getInt(4);
                int price = rs.getInt(5);
                String category = rs.getString(6);
                String tags = rs.getString(7);
                String comments = rs.getString(8);
                int discount = rs.getInt(9);
                String availability = rs.getString(10);
                String image = rs.getString(11);

                Product product = new Product(id,itemName,stockAmount,weight,price,category,tags,comments,discount,availability,image);
                products.add(product);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }

        return products;
    }

    public static boolean deleteProduct(int id){
        isSuccess = false;
        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "DELETE FROM product WHERE id='"+id+"' ";
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
