package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDto {
    private String address;
    private Double discount;
    private Double downtotal;
    private String note;
    private Boolean payment;
    private Boolean refund;
    private String statusshipping;
    private Double total;
    List<OrderDetailDto>  orderDetailDto;
    CusTomerDto cusTomerDto;
    VoucherDto voucherDto;



}
