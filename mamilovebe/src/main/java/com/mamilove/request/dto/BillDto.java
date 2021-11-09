package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDto {

    private String username;//ma nguoi dung

    private String statusshipping;//tình trạng giao hàng

    private Double transportFee;//phí vận chuyển

    private Long voucher_id;//mã voucher

    private Double discount; // giảm giá

    private Double downtotal;// giá sau khi giảm

    private Boolean payment;// thanh toán bằng gì flase mua hàng r thanh toán, true thanh toán bằng ví

    private Double total;//thanh toán

    private String address;//địa chỉ

    private String note;//ghi chú

    private String fullname;//họ tên nhận hàng

    private Boolean refund;//hoàn hàng
    
    private String sdt;
    private List<QuantityRequest> list_quantity;

    public BillDto get(String fieldName) {
        return null;
    }
}
