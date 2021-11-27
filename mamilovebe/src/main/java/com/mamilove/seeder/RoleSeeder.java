package com.mamilove.seeder;

import com.mamilove.common.ERole;
import com.mamilove.dao.RoleDao;
import com.mamilove.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;

public class RoleSeeder implements Seeder {

    @Override
    public void seed() {

        RoleDao roleDao = BeanUtil.getBean(RoleDao.class);

        if (!roleDao.findByName(ERole.ROLE_ADMIN.toString()).isPresent()) {
            Role role = new Role();
            role.setName(ERole.ROLE_ADMIN.toString());
            role.setId("admin");
            roleDao.save(role);
        }
        if (!roleDao.findByName(ERole.ROLE_STAFF.toString()).isPresent()) {
            Role role = new Role();
            role.setName(ERole.ROLE_STAFF.toString());
            role.setId("staff");
            roleDao.save(role);
        }
        if (!roleDao.findByName(ERole.ROLE_CUSTOMER.toString()).isPresent()) {
            Role role = new Role();
            role.setName(ERole.ROLE_CUSTOMER.toString());
            role.setId("customer");
            roleDao.save(role);
        }
    }
}
