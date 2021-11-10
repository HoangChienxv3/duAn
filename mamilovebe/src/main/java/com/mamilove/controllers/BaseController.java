package com.mamilove.controllers;

import com.mamilove.userdetails.service.UserDetailsImpl;
import org.springframework.security.core.context.SecurityContextHolder;


public class BaseController {
    public Long getAuthUID() {
        return getAuthCredentials().getId();
    }

    public String getAuthUsername() {
        return getAuthCredentials().getUsername();
    }

    public UserDetailsImpl getAuthCredentials() {
        return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
