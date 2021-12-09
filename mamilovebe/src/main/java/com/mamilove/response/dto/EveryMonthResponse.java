package com.mamilove.response.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EveryMonthResponse {
    Integer month;
    Double total;

}
