package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CusTomerDto {
    private Long id;
    private String fullname;
    private String statuscustomer;
    AccountDto accountDto;
}
