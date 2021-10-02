package com.mamilove.controllers;

import com.mamilove.common.ERole;
import com.mamilove.common.JwtUtils;
import com.mamilove.dao.AccountDao;
import com.mamilove.dao.AuthorityDao;
import com.mamilove.dao.RoleDao;
import com.mamilove.entity.Authority;
import com.mamilove.entity.Role;
import com.mamilove.request.dto.JwtResponse;
import com.mamilove.request.dto.LoginRequest;
import com.mamilove.request.dto.Res;
import com.mamilove.entity.Account;
import com.mamilove.request.dto.SignupRequest;
import com.mamilove.userdetails.service.UserDetailsImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/auth")
public class LoginController {

    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    AccountDao accountDao;

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
        if (loginRequest.getUsername() == "") {
            return ResponseEntity.ok(new Res("Chưa nhập Username", false));
        }
        if (loginRequest.getPassword() == "") {
            return ResponseEntity.ok(new Res("Chưa nhập Password", false));
        }
        //
        Account account = getAccount(loginRequest);
        //
        if (account != null) {
            if (!encoder.matches(loginRequest.getPassword(), account.getPassword())) {
                return ResponseEntity.ok(new Res("Mật khẩu sai", false));
            }
        } else {
            return ResponseEntity.ok(new Res("Tài khoản không tồn tại", false));
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
                .map(item -> item.getAuthority())
                .collect(Collectors.toList());
        //
        return ResponseEntity.ok(new Res(new JwtResponse(jwt,
                userDetails.getId(),
                userDetails.getUsername(),
                userDetails.getEmail(),
                roles), "Đăng nhập thành công", true));
  //      return ResponseEntity.ok(userDetails);
    }

    //create account
    @PostMapping("/signup/admin")
    public ResponseEntity<?> registerAccount(@Valid @RequestBody SignupRequest signupRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.NOT_MODIFIED);
        }
        if (accountDao.existsByUsername(signupRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new Res("Username đã tồn tại", false));
        }
        if (accountDao.existsByEmail(signupRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new Res("Email đã tồn tại", false));
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
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy Role"));
            roleList.add(accountRole);
            return ResponseEntity.ok(new Res(roleList, "test", true));
        } else {
            roles.forEach(role -> {
                switch (role) {
                    case "admin":
                        Role adminRole = roleDao.findByName("ROLE_ADMIN")
                                .orElseThrow(() -> new RuntimeException("Error: role is not found."));
                        roleList.add(adminRole);
                        break;
                    default:
                        Role staffRole = roleDao.findByName("ROLE_STAFF")
                                .orElseThrow(() -> new RuntimeException("Error: roles is not found."));
                        roleList.add(staffRole);
                }
            });
        }
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

        return ResponseEntity.ok(new Res(account,"Thêm tài khoản phía quản lý thành công", true));

   }
}