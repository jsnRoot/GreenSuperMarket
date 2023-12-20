package com.green.greensupermarket.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
    private static String url = "jdbc:mysql://localhost:3306/greensuper";
    private static String username = "root";
    private static String password = "";
    private static Connection con;

    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);

        }catch(Exception ex){
            ex.printStackTrace();
        }
        return con;
    }
}
