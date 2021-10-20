package com.mamilove.rest.controller.customer;

import com.mamilove.service.service.VoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Voucher")
public class VoucherController {

    @Autowired
    VoucherService voucherService;



}
