package com.mamilove.rest.controller.customer;

import com.mamilove.controllers.BaseController;
import com.mamilove.dao.AccountDao;
import com.mamilove.entity.*;
import com.mamilove.dao.QuantityDao;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.Res;
import com.mamilove.request.dto.UpdateBillCutomer;
import com.mamilove.service.impl.MamipayServiceImpl;
import com.mamilove.service.service.BillService;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bill")
@CrossOrigin("http://localhost:4200/")
public class BillController extends BaseController {

    @Autowired
    BillService billService;
    @Autowired
    AccountDao accountDao;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    MamipayServiceImpl mamipayService;
    @Autowired
    CustomerService customerService;

    @Autowired
    QuantityDao quantityDao;

    @PostMapping("{id}")
    public ResponseEntity<?>  BillByCustomer(@PathVariable("id") Long id){
        return ResponseEntity.ok(new Res(billService.BillByCustomer(id),"Thông tin đơn hàng",true)) ;
    }
    @GetMapping("/list")
    public ResponseEntity<List<Bill>> listBill(){
        return ResponseEntity.ok(billService.FindAll());
    }

    @PostMapping("/creat")
    public  ResponseEntity<?> createBill(@RequestBody BillDto billDto){
       return ResponseEntity.ok(new Res(billService.create(billDto),"oke", true));
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<Res> updateBill(@RequestBody UpdateBillCutomer updateBillCutomer,@PathVariable("id")String idbill){
        return ResponseEntity.ok(new Res(billService.updateBillCustomer(updateBillCutomer, idbill),"ok", true));
    }

    @GetMapping("/cancel/{id}")
    public ResponseEntity<Res> cancelBill(@PathVariable("id")String idbill){
        return ResponseEntity.ok(new Res(billService.cancelBill(idbill),"Đã Hủy", true));
    }
}