package com.mamilove.rest.controller.customer;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.SizeService;
import com.mamilove.service.service.TypeSizeService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/SizeController")
public class SizeController {
    @Autowired
    SizeService sizeService;
    @Autowired
    TypeSizeService typeService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(new Res(sizeService.findAll(), "OK", true));
    }

    @PostMapping("/findByTypeSize")
    public ResponseEntity<?> findByTypeSize(@RequestBody String id) {
        long l = Long.parseLong(id);
        Optional<Typesize> entity = Optional.ofNullable(typeService.findById(l).get());
        List<Size> list = sizeService.findByTypeSize(entity.get());
        return ResponseEntity.ok(new Res(list, "OK", true));
    }
}
