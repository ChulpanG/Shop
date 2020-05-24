package com.rog.webshop.model.product;

public enum CategoryName {

    BREAK("BREAK"),
    LANCH("LANCH"),
    DINNER("DINNER"),
    OTHER("OTHER");

    String categoryName;

    private CategoryName(String categoryName){
        this.categoryName =categoryName;
    }

    public String getCategoryName(){return categoryName;}

}
