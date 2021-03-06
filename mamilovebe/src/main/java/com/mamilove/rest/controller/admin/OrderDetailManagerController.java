package com.mamilove.rest.controller.admin;

import com.mamilove.dao.OrderDetailDao;
import com.mamilove.entity.Orderdetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Manager/OrderDetailManagerController")
@CrossOrigin("http://localhost:4200/")

public class OrderDetailManagerController {

    @Autowired
    OrderDetailDao orderDetailDao;

    @GetMapping("/{idbill}")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<List<Orderdetail>> getAllOrderdetail(@PathVariable("idbill") String idbill) {
        return ResponseEntity.ok(orderDetailDao.getListOrderDetail(idbill));

    }


}
