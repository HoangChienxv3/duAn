package com.mamilove.request.dto;


import com.fasterxml.jackson.databind.JsonNode;
import com.mamilove.entity.Customer;
import com.mamilove.entity.Orderdetail;
import com.mamilove.entity.Voucher;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDto {

    private Long id;
    private String statusshipping;
    private Double total;
    private Double discount;
    private Double downtotal;
    private Boolean payment;
    private String address;
    private String note;
    private Boolean refund;
    private Customer customer;
    private Voucher voucher;

    public BillDto get(String fieldName) {
        return null;
    }
}
