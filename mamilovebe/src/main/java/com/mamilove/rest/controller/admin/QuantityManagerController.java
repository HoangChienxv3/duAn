package com.mamilove.rest.controller.admin;

import java.util.List;
import java.util.Optional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.dao.QuantityDao;
import com.mamilove.request.dto.CreateQuantityDto;
import com.mamilove.request.dto.QuantityDto;

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
	
	@PostMapping("/saveAndFlush")
	public ResponseEntity<?> saveAndFlush(@RequestBody QuantityDto quantity){
		Quantity obj = new Quantity();
		for(Product x : quantity.getProduct()) {
			Quantity entity = quantityService.quantityReady(x.getId(), quantity.getSize().getId(), quantity.getProperty().getIdproperty());
			if(entity == null) {
				obj.setIdProduct(x.getId());
				obj.setIdproperty(quantity.getProperty().getIdproperty());
				obj.setIdsize(quantity.getSize().getId());
				obj.setProduct(x);
				obj.setProperty(quantity.getProperty());
				obj.setSize(quantity.getSize());
				obj.setQuantity(Math.round(quantity.getQuantity()));
				obj.setIsDelete(false);
				quantityDao.save(obj);
			}else {
				if(entity.getIdProduct() == x.getId() && entity.getIdproperty() == quantity.getProperty().getIdproperty() 
						&& entity.getIdsize() == quantity.getSize().getId()) {
					long updateQuantity = entity.getQuantity() + Math.round(quantity.getQuantity());
					entity.setQuantity(updateQuantity);
					quantityDao.saveAndFlush(entity);	
				}
			}
		}
		return ResponseEntity.ok(new Res(quantityService.findAll(),"Save success",true));
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
