package com.entity.cart;

import lombok.Data;

import java.math.BigDecimal;
//订单表
@Data
public class Order {
    private Integer id;
    private String nmae;
    private Double price;
    private Double subtotal;
    private Double total;
    private Integer count;
}
