package com.mamilove.rest.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Product;
import com.mamilove.request.dto.JwtResponse;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CategoryDetailService;
import com.mamilove.service.service.ImageService;
import com.mamilove.service.service.ProductService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/ProductManagerController")
public class ProductManagerController {
	public String upload;
	@Autowired
	ProductService productService;
	@Autowired
	ImageService ImageService;
	@Autowired
	CategoryDetailService categoryDetailService;
	
	@GetMapping("/findAll")
	public ResponseEntity<?> findAll(){
		List<Product> entity = productService.findAll();
		return ResponseEntity.ok(new Res( entity , "Success", true));
	}	
	@GetMapping("/findProductById/{id}")
	public ResponseEntity<?> findProductById(@PathVariable("id") Long id){
		Product entity = productService.findById(id);
		return ResponseEntity.ok(new Res( entity , "Success", true));
	}
	@PostMapping(value = "/uploads",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> uploads(@RequestBody MultipartFile file) throws IllegalStateException, IOException {
		try {
			if(!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				filename = uuid.toString()  + ".jpg";
				File file_upload= new File("D:\\Angular\\demo\\src\\image\\"+ filename);
				file.transferTo(file_upload);
				upload = filename;
			}
			return ResponseEntity.ok(new Res("Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save success",true));
		}
	}
	@PostMapping("/saveAndFlush")
	public ResponseEntity<?> saveAndFlush(@RequestBody Product product){
		try {
			if(upload != null) {
				product.setImage(upload);
			}
			product.setIsDelete(false);
			Product entity = productService.saveAndFlush(product);
			return ResponseEntity.ok(new Res(entity,"Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
	@PostMapping("/deleteProduct")
	public ResponseEntity<?> deleteProduct(@RequestBody Product product){
		try {
			product.setIsDelete(true);
			return ResponseEntity.ok(new Res(product,"Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
}
