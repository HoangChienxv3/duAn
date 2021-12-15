package com.mamilove.response.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SumQtyProductResponse {

    private String name;
    private Long qty;
    private Double intomoney;

}
