package com.mamilove.rest.controller.customer;

import com.mamilove.entity.Orderdetail;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orderdetail")
public class OrderDetailController {
    @Autowired
    OrderDetailService orderDetailService;

    @GetMapping("/list")
    public ResponseEntity<List<Orderdetail>> listOrderdetail() {
        return ResponseEntity.ok(orderDetailService.FinAll());
    }

    @PostMapping("{id}")
    public ResponseEntity<?> AllByCustomer(@PathVariable("id") Long id) {
        return ResponseEntity.ok(new Res(orderDetailService.AllByCustomer(id), "dat", true));
    }


}
