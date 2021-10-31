package com.mamilove.rest.controller.customer;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Image;
import com.mamilove.entity.Product;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.ImageService;
import com.mamilove.service.service.ProductService;

@RestController
@CrossOrigin("http://localhost:4200/")
public class ImageController {
	@Autowired
	ImageService imageService;
	@Autowired 
	ProductService productService;
	
	@GetMapping("/list-image/{productId}")
	public ResponseEntity<?> findProductById(@PathVariable("productId") Long id){
		Product product = productService.findById(id).get();
		List<Image> entity = imageService.findByProduct(product);
		return ResponseEntity.ok(new Res( entity , "Success", true));
	}
	
}
