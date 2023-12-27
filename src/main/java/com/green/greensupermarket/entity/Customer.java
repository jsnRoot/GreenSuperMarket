package com.green.greensupermarket.entity;

public class Customer {
    private int id;
    private String username;
    private String email;
    private String password;
    private String role;

    private  String code;

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getCode() {
        return code;
    }

    public Customer(int id, String username, String email, String password, String role, String code) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.code = code;
    }
    public Customer(String username, String email, String password, String role, String code) {

        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.code = code;
    }
}
