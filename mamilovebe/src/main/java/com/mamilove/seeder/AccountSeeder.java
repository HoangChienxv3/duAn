package com.mamilove.seeder;

import com.mamilove.dao.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

public class AccountSeeder implements Seeder{

    @Autowired
    AccountDao accountDao;

    @Override
    public void seed() {
    }
}
