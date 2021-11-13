package com.mamilove.rest.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.mamilove.request.dto.TypeSizeRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.TypeSizeService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/TypeSizeManagerController")
public class TypeSizeManagerController {
	@Autowired
	TypeSizeService typeSizeService;
	
	@GetMapping("/findAll")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok( new Res(typeSizeService.findAll(),"OK",true));
	}
	
	@PostMapping("/updateInline")
	public ResponseEntity<?> updateInline(String createdItems,
	        @RequestParam(required = false,value ="updatedItems") String updatedItems,
	        @RequestParam(required = false,value ="deletedItems") String deletedItems) throws IOException{
		try {
			ObjectMapper json = new ObjectMapper();
			List<Typesize> created = new ArrayList<>();
			List<Typesize> updated = new ArrayList<>();
			List<Typesize> deleted = new ArrayList<>();
			
			created = Arrays.asList(json.readValue(createdItems,Typesize[].class));
			updated = Arrays.asList(json.readValue(updatedItems,Typesize[].class));
			deleted = Arrays.asList(json.readValue(deletedItems,Typesize[].class));
			
			if(created.size() > 0) {
				typeSizeService.saveAll(created);
			}
			if(updated.size() > 0) {
				typeSizeService.saveAll(updated);
			}
			if(deleted.size() > 0) {
				for(Typesize entity: deleted) {
					entity.setIsDelete(true);
				}
//				typeSizeService.deleteInBatch(deleted);
			}
			return ResponseEntity.ok(new Res(typeSizeService.findAll(),"Save success",true)); 
		} catch (Exception e) {
			// TODO: handle exception
			return ResponseEntity.ok(new Res("Save failed",false)); 
		}
	}
	//code chien
	@PostMapping("/create")
	public ResponseEntity<Res> createTypeSize(@RequestBody TypeSizeRequest typeSizeRequest){
		return ResponseEntity.ok(new Res(typeSizeService.create(typeSizeRequest),"Thêm thành công",true));
	}

	@PostMapping("/update/{id}")
	public ResponseEntity<Res> updateTypeSize(@PathVariable("id") Long id,@RequestBody TypeSizeRequest typeSizeRequest){
		return ResponseEntity.ok(new Res(typeSizeService.update(id,typeSizeRequest),"Thêm thành công",true));
	}

	@GetMapping("/delete/{id}")
	public ResponseEntity<Res> deleteTypeSize(@PathVariable("id") Long id){
		return ResponseEntity.ok(new Res(typeSizeService.delete(id),"Thêm thành công",true));
	}
}
