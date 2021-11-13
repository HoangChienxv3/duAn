package com.mamilove.rest.controller.admin;

import com.mamilove.request.dto.Res;
import com.mamilove.request.dto.VoucherRequest;
import com.mamilove.service.service.VoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;


@RestController
@RequestMapping("/Manager/VoucherManagerController")
public class VoucherManagerController {

    @Autowired
    VoucherService voucherService;

    @PostMapping("/create")
    public ResponseEntity<Res> cteateEvent(@RequestBody VoucherRequest voucherRequest) throws ParseException {
        return ResponseEntity.ok(new Res(voucherService.create(voucherRequest),"Thêm thành công", true));
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<Res> updateEvent(@PathVariable("id")Long id, @RequestBody VoucherRequest voucherRequest) throws ParseException {
        return ResponseEntity.ok(new Res(voucherService.update(id,voucherRequest),"Thêm thành công", true));
    }

    @GetMapping("/detele/{id}")
    public ResponseEntity<Res> deteleEvent(@PathVariable("id")Long id){
        return ResponseEntity.ok(new Res(voucherService.detele(id),"Xóa thành công", true));
    }

    @GetMapping("/findAll")
    public ResponseEntity<Res> findAll(){
        return ResponseEntity.ok(new Res(voucherService.findAllVoucher(),"thành công", true));
    }
    @GetMapping("/findAll/{idEvent}")
    public ResponseEntity<Res> findAll(@PathVariable("idEvent")Long idEvent){
        return ResponseEntity.ok(new Res(voucherService.findAllVoucherByIdEvent(idEvent),"thành công", true));
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<Res> findById(@PathVariable("id")Long id){
        return ResponseEntity.ok(new Res(voucherService.findById(id),"thành công", true));
    }
//

}
