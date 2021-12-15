package com.mamilove.rest.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mamilove.entity.Customer;
import com.mamilove.response.dto.Res;
import com.mamilove.service.service.AccountService;
import com.mamilove.service.service.CustomerService;

@RestController
@CrossOrigin("http://localhost:4200/")
@RequestMapping("/Customer/CustomerController")
public class CustomerController {
	@Autowired
	CustomerService customerService;
	@Autowired
	AccountService accountService;

	@GetMapping("/{id}")
	@PreAuthorize("hasRole('ROLE_CUSTOMER')")
    public ResponseEntity<?> findByAccount(@PathVariable("id") Long id) {
        Customer customer = customerService.findByAccount(id);
        if (customer.getIsDelete() == true || customer.getAccount().getIsDelete() == true) {
            return ResponseEntity.ok(new Res(null, "Đã bị xóa", false));
        }
        return ResponseEntity.ok(new Res(customer, "Thanh cong", true));
    }

}
