package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AdminUtil {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private static boolean isSuccess = false;
    public static boolean registerAdmin(String name, String email, String phone, String username, String password){
        isSuccess = false;
        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO admin(name, email, phone, username, password) VALUES('"+name+"', '"+email+"', '"+phone+"', '"+username+"', '"+password+"')";
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

    public static boolean usernameAvailability(String username){
        isSuccess = false;
        try{
            con=DbConnect.getConnection();
            stmt=con.createStatement();
            String sql = "SELECT * FROM admin WHERE username = '"+username+"'";
            rs = stmt.executeQuery(sql);
            if(!(rs.next())){
              isSuccess=true;
            }else{
                isSuccess=false;
            }
        }catch (Exception ex){

        }
        return isSuccess;
    }

}
