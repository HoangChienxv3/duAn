package com.mamilove.rest.controller.admin;

import java.util.List;
import java.util.Optional;

import com.mamilove.dao.QuantityDao;
import com.mamilove.request.dto.CreateQuantityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.ProductService;
import com.mamilove.service.service.QuantityService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/QuantityManagerController")
public class QuantityManagerController {
	@Autowired
	QuantityService quantityService;
	@Autowired
	ProductService productService;

	@Autowired
	QuantityDao quantityDao;
	
	@GetMapping("/findAll")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(new Res(quantityDao.findAllByIsDeleteFalse(),"success",true));
	}
	@GetMapping("/findQuantityByProduct/{id}")
	public ResponseEntity<?> findQuantityByProduct(@PathVariable("id") Long id){
		Optional<Product> product = Optional.ofNullable(productService.findById(id));
		List<Quantity> list = quantityService.findByProduct(product.get());
		return ResponseEntity.ok(new Res(list,"success",true));
	}
	///code chien
	@PostMapping("/createOrUpdate")
	public ResponseEntity<Res> createQty( @RequestBody CreateQuantityDto createQuantity){
		return ResponseEntity.ok(new Res(quantityService.createQty(createQuantity),"ok", true));
	}

	//xoa quantity
	@GetMapping("/delete/{idqty}")
	public ResponseEntity<Res> deleteQty(@PathVariable("idqty") Long idqty){
		return ResponseEntity.ok(new Res(quantityService.deleteQty(idqty),"ok", true));
	}

}
