package com.mamilove.rest.controller.admin;

import com.mamilove.dao.MamiPayDao;
import com.mamilove.entity.Orderdetail;
import com.mamilove.request.dto.Res;
import com.mamilove.vnpay.MamiPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Manager/OrderDetailManagerController")
public class MamiPayManagerController {

    @Autowired
    MamiPayDao mamiPayDao;

    @GetMapping("/all")
    public ResponseEntity<Res> getMamiPay(){
        return ResponseEntity.ok(new Res(mamiPayDao.findAll(),"Thành công",true));
    }

}
