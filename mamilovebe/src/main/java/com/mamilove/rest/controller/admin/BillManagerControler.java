package com.mamilove.rest.controller.admin;

import com.mamilove.dao.BillDao;
import com.mamilove.request.dto.Res;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Manager/BillManagerController")
public class BillManagerControler {

    @Autowired
    BillDao billDao;

    //lấy tất cả đơn hàng
    public ResponseEntity<?> getAllBill(){
        return ResponseEntity.ok(new Res(billDao.findAll(),"Thành công", true));
    }
    //

}
