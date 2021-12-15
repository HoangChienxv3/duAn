package com.mamilove.rest.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Category;
import com.mamilove.service.service.CategoryService;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Customer/CategoryController")
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @GetMapping(value = "/findAllByIsDeleteFalse", produces = "application/json")
    public ResponseEntity<List<Category>> findAll() {
        return ResponseEntity.ok(categoryService.findAllByIsDeleteFalse());
    }
}
