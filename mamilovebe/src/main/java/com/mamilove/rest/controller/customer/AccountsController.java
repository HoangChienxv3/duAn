package com.mamilove.rest.controller.customer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Account;
import com.mamilove.response.dto.Res;
import com.mamilove.request.dto.SignupRequest;
import com.mamilove.service.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/account")
@CrossOrigin("http://localhost:4200/")

public class AccountsController {
    @Autowired
    PasswordEncoder encoder;
    @Autowired
    AccountService accountService;
    @Autowired
    ObjectMapper objectMapper;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ROLE_CUSTOMER') or hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> getAll() {
        List<Account> account = accountService.findAllFalse();
        return ResponseEntity.ok(new Res(account, "dat", true));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_CUSTOMER') or hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> getDetail(@PathVariable("id") Long id) {
        Account account = accountService.findById(id);
        if (account.getIsDelete()) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa", false));
        }
        return ResponseEntity.ok(new Res(account, "Thanh cong", true));
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasRole('ROLE_CUSTOMER') or hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable("id") Long id, @RequestBody SignupRequest accounts) {
        Account ac = accountService.findById(id);
        if (ac.getIsDelete()) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa update lỗi", false));
        }
        ac.setId(id);
        ac.setEmail(accounts.getEmail());
        Account acs = accountService.save(ac);
        return ResponseEntity.ok(new Res(acs, "update t", true));
    }

    @PutMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_CUSTOMER') or hasRole('ROLE_STAFF') or hasRole('ROLE_ADMIN')")
    public ResponseEntity<Res> delete(@PathVariable("id") Long id) {
        Account ac = accountService.findById(id);
        if (ac != null) {
            ac.setIsDelete(true);
        }
        Account account = accountService.save(ac);
        return ResponseEntity.ok(new Res(account, "xóa thành công", true));
    }
}
