package com.mamilove.request.dto;

import com.mamilove.entity.Bill;
import com.mamilove.entity.Quantity;

import javax.persistence.*;

public class OrderDetailRequest {

    private Long id;

    private Double price;

    private Double downprice;

    private Long quantitydetail;

    private Double intomoney;

    private Quantity quantity;


}
