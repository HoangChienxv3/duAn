package com.mamilove.rest.controller.customer;

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
@RequestMapping("/Customer/CategoryController")
public class CategoryController {
	@Autowired
	CategoryService categoryService;

	@GetMapping(value = "/findAll",produces = "application/json")
	public ResponseEntity<List<Category>> findAll(){
		return ResponseEntity.ok(categoryService.findAll());
	}
}
