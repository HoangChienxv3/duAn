package com.mamilove.seeder;

import com.mamilove.common.ERole;
import com.mamilove.dao.AccountDao;
import com.mamilove.dao.AuthorityDao;
import com.mamilove.dao.CustomerDao;
import com.mamilove.dao.RoleDao;
import com.mamilove.entity.Account;
import com.mamilove.entity.Authority;
import com.mamilove.entity.Customer;
import com.mamilove.entity.Role;

public class AccountSeeder implements Seeder{

    @Override
    public void seed() {
        RoleDao roleDao = BeanUtil.getBean(RoleDao.class);
        AccountDao accountDao = BeanUtil.getBean(AccountDao.class);
        CustomerDao customerDao = BeanUtil.getBean(CustomerDao.class);
        AuthorityDao authorityDao = BeanUtil.getBean(AuthorityDao.class);

        if(!accountDao.findByUsername("admin").isPresent()) {
            Account account = new Account();
            account.setPassword("$2a$12$xV/HkPLgQhhC3HTA5jcgse6Ruu2OPaBcq.A.ckpbfdBGz89troxx.");
            account.setUsername("admin");

            Role role  = roleDao.findByName(ERole.ROLE_ADMIN.toString()).get();
            Authority authority = new Authority();
            authority.setRole(role);
            authority.setAccount(account);

            accountDao.save(account);
            authorityDao.save(authority);

        }
        if(!accountDao.findByUsername("staff").isPresent()) {
            Account account = new Account();
            account.setPassword("$2a$12$xV/HkPLgQhhC3HTA5jcgse6Ruu2OPaBcq.A.ckpbfdBGz89troxx.");
            account.setUsername("staff");

            Role role  = roleDao.findByName(ERole.ROLE_STAFF.toString()).get();
            Authority authority = new Authority();
            authority.setRole(role);
            authority.setAccount(account);

            accountDao.save(account);
            authorityDao.save(authority);

        }
        if(!accountDao.findByUsername("customer").isPresent()) {
            Account account = new Account();
            account.setPassword("$2a$12$xV/HkPLgQhhC3HTA5jcgse6Ruu2OPaBcq.A.ckpbfdBGz89troxx.");
            account.setUsername("customer");

            Role role  = roleDao.findByName(ERole.ROLE_CUSTOMER.toString()).get();
            Authority authority = new Authority();
            authority.setRole(role);
            authority.setAccount(account);

            accountDao.save(account);
            authorityDao.save(authority);

            Customer customer = new Customer();
            customer.setIdaccount(account.getId());
            customer.setFullname("Khách hàng");

            customerDao.save(customer);

        }
    }
}
