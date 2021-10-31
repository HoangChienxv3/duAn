package com.mamilove.controllers;

import com.mamilove.entity.Account;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

public class BaseController {
    public Long getAuthUID() {
        return getAuthCredentials().map(Account::getId).orElse(null);
    }

    public String getAuthUsername() {
        return getAuthCredentials().map(Account::getUsername).orElse(null);
    }

    public Optional<Account> getAuthCredentials() {
        return Optional.ofNullable((Account) SecurityContextHolder.getContext().getAuthentication().getCredentials());
    }
}
