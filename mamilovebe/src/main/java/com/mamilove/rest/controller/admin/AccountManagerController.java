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
@RequestMapping("/Manager/AccountController")
public class AccountManagerController {
    @Autowired
    AccountService accountService;

    @GetMapping(value = "")
    public ResponseEntity<List<Account>> getUserList(Model model) {
        return ResponseEntity.ok(accountService.findAll());
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<?> getOne(@PathVariable("id") long id) {
        if (!accountService.existsById(id)) {
            ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new Res(accountService.findById(id).get(),"thong tin tai khoan",true));
    }
    @PostMapping(value = "")
    public  ResponseEntity<Account> post(@RequestBody Account account){
        if(accountService.existsById(account.getId())){
            return ResponseEntity.badRequest().build();
        }
        accountService.save(account);
        return ResponseEntity.ok(account);
    }
    @PutMapping(value = "/{id}")
    public ResponseEntity<Account> updateAccount(@PathVariable("id") long id,@RequestBody Account account){
        if(!accountService.existsById(id)){
          return  ResponseEntity.notFound().build();
        }
        accountService.save(account);
        return ResponseEntity.ok(account);

    }
}
