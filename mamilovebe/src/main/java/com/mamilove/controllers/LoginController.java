package com.mamilove.controllers;

import com.mamilove.common.JwtUtils;
import com.mamilove.dao.AccountDao;
import com.mamilove.dao.RoleDao;
import com.mamilove.dto.JwtResponse;
import com.mamilove.dto.LoginRequest;
import com.mamilove.dto.Res;
import com.mamilove.entity.Account;
import com.mamilove.userdetails.service.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
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
    RoleDao roleDao;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    private Account getAccount(LoginRequest loginRequest){
        if(loginRequest.getUsername() != null){
            Optional<Account> user = accountDao.findByUsername(loginRequest.getUsername());
            if(user.isPresent()){
                return user.get();
            }
            Optional<Account> user2 = accountDao.findByEmail(loginRequest.getUsername());
            if(user2.isPresent()){
                return user2.get();
            }
        }
        return null;
    }

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Validated @RequestBody LoginRequest loginRequest){
        if(loginRequest.getUsername() == ""){
            return ResponseEntity.ok(new Res("Chưa nhập Username",false));
        }
        if(loginRequest.getPassword() == ""){
            return ResponseEntity.ok(new Res("Chưa nhập Password",false));
        }
        //
        Account account = getAccount(loginRequest);
        //
        if(account != null){
            if(!encoder.matches(loginRequest.getPassword(),account.getPassword())){
                return ResponseEntity.ok(new Res("Mật khẩu sai",false));
            }
        } else {
            return ResponseEntity.ok(new Res("Tài khoản không tồn tại",false));
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
                roles),"Đăng nhập thành công", true));
    }

}
