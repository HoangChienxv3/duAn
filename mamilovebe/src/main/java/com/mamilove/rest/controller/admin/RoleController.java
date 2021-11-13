package com.mamilove.rest.controller.admin;

import com.mamilove.dao.RoleDao;
import com.mamilove.request.dto.Res;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/role")
public class RoleController {

    @Autowired
    RoleDao roleDao;

    @GetMapping("/all")
    public ResponseEntity<Res> getAllRole(){
        return ResponseEntity.ok(new Res(roleDao.findAll(),"Thành công",true));
    }

}
