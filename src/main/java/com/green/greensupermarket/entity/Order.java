package com.green.greensupermarket.entity;

public class Order {
    private int id;
    private String payer;
    private String transaction;
    private String shipping;
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPayer() {
        return payer;
    }

    public void setPayer(String payer) {
        this.payer = payer;
    }

    public String getTransaction() {
        return transaction;
    }

    public void setTransaction(String transaction) {
        this.transaction = transaction;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Order(int id, String payer, String transaction, String shipping, String description) {
        this.id = id;
        this.payer = payer;
        this.transaction = transaction;
        this.shipping = shipping;
        this.description = description;
    }
}
