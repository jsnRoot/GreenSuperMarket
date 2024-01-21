package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;
import com.green.greensupermarket.entity.Message;
import com.green.greensupermarket.entity.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MessageUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private static boolean isSuccess = false;

    public static boolean addMessage(String name, String email, String message){
        isSuccess = false;

        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql =
                    "INSERT INTO messages(name, email, message) VALUES('"+name+"', '"+email+"', '"+message+"')";
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



    public static List<Message> allMessages(){
        ArrayList<Message> messages = new ArrayList<>();

        try{
            con = DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM messages";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String message = rs.getString(4);

                Message message1 = new Message(id,name,email,message);
                messages.add(message1);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }

        return messages;
    }


}



