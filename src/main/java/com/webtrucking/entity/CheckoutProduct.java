package com.webtrucking.entity;

public class CheckoutProduct {

    private Integer productId;
    private Integer quantity;

    public CheckoutProduct(Integer id, Integer quantity){
        this.productId = id;
        this.quantity = quantity;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
