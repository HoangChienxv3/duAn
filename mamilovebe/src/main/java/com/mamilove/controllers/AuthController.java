package com.mamilove.controllers;

import com.mamilove.common.JwtUtils;
import com.mamilove.dao.AccountDao;
import com.mamilove.dao.AuthorityDao;
import com.mamilove.dao.CustomerDao;
import com.mamilove.dao.RoleDao;
import com.mamilove.entity.Authority;
import com.mamilove.entity.Customer;
import com.mamilove.entity.Role;
import com.mamilove.request.dto.*;
import com.mamilove.entity.Account;
import com.mamilove.response.dto.Res;
import com.mamilove.userdetails.service.UserDetailsImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin(origins = "http://localhost:4200/")
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    AccountDao accountDao;

    @Autowired
    CustomerDao customerDao;

    @Autowired
    AuthorityDao authorityDao;

    @Autowired
    RoleDao roleDao;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    private Account getAccount(LoginRequest loginRequest) {
        if (loginRequest.getUsername() != null) {
            Optional<Account> user = accountDao.findByUsername(loginRequest.getUsername());
            if (user.isPresent()) {
                return user.get();
            }
            Optional<Account> user2 = accountDao.findByEmail(loginRequest.getUsername());
            if (user2.isPresent()) {
                return user2.get();
            }
        }
        return null;
    }

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Validated @RequestBody LoginRequest loginRequest) {
        if (Objects.equals(loginRequest.getUsername(), "")) {
            return ResponseEntity.ok(new Res("Ch??a nh???p Username", false));
        }
        if (Objects.equals(loginRequest.getPassword(), "")) {
            return ResponseEntity.ok(new Res("Ch??a nh???p Password", false));
        }
        //
        Account account = getAccount(loginRequest);
        //
        if (account != null) {
            if (!encoder.matches(loginRequest.getPassword(), account.getPassword())) {
                return ResponseEntity.ok(new Res("M???t kh???u sai", false));
            }
        } else {
            return ResponseEntity.ok(new Res("T??i kho???n kh??ng t???n t???i", false));
        }
        //
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        account.getUsername(),
                        loginRequest.getPassword())
        );
        //
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);
        //
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        List<String> roles = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());
        //
        return ResponseEntity.ok(new Res(new JwtResponse(jwt,
                userDetails.getId(),
                userDetails.getUsername(),
                userDetails.getEmail(),
                roles), "????ng nh???p th??nh c??ng", true));
        //      return ResponseEntity.ok(userDetails);
    }

    //create account admin
    @PostMapping("/signup/admin")
    public ResponseEntity<?> registerAccount(@Valid @RequestBody SignupRequest signupRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.NOT_MODIFIED);
        }
        if (accountDao.existsByUsername(signupRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new Res("Username ???? t???n t???i", false));
        }
        if (accountDao.existsByEmail(signupRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new Res("Email ???? t???n t???i", false));
        }
        //
        Account account = new Account();
        BeanUtils.copyProperties(signupRequest, account);
//
        Set<Role> roleList = new HashSet<>();
        List<String> roles = signupRequest.getRole();
//
        if (roles.size() == 0) {
            Role accountRole = roleDao.findByName("ROLE_STAFF")
                    .orElseThrow(() -> new RuntimeException("Kh??ng t??m th???y Role"));
            roleList.add(accountRole);
            return ResponseEntity.ok(new Res(roleList, "test", true));
        } else {
            roles.forEach(role -> {
                if ("ROLE_ADMIN".equals(role)) {
                    Role adminRole = roleDao.findByName("ROLE_ADMIN")
                            .orElseThrow(() -> new RuntimeException("Error: role is not found."));
                    roleList.add(adminRole);
                } else {
                    Role staffRole = roleDao.findByName("ROLE_STAFF")
                            .orElseThrow(() -> new RuntimeException("Error: roles is not found."));
                    roleList.add(staffRole);
                }
            });
        }
        //
        account.setPassword(encoder.encode(account.getPassword()));
        accountDao.save(account);
        List<Authority> authorityList = new ArrayList<>();
        roleList.forEach(role -> {
            Authority authority = new Authority();
            authority.setAccount(account);
            authority.setRole(role);
            authorityList.add(authority);

        });
        authorityDao.saveAll(authorityList);
        account.setAuthorities(authorityList);

        return ResponseEntity.ok(new Res(account, "Th??m t??i kho???n ph??a qu???n l?? th??nh c??ng", true));

    }

    //create account customer
    @PostMapping("/signup/customer")
    public ResponseEntity<?> registerCustomer(@Valid @RequestBody SignupCustomerRequest signupCustomerRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.NOT_MODIFIED);
        }
        SignupRequest signupRequest = signupCustomerRequest.getSignupRequest();
        if (accountDao.existsByUsername(signupRequest.getUsername())) {
            return ResponseEntity.ok(new Res("Username ???? t???n t???i", false));
        }
        if (accountDao.existsByEmail(signupRequest.getEmail())) {
            return ResponseEntity.ok(new Res("Email ???? t???n t???i", false));
        }
        if (accountDao.existsByPhone(signupRequest.getPhone())) {
            return ResponseEntity.ok(new Res("SDT ???? t???n t???i", false));
        }

        CustomerRequest customerRequest = signupCustomerRequest.getCustomerRequest();

        Account account = new Account();
        BeanUtils.copyProperties(signupRequest, account);
        account.setPassword(encoder.encode(account.getPassword()));
        //
        //
        Set<Role> roleList = new HashSet<>();
        //
        Role accountRole = roleDao.findByName("ROLE_CUSTOMER")
                .orElseThrow(() -> new RuntimeException("Kh??ng t??m th???y Role"));
        roleList.add(accountRole);
        //
        accountDao.save(account);
        List<Authority> authorityList = new ArrayList<>();
        roleList.forEach(role -> {
            Authority authority = new Authority();
            authority.setAccount(account);
            authority.setRole(role);
            authorityList.add(authority);
        });
        authorityDao.saveAll(authorityList);
        account.setAuthorities(authorityList);

        Customer customer = new Customer();
        BeanUtils.copyProperties(customerRequest, customer);
        customer.setIdaccount(account.getId());
        customer.setStatuscustomer("");
        customerDao.save(customer);

        return ResponseEntity.ok(new Res(customer, "ok", true));

    }


}
