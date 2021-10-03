package com.mamilove.rest.controller.customer.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Product;
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
	public List<Product> findAll(){
		return productService.findAll();
	}
	@GetMapping("/home")
	public List<Product> findProductNew(){
		return productService.findProductNew();
	}
	
}
