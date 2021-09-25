package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Account;

public interface AccountDao extends JpaRepository<Account, Long> {

}
