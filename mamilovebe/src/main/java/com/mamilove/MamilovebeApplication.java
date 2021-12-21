package com.mamilove;


import com.mamilove.seeder.BathSeeder;
import com.mamilove.service.service.FilesSerivce;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.Resource;

@SpringBootApplication
public class MamilovebeApplication implements CommandLineRunner {

    @Resource
    FilesSerivce storageService;

    public static void main(String[] args) {
        SpringApplication.run(MamilovebeApplication.class, args);
        new BathSeeder().seed();
    }

    @Override
    public void run(String... arg) throws Exception {
        storageService.init();
    }
}
