package com.mamilove.rest.controller.customer.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Product;
import com.mamilove.request.dto.JwtResponse;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.ImageService;
import com.mamilove.service.service.ProductService;

@RestController
@CrossOrigin("http://localhost:4200/")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ImageService ImageService;
	
	@GetMapping("/list-product")
	public ResponseEntity<?> findAll(){
		List<Product> entity = productService.findAll();
		return ResponseEntity.ok(new Res( entity , "Success", true));
	}
	@GetMapping("/home")
	public ResponseEntity<?> findProductNew(){
		List<Product> entity = productService.findProductNew();
		return ResponseEntity.ok(new Res( entity , "Success", true));
	}
//	@GetMapping("/list-product/info/{id}")
//	public ResponseEntity<?> findProductById(@PathVariable("id") Long id){
//		Optional<Product> entity = productService.findById(id);
//		return ResponseEntity.ok(new Res( entity , "Success", true));
//	}
}
