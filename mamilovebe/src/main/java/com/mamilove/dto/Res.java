package com.mamilove.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Res {

    private Object data;
    private String message;
    private Boolean status;

    public Res(String message, Boolean status){
        this.message = message;
        this.status = status;
    }

}
