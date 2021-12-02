package com.mamilove.rest.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.dao.AccountDao;
import com.mamilove.entity.Account;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/AccountManagerController")
public class AccountManagerController {
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDAO;
    @Autowired
    PasswordEncoder encoder;

    @GetMapping(value = "/findAll")
    public ResponseEntity<?> getUserList() {
        return ResponseEntity.ok(new Res(accountService.findAll(), "Save Success", true));
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<?> getOne(@PathVariable("id") long id) {
        if (!accountService.existsById(id)) {
            ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new Res(accountService.findById(id), "thong tin tai khoan", true));
    }

    @PostMapping(value = "/updateInline")
    public ResponseEntity<?> updateInline(@RequestParam(required = false, value = "createdItems") String createdItems,
                                          @RequestParam(required = false, value = "updatedItems") String updatedItems,
                                          @RequestParam(required = false, value = "deletedItems") String deletedItems) {
        try {
            ObjectMapper json = new ObjectMapper();
            List<Account> created;
            List<Account> updated;
            List<Account> deleted;

            created = Arrays.asList(json.readValue(createdItems, Account[].class));
            updated = Arrays.asList(json.readValue(updatedItems, Account[].class));
            deleted = Arrays.asList(json.readValue(deletedItems, Account[].class));

            if (created.size() > 0) {
                for (Account entity : created) {
                    entity.setPassword(encoder.encode(entity.getPassword()));
                    entity.setIsDelete(false);
                }
                accountDAO.saveAll(created);
            }
            if (updated.size() > 0) {
                for (Account entity : updated) {
                    entity.setPassword(encoder.encode(entity.getPassword()));
                    entity.setIsDelete(false);
                }
                accountDAO.saveAll(updated);
            }
            if (deleted.size() > 0) {
                for (Account entity : deleted) {
                    entity.setIsDelete(true);
                }
                accountDAO.saveAll(deleted);
//				categoryDetailService.deleteInBatch(deleted);
            }
            return ResponseEntity.ok(new Res(accountDAO.findAll(), "Save success", true));
        } catch (Exception e) {
            // TODO: handle exception
            return ResponseEntity.ok(new Res("Save failed", false));
        }
    }
}
