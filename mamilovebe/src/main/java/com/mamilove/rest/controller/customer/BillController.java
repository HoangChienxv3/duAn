package com.mamilove.rest.controller.customer;

import com.mamilove.entity.Bill;
import com.mamilove.entity.Mamipay;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.Res;
import com.mamilove.service.impl.MamipayServiceImpl;
import com.mamilove.service.service.BillService;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class BillController {
    @Autowired
    BillService billService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    MamipayServiceImpl mamipayService;
    @Autowired
    CustomerService customerService;


    @GetMapping("/listOrder")
    public ResponseEntity<?> getlistOrder() {
          return ResponseEntity.ok(new Res(orderDetailService.FindAll(),"List order: ",false));
    }
    @PutMapping("/order/{id}")
    public ResponseEntity<?> AllByCustomer(@PathVariable("id") Long id) {
        return ResponseEntity.ok(new Res(orderDetailService.AllByCustomer(id),"All by Customer",false));
    }

    @PutMapping("/bill{id}")
    public ResponseEntity<?>  BillByCustomer(@PathVariable("id") Long id){
        return ResponseEntity.ok(new Res(billService.BillByCustomer(id),"thành công",true)) ;
    }
    @GetMapping("/listbill")
    public ResponseEntity<List<Bill>> listBill(){
        return ResponseEntity.ok(billService.FindAll());
    }

    @PostMapping("bill/creat")
    public  ResponseEntity<?> post(@RequestBody BillDto bill){
        if(bill.getPayment() == false){
            return ResponseEntity.ok(new Res("Chưa thanh toán",false)) ;
        }else if (bill.getPayment()==true){
            Mamipay mm = mamipayService.ByCustomer(bill.getCusTomerDto().getId());
            if(mm.getSurplus()>=bill.getTotal()){
                return ResponseEntity.ok(new Res(billService.save(bill),"Đã thanh toán",true));
            }else {
                return ResponseEntity.ok(new Res("Số dư ví của bạn không đủ",false)) ;
            }
        }
        return null;
    }

}
