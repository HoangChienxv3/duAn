package com.mamilove.rest.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Property;
import com.mamilove.entity.Size;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.PropertyService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/PropertyManagerController")
public class PropertyManagerController {
	@Autowired
	PropertyService propertyService;
	
	@GetMapping("/findAll")
	public ResponseEntity<?> findAll(){
		List<Property> entity = propertyService.findAll();
		if(entity.size() > 0)
			return ResponseEntity.ok(new Res(propertyService.findAll(),"OK",true));
		else
			return ResponseEntity.ok(new Res("Not OK",false));
	}
	
	@PostMapping("/updateInline")
	public ResponseEntity<?> updateInline(String createdItems,
	        @RequestParam(required = false,value ="updatedItems") String updatedItems,
	        @RequestParam(required = false,value ="deletedItems") String deletedItems) throws IOException{
		try {
			ObjectMapper json = new ObjectMapper();
			List<Property> created = new ArrayList<>();
			List<Property> updated = new ArrayList<>();
			List<Property> deleted = new ArrayList<>();
			
			created = Arrays.asList(json.readValue(createdItems,Property[].class));
			updated = Arrays.asList(json.readValue(updatedItems,Property[].class));
			deleted = Arrays.asList(json.readValue(deletedItems,Property[].class));
			
			if(created.size() > 0) {
				propertyService.saveAll(created);
			}
			if(updated.size() > 0) {
				propertyService.saveAll(updated);
			}
			if(deleted.size() > 0) {
				for(Property entity: deleted) {
					entity.setIsDelete(true);
				}
//				propertyService.deleteInBatch(deleted);
			}
			return ResponseEntity.ok(new Res(propertyService.findAll(),"Save success",true)); 
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false)); 
		}
	}
}
