package com.mamilove.rest.controller.admin;

import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Event;
import com.mamilove.entity.Product;
import com.mamilove.request.dto.EventDto;
import com.mamilove.request.dto.ProductDto;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CategoryDetailService;
import com.mamilove.service.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/admin/product")
public class ProductsController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryDetailService categoryDetailService;

    @GetMapping("/all")
    public ResponseEntity<?> getAll() {
        List<Product> product = productService.findAllFalse();
        return ResponseEntity.ok(new Res(product, "findAll success", true));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Res> getDetail(@PathVariable("id") Long id) {
        Product product = productService.findById(id);
        if (product.getIsDelete() == true || product.getCategorydetail().getIsDelete()==true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa", false));
        }
        return ResponseEntity.ok(new Res(product, "finById success", true));
    }

    @PostMapping("/create")
    public ResponseEntity<?> create(@RequestBody ProductDto productDto) {
        Long idcategorydetail = productDto.getIdcategorydetail();
        Categorydetail categorydetail = categoryDetailService.findById(idcategorydetail);
        Product pr = new Product();
        pr.setCategorydetail(categorydetail);
        pr.setName(productDto.getName());
        pr.setPrice(productDto.getPrice());
        pr.setDescription(productDto.getDescription());
        pr.setDescriptionDetail(productDto.getDescriptionDetail());
        pr.setStatus(productDto.getStatus());
        pr.setDay_update(productDto.getDay_update());
        pr.setImage(productDto.getImage());
        pr.setDiscount(productDto.getDiscount());
        Product product = productService.create(pr);
        return ResponseEntity.ok(new Res(product, "dat", true));
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") Long id, @RequestBody ProductDto productDto) {
        Long idCate = productDto.getIdcategorydetail();
        Categorydetail categorydetail = categoryDetailService.findById(idCate);
        Product pr = new Product();
        pr.setCategorydetail(categorydetail);
        pr.setId(id);
        pr.setName(productDto.getName());
        pr.setPrice(productDto.getPrice());
        pr.setDescription(productDto.getDescription());
        pr.setDescriptionDetail(productDto.getDescriptionDetail());
        pr.setStatus(productDto.getStatus());
        pr.setDay_update(productDto.getDay_update());
        pr.setImage(productDto.getImage());
        pr.setDiscount(productDto.getDiscount());
        Product product = productService.create(pr);
        return ResponseEntity.ok(new Res(product, "update", true));
    }

    @PutMapping("/delete/{id}")
    public ResponseEntity<Res> delete(@PathVariable("id") Long id) {
        Product pr = productService.findById(id);
        if (pr != null) {
            pr.setIsDelete(true);
        }
        Product product = productService.create(pr);
        return ResponseEntity.ok(new Res(product, "xóa thành công", true));
    }
}
