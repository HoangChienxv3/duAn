package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EventDto {
    private String name;
    private Date startday;
    private Date endday;
    private Boolean typeevent;
    private Boolean status;
    @Default
    private boolean isdelete = false;
}
