package com.mamilove.vnpay;

import com.mamilove.controllers.BaseController;
import com.mamilove.entity.Customer;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HistoryManagerController extends BaseController {
    @Autowired
    HistoryService historyService;
    @Autowired
    CustomerService customerService;

    @GetMapping("/history/list")
    public ResponseEntity<?> listHistory() {
        return ResponseEntity.ok(new Res(historyService.findAll(), "thành công", true));
    }

    @GetMapping("/history")
    public ResponseEntity<?> listHistoryBycustomer() {
        Customer customer = customerService.findByAccount(getAuthUID());
        Long idcustormer = customer.getId();
        return ResponseEntity.ok(new Res(historyService.findAllByCustomerId(idcustormer), "thành công", true));
    }
}
