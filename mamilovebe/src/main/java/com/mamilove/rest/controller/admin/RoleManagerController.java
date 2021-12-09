package com.mamilove.rest.controller.admin;

import com.mamilove.dao.RoleDao;
import com.mamilove.response.dto.Res;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Manager/RoleManagerController")
public class RoleManagerController {

    @Autowired
    RoleDao roleDao;

    @GetMapping("/findAll")
    @PreAuthorize("hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getAllRole() {
        return ResponseEntity.ok(new Res(roleDao.findAll(), "Thành công", true));
    }

}
