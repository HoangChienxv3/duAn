package com.mamilove.rest.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Product;
import com.mamilove.entity.Size;
import com.mamilove.request.dto.JwtResponse;

import com.mamilove.response.dto.Res;
import com.mamilove.service.service.CategoryDetailService;
import com.mamilove.service.service.ImageService;
import com.mamilove.service.service.ProductService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/ProductManagerController")
public class ProductManagerController {
    private final Path root = Paths.get("severImg");
    public String upload;
    @Autowired
    ServletContext application;
    @Autowired
    ProductService productService;
    @Autowired
    ImageService ImageService;
    @Autowired
    CategoryDetailService categoryDetailService;

    @GetMapping("/findAll")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> findAll() {
        List<Product> entity = productService.findAll();
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

    @GetMapping("/findProductById/{id}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> findProductById(@PathVariable("id") Long id) {
        Product entity = productService.findById(id);
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

    @PostMapping("/saveAndFlush")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> saveAndFlush(@RequestParam(required = false, value = "files") MultipartFile file,
    									@RequestParam(required = false, value = "Product") String data) {
        try {
            ObjectMapper json = new ObjectMapper();
            Product product = json.readValue(data, Product.class);
            if (file != null) {
                String filename = file.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                filename = uuid.toString() + ".jpg";
                Files.copy(file.getInputStream(), this.root.resolve(filename));
                product.setImage(filename);
            }
            product.setIsDelete(false);
            Product entity = productService.saveAndFlush(product);
            return ResponseEntity.ok(new Res(entity, "Save success", true));
        } catch (Exception e) {
            // TODO: handle exception
            return ResponseEntity.ok(new Res("Save failed", false));
        }
    }

    @PostMapping("/deleteProduct")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> deleteProduct(@RequestBody Product product) {
        try {
            product.setIsDelete(true);
            return ResponseEntity.ok(new Res(product, "Save success", true));
        } catch (Exception e) {
            // TODO: handle exception
            return ResponseEntity.ok(new Res("Save failed", false));
        }
    }
}
