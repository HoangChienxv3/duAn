package com.mamilove.rest.controller.customer;

import com.mamilove.dao.OrderDetailDao;
import com.mamilove.entity.Orderdetail;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/Customer/OrderDetailController")
public class OrderDetailController {
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    OrderDetailDao orderDetailDao;


    @GetMapping("/list")
    public ResponseEntity<List<Orderdetail>> listOrderdetail() {
        return ResponseEntity.ok(orderDetailService.FinAll());
    }

    @PostMapping("{id}")
    public ResponseEntity<?> AllByCustomer(@PathVariable("id") Long id) {
        return ResponseEntity.ok(new Res(orderDetailService.AllByCustomer(id), "dat", true));
    }

    @GetMapping("/{idbill}")
    @PreAuthorize("hasRole('ROLE_CUSTOMER')")
    public ResponseEntity<List<Orderdetail>> getAllOrderdetail(@PathVariable("idbill") String idbill) {
        return ResponseEntity.ok(orderDetailDao.getListOrderDetail(idbill));

    }

}
