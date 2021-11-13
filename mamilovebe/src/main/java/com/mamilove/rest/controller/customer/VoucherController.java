package com.mamilove.rest.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.request.dto.Res;
import com.mamilove.service.service.VoucherService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/VoucherController")
public class VoucherController {
	@Autowired
	VoucherService voucherService;
	
	@GetMapping("/findAll")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(new Res(voucherService.findAll(),"",true));
	}
	
	@GetMapping("/findVoucherByAmount")
	public ResponseEntity<?> findVoucherByAmout(){
		return ResponseEntity.ok(new Res(voucherService.findVoucherByAmount(),"",true));
	}
}
