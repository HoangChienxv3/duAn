package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Account;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountDao extends JpaRepository<Account, Long> {

    Optional<Account> findByUsername(String username);

    Optional<Account> findByEmail(String email);

    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}
