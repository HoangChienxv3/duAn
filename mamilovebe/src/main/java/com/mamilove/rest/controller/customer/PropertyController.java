package com.mamilove.rest.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Property;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.PropertyService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/PropertyController")
public class PropertyController {
    @Autowired
    PropertyService propertyService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() {
        List<Property> entity = propertyService.findAll();
        if (entity.size() > 0)
            return ResponseEntity.ok(new Res(propertyService.findAll(), "OK", true));
        else
            return ResponseEntity.ok(new Res("Not OK", false));
    }
}
