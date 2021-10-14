package com.mamilove.rest.controller.customer.Impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Bill;
import com.mamilove.entity.Mamipay;
import com.mamilove.request.dto.Res;
import com.mamilove.service.impl.MamipayServiceImpl;
import com.mamilove.service.service.BillService;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.OrderDetailService;
//import jdk.internal.org.objectweb.asm.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/bill")
public class BillController {
    @Autowired
    BillService billService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    MamipayServiceImpl mamipayService;
    @Autowired
    CustomerService customerService;

    @PostMapping("{id}")
    public ResponseEntity<?>  BillByCustomer(@PathVariable("id") Long id){
        return ResponseEntity.ok(new Res(billService.BillByCustomer(id),"dat",true)) ;
    }
    @GetMapping("/list")
    public ResponseEntity<List<Bill>> listBill(){
        return ResponseEntity.ok(billService.FinAll());
    }

    @PostMapping("/creat")
    public  ResponseEntity<?> post(@RequestBody JsonNode bill){
        ObjectMapper mapper = new ObjectMapper();
        Bill bills = mapper.convertValue(bill, Bill.class);
        if(bills.getPayment() == false){
            System.out.println("payment=> 0");
        }else if(bills.getPayment()==true) {
            System.out.println("payment=> 1");
          Mamipay mm = mamipayService.ByCustomer(bills.getCustomer().getId());
            if (mm.getSurplus()>=bills.getTotal()){
                System.out.println("toto bé");
                return ResponseEntity.ok(billService.save(bill));
            }else {
                System.out.println("toto lớn");
            }
        }
        return null;
    }
}
