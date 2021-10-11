package com.mamilove.rest.controller.customer.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.request.dto.Res;
import com.mamilove.service.service.TypeSizeService;

@RestController
@CrossOrigin("http://localhost:4200/")
public class TypeSizeController {
	@Autowired
	TypeSizeService typeSizeService;
	
	@GetMapping("/list-type-size")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok( new Res(typeSizeService.findAll(),"OK",true));
	}
}
