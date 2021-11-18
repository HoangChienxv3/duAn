package com.mamilove.controllers;

import com.mamilove.userdetails.service.UserDetailsImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

public class BaseController {
    public Long getAuthUID() {
        return getAuthCredentials().map(UserDetailsImpl::getId).orElse(null);
    }

    public String getAuthUsername() {
        return getAuthCredentials().map(UserDetailsImpl::getUsername).orElse(null);
    }

    public Optional<UserDetailsImpl> getAuthCredentials() {
        return Optional.ofNullable((UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    }
}
