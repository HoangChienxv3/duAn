package com.mamilove.rest.controller.admin;

import com.mamilove.entity.Account;
import com.mamilove.entity.Customer;
import com.mamilove.request.dto.CustomerDto;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.AccountService;
import com.mamilove.service.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Manager/CustomersManagerController")
public class CustomersManagerController {
    @Autowired
    CustomerService customerService;
    @Autowired
    AccountService accountService;

    @GetMapping("/findAll")
    public ResponseEntity<?> getAll() {
        List<Customer> customer = customerService.findAllFalse();
        return ResponseEntity.ok(new Res(customer, "dat", true));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Res> getDetail(@PathVariable("id") Long id) {
        Customer customer = customerService.findById(id);
        if (customer.getIsDelete() == true || customer.getAccount().getIsDelete() == true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa", false));
        }
        return ResponseEntity.ok(new Res(customer, "Thanh cong", true));
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") Long id, @RequestBody CustomerDto customerDto) {
        Account ac = accountService.findById(customerDto.getIdaccount());
        Customer ct = customerService.findById(id);
        if (ct.getIsDelete() == true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa update lỗi", false));
        }
        Customer cts = new Customer();
        cts.setId(id);
        cts.setFullname(customerDto.getFullname());
        cts.setStatuscustomer(customerDto.getStatuscustomer());
        cts.setAccount(ac);
        Customer customer = customerService.update(cts);
        return ResponseEntity.ok(new Res(customer, "update t", true));
    }

    @PutMapping("/delete/{id}")
    public ResponseEntity<Res> delete(@PathVariable("id") Long id) {
        Customer ct = customerService.findById(id);
        if (ct != null) {
            ct.setIsDelete(true);
        }
        Customer customer = customerService.update(ct);
        return ResponseEntity.ok(new Res(customer, "xóa thành công", true));
    }
}
