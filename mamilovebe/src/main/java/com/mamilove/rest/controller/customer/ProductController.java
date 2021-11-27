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

import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Product;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CategoryDetailService;
import com.mamilove.service.service.ImageService;
import com.mamilove.service.service.ProductService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/ProductController")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    ImageService ImageService;
    @Autowired
    CategoryDetailService categoryDetailService;

    @GetMapping("/home")
    public ResponseEntity<?> findProductNew() {
        List<Product> entity = productService.findProductNew();
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() {
        List<Product> entity = productService.findAll();
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

    @GetMapping("/findProductById/{id}")
    public ResponseEntity<?> findProductById(@PathVariable("id") Long id) {
        Product entity = productService.findById(id);
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

    @GetMapping("/GetProductByCategory/{id}")
    public ResponseEntity<?> GetProductByCategory(@PathVariable("id") Long id) {
        Optional<Product> product = Optional.ofNullable(productService.findById(id));
        List<Product> entity = productService.findByCategoryDetail(product.get().getCategorydetail());
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

    @GetMapping("/collection/{id}")
    public ResponseEntity<?> GetProductByCategoryDetail(@PathVariable("id") Long id) {
        Optional<Categorydetail> categories = categoryDetailService.findById(id);
        List<Product> entity = productService.findByCategoryDetail(categories.get());
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }
}
