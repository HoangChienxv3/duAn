package com.mamilove.response.dto;

import com.mamilove.common.EnumStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDashboardResponse {

    private String name;
    private Double total;

}
