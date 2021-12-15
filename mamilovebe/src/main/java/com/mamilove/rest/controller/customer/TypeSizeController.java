package com.mamilove.rest.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.response.dto.Res;
import com.mamilove.service.service.TypeSizeService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/TypeSizeController")
public class TypeSizeController {
    @Autowired
    TypeSizeService typeSizeService;

    @GetMapping("/findAllByIsDeleteFalse")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(new Res(typeSizeService.findAllByIsDeleteFalse(), "OK", true));
    }
}
