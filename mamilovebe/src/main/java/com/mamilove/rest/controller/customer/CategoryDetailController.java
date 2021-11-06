package com.mamilove.rest.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CategoryDetailService;

@RestController
@CrossOrigin("http://localhost:4200/")
public class CategoryDetailController {
	@Autowired
	CategoryDetailService categoryDetailService;
	
	@GetMapping("/list-categoryDetail")
	public ResponseEntity<List<Categorydetail>> findAll(){
		return ResponseEntity.ok(categoryDetailService.findAll());
	}
	
	@PostMapping("/CategoryDetailController/saveAll")
	public ResponseEntity<?> saveAll(@RequestBody String category){
		try {
			ObjectMapper json = new ObjectMapper();
			List<Categorydetail> entity = new ArrayList<>();
			entity = Arrays.asList(json.readValue(category, Categorydetail[].class));
			categoryDetailService.saveAll(entity);
			return ResponseEntity.ok(new Res(entity,"Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
	@PostMapping("/CategoryDetailController/deleteInBatch")
	public ResponseEntity<?> deleteInBatch(@RequestBody String category){
		try {
			ObjectMapper json = new ObjectMapper();
			List<Categorydetail> entity = new ArrayList<>();
			entity = Arrays.asList(json.readValue(category, Categorydetail[].class));
			categoryDetailService.deleteInBatch(entity);
			return ResponseEntity.ok(new Res("Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
	@PostMapping("/CategoryDetailController/updateInline")
	public ResponseEntity<?> updateInline(String createdItems,
	        @RequestParam(required = false,value ="updatedItems") String updatedItems,
	        @RequestParam(required = false,value ="deletedItems") String deletedItems) throws IOException{
		try {
			ObjectMapper json = new ObjectMapper();
			List<Categorydetail> created = new ArrayList<>();
			List<Categorydetail> updated = new ArrayList<>();
			List<Categorydetail> deleted = new ArrayList<>();
			
			created = Arrays.asList(json.readValue(createdItems,Categorydetail[].class));
			updated = Arrays.asList(json.readValue(updatedItems,Categorydetail[].class));
			deleted = Arrays.asList(json.readValue(deletedItems,Categorydetail[].class));
			
			if(created.size() > 0) {
				categoryDetailService.saveAll(created);
			}
			if(updated.size() > 0) {
				categoryDetailService.saveAll(updated);
			}
			if(deleted.size() > 0) {
				categoryDetailService.deleteInBatch(deleted);
			}
			return ResponseEntity.ok(new Res(categoryDetailService.findAll(),"Save success",true)); 
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false)); 
		}
	}
}
