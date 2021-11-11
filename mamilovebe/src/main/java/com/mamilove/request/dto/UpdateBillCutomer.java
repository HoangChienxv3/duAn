package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateBillCutomer {

    private String address;//địa chỉ

    private String note;//ghi chú

    private String fullname;//họ tên nhận hàng

    private String sdt;
}
