package com.mamilove.rest.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CategoryService;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/CategoryManagerController")
public class CategoryManagerController {
	@Autowired
	CategoryService categoryService;

	@GetMapping(value = "/findAll",produces = "application/json")
	public ResponseEntity<List<Category>> findAll(){
		return ResponseEntity.ok(categoryService.findAll());
	}
	
	@PostMapping("/saveAll")
	public ResponseEntity<?> saveAll(@RequestBody String category){
		try {
			ObjectMapper json = new ObjectMapper();
			List<Category> entity = new ArrayList<>();
			entity = Arrays.asList(json.readValue(category, Category[].class));
			categoryService.saveAll(entity);
			return ResponseEntity.ok(new Res(entity,"Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
	@PostMapping("/deleteInBatch")
	public ResponseEntity<?> deleteInBatch(@RequestBody String category){
		try {
			ObjectMapper json = new ObjectMapper();
			List<Category> entity = new ArrayList<>();
			entity = Arrays.asList(json.readValue(category, Category[].class));
			categoryService.deleteInBatch(entity);
			return ResponseEntity.ok(new Res("Save success",true));
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false));
		}
	}
	@PostMapping("/updateInline")
	public ResponseEntity<?> updateInline(String createdItems,
	        @RequestParam(required = false,value ="updatedItems") String updatedItems,
	        @RequestParam(required = false,value ="deletedItems") String deletedItems) throws IOException{
		try {
			ObjectMapper json = new ObjectMapper();
			List<Category> created = new ArrayList<>();
			List<Category> updated = new ArrayList<>();
			List<Category> deleted = new ArrayList<>();
			
			created = Arrays.asList(json.readValue(createdItems,Category[].class));
			updated = Arrays.asList(json.readValue(updatedItems,Category[].class));
			deleted = Arrays.asList(json.readValue(deletedItems,Category[].class));
			
			if(created.size() > 0) {
				categoryService.saveAll(created);
			}
			if(updated.size() > 0) {
				categoryService.saveAll(updated);
			}
			if(deleted.size() > 0) {
				categoryService.deleteInBatch(deleted);
			}
			return ResponseEntity.ok(new Res(categoryService.findAll(),"Save success",true)); 
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false)); 
		}
	}
}
