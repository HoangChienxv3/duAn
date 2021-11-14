package com.mamilove.controllers;



import com.mamilove.request.dto.Res;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class MyControllerAdvice  {

    @ExceptionHandler(Exception.class)//500
    public ResponseEntity<?> handleUnwantedException() {
        return ResponseEntity.ok(new Res(null, "lỗi 500", true));
    }


}