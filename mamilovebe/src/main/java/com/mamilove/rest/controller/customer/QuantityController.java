package com.mamilove.rest.controller.customer;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.ProductService;
import com.mamilove.service.service.QuantityService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/QuantityController")
public class QuantityController {

	@Autowired
	QuantityService quantityService;
	@Autowired
	ProductService productService;
	
	@GetMapping("/findAllByIsDeleteFalse")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(new Res(quantityService.findAllByIsDeleteFalse(),"success",true));
	}
	@GetMapping("/findQuantityByProduct/{id}")
	public ResponseEntity<?> findQuantityByProduct(@PathVariable("id") Long id){
		Optional<Product> product = Optional.ofNullable(productService.findById(id));
		List<Quantity> list = quantityService.findByProduct(product.get());
		return ResponseEntity.ok(new Res(list,"success",true));
	}

}
