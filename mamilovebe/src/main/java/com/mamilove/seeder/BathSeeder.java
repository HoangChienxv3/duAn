package com.mamilove.seeder;

import java.util.ArrayList;
import java.util.Arrays;

public class BathSeeder implements Seeder {

    private final Seeder[] seeders = new Seeder[]{
            new RoleSeeder(),
            new AccountSeeder(),
            new SizeSeeder()
    };

    @Override
    public void seed() {
        new ArrayList<>(Arrays.asList(seeders)).forEach(Seeder::seed);
    }
}
