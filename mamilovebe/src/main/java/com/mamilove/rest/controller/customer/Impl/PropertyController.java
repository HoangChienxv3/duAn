package com.mamilove.rest.controller.customer.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Property;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.PropertyService;

@RestController
@CrossOrigin("http://localhost:4200/")
public class PropertyController {
	@Autowired
	PropertyService propertyService;
	
	@GetMapping("/list-property")
	public ResponseEntity<?> findAll(){
		List<Property> entity = propertyService.findAll();
		if(entity.size() > 0)
			return ResponseEntity.ok(new Res(propertyService.findAll(),"OK",true));
		else
			return ResponseEntity.ok(new Res("Not OK",false));
	}
	
}
