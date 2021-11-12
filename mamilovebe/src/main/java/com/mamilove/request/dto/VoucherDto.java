package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoucherDto {
    private Long amount;
    private Double discount;
    private String descriptionvoucher;
    private Long idevent;
}
