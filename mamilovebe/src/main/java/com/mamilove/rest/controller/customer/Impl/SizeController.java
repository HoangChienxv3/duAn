package com.mamilove.rest.controller.customer.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Size;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.SizeService;

@RestController
@CrossOrigin("http://localhost:4200/")
public class SizeController {
	@Autowired
	SizeService sizeService;
	
	@GetMapping("/list-size")
	public ResponseEntity<?> findByName(@Param("name") String name){
		List<Size> entity = sizeService.findByName(name);
		return ResponseEntity.ok(new Res());
	}
}
