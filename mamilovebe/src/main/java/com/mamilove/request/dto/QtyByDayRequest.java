package com.mamilove.request.dto;

import com.mamilove.common.EnumStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QtyByDayRequest {

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date day;

    EnumStatus enumStatus;

}
