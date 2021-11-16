package com.mamilove.rest.controller.admin;

import com.mamilove.dao.AccountDao;
import com.mamilove.entity.Account;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/AccountManagerController")
public class AccountManagerController {
    @Autowired
    AccountService accountService;

    @GetMapping(value = "/findAll")
    public ResponseEntity<?> getUserList() {
        return ResponseEntity.ok( new Res(accountService.findAll(),"Save Success",true));
    }
    @GetMapping(value = "/{id}")
    public ResponseEntity<?> getOne(@PathVariable("id") long id) {
        if (!accountService.existsById(id)) {
            ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new Res(accountService.findById(id),"thong tin tai khoan",true));
    }
    @PostMapping(value = "/saveAndFlush")
    public  ResponseEntity<?> saveAndFlush(@RequestBody Account account){
        accountService.save(account);
        return ResponseEntity.ok( new Res(account,"Save Success",true));
    }
}
