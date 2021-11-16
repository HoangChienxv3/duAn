package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymenDto {
    Long amount;//số tiền
    String description;//mỗ tả
    String bankcode;//ngân hàng
    String language;//ngôn ngữ
}
