package com.mamilove.rest.controller.admin;

import com.mamilove.dao.BillDao;
import com.mamilove.request.dto.Res;
import com.mamilove.request.dto.ShipingRequest;
import com.mamilove.service.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/BillManagerController")
public class BillManagerControler {

    @Autowired
    BillDao billDao;

    @Autowired
    BillService billService;

    //lấy tất cả đơn hàng
    @GetMapping("/findAll")
    public ResponseEntity<?> getAllBill(){
        return ResponseEntity.ok(new Res(billDao.findAll(),"Thành công", true));
    }

    @GetMapping("/cancel/{idbill}")
    public ResponseEntity<Res> cancelBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.cancelBillManager(idbill),"Thành công", true));
    }

    @GetMapping("/confirm/{idbill}")
    public ResponseEntity<Res> confirmBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.confirmBillManager(idbill),"Thành công", true));
    }

    @GetMapping("/ship/{idbill}")
    public ResponseEntity<Res> shipBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.shipBillManager(idbill),"Thành công", true));
    }

    @GetMapping("/received/{idbill}")
    public ResponseEntity<Res> receivedBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.receivedBillManager(idbill),"Thành công", true));
    }

    @GetMapping("/refund/{idbill}")
    public ResponseEntity<Res> refundBill(@PathVariable("idbill") String idbill){
        return ResponseEntity.ok(new Res(billService.refundBillManager(idbill),"Thành công", true));
    }

    //thông tin đơn hàng bên vận chuyển
    @PostMapping("/shiping")
    public ResponseEntity<Res> shipingBill(@RequestBody ShipingRequest shipingRequest){
        return ResponseEntity.ok(new Res(billService.shipingBill(shipingRequest),"Thành công",true));
    }

    @GetMapping("/shiping/{idBill}")
    public ResponseEntity<Res> shipingBill(@PathVariable("idBill")String idBill) throws IOException {
        return ResponseEntity.ok(new Res(billService.getShipingBill(idBill),"Thành công",true));
    }
}
