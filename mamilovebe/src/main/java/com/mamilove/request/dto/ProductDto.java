package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private Long id;
    private String name;
    private Double price;
    private Double discount;
    private String description;
    private String descriptionDetail;
    private String status;
    CategorydetailDto categorydetailDto;
}
