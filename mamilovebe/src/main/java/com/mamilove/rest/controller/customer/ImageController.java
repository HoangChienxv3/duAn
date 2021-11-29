package com.mamilove.rest.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Image;
import com.mamilove.entity.Product;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.ImageService;
import com.mamilove.service.service.ProductService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/ImageController")
public class ImageController {
    @Autowired
    ImageService imageService;
    @Autowired
    ProductService productService;

    @GetMapping("/findByProduct/{productId}")
    public ResponseEntity<?> findByProduct(@PathVariable("productId") Long id) {
        Product product = productService.findById(id);
        List<Image> entity = imageService.findByProduct(product);
        return ResponseEntity.ok(new Res(entity, "Success", true));
    }

}
