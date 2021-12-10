package com.mamilove.rest.controller.admin;

import com.mamilove.dao.MamiPayDao;
import com.mamilove.response.dto.Res;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Manager/OrderDetailManagerController")
@CrossOrigin("http://localhost:4200/")

public class MamiPayManagerController {

    @Autowired
    MamiPayDao mamiPayDao;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getMamiPay() {
        return ResponseEntity.ok(new Res(mamiPayDao.findAll(), "Thành công", true));
    }

}
