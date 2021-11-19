package com.mamilove.rest.controller.customer;

import com.mamilove.controllers.BaseController;
import com.mamilove.request.dto.Res;
import com.mamilove.vnpay.MamiPayService;
import com.mamilove.vnpay.MamipayServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Customer/CategoryDetailController")
public class MamiPayController extends BaseController {

    @Autowired
    MamiPayService mamiPayService;

    @PostMapping("/crete")
    public ResponseEntity<Res> creteMamiPay(){
        return ResponseEntity.ok(new Res(mamiPayService.creteMamiPay(getAuthUID()),"Thành công",true));
    }

    @GetMapping("/mamipay")
    public ResponseEntity<Res> getMamiPay(){
        return ResponseEntity.ok(new Res(mamiPayService.getMamiPayCustomer(getAuthUID()),"Thành công",true));
    }

}
