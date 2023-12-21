package com.green.greensupermarket.util;

import com.green.greensupermarket.dbconnect.DbConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CustomerUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private static boolean isSuccess = false;
    public static boolean registerCustomer(String username, String email, String password, String role){
        isSuccess = false;
        try {

            con= DbConnect.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO user(username, email, password, role) VALUES('"+username+"', '"+email+"', '"+password+"', '"+role+"')";
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
            String sql = "SELECT * FROM user WHERE username = '"+username+"'";
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
