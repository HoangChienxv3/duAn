package com.mamilove.rest.controller.customer;

import com.mamilove.controllers.BaseController;
import com.mamilove.response.dto.Res;
import com.mamilove.vnpay.MamiPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Customer/MamiPayController")
@CrossOrigin("http://localhost:4200/")
public class MamiPayController extends BaseController {

    @Autowired
    MamiPayService mamiPayService;

    @PostMapping("/create")
    public ResponseEntity<Res> creteMamiPay() {
        return ResponseEntity.ok(new Res(mamiPayService.createMamiPay(getAuthUID()), "Thành công", true));
    }

    @GetMapping("/mamipay")
    public ResponseEntity<Res> getMamiPay() {
        return ResponseEntity.ok(new Res(mamiPayService.getMamiPayCustomer(getAuthUID()), "Thành công", true));
    }

}
