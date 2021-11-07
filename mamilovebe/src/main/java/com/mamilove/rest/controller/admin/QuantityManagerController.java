package com.mamilove.rest.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.ProductService;
import com.mamilove.service.service.QuantityService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/QuantityController")
public class QuantityManagerController {
	@Autowired
	QuantityService quantityService;
	@Autowired
	ProductService productService;
	
	@GetMapping("/findAll")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(new Res(quantityService.findAll(),"success",true));
	}
	@GetMapping("/findQuantityByProduct/{id}")
	public ResponseEntity<?> findQuantityByProduct(@PathVariable("id") Long id){
		Optional<Product> product = Optional.ofNullable(productService.findById(id).get());
		List<Quantity> list = quantityService.findByProduct(product.get());
		return ResponseEntity.ok(new Res(list,"success",true));
	}
}
