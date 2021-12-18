package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoucherRequest {

    private long amount;

    private double discount;

    private String name;

    private long idevent;
    private Double minimumValue;
}
