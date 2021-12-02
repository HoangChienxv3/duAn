package com.mamilove.response.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Response<T> {
    boolean status;
    String message;
    T data;

    public Response(boolean status, String message) {
        this.status = status;
        this.message = message;
    }

    public Response(String message) {
        this.message = message;
    }

    public Response(T data) {
        this.status = true;
        this.message = "SUCCESS";
        this.data = data;
    }
}

