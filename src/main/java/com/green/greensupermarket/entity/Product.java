package com.green.greensupermarket.entity;

public class Product {
    private int id;
    private String item_name;
    private int stock_amount;
    private int weight;
    private int price;
    private String category;
    private String tags;
    private String comments;
    private int discount;

    private String availability;

    private String image;

    public Product(int id, String item_name, int stock_amount, int weight, int price, String category, String tags, String comments, int discount, String availability, String image) {
        this.id = id;
        this.item_name = item_name;
        this.stock_amount = stock_amount;
        this.weight = weight;
        this.price = price;
        this.category = category;
        this.tags = tags;
        this.comments = comments;
        this.discount = discount;
        this.availability = availability;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public String getItem_name() {
        return item_name;
    }

    public int getStock_amount() {
        return stock_amount;
    }

    public int getWeight() {
        return weight;
    }

    public int getPrice() {
        return price;
    }

    public String getCategory() {
        return category;
    }

    public String getTags() {
        return tags;
    }

    public String getComments() {
        return comments;
    }

    public int getDiscount() {
        return discount;
    }

    public String getAvailability() {
        return availability;
    }

    public String getImage() {
        return image;
    }
}
