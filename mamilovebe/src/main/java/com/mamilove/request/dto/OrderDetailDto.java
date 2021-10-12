package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDto {
    private Long id;
    private Double price;
    private Double downprice;
    private Long quantitydetail;
    private Double intomoney;
    QuantityDto quantityDto;
    BillDto billDto;
}
