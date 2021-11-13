package com.mamilove;

import com.mamilove.seeder.BathSeeder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MamilovebeApplication {

	public static void main(String[] args) {
		SpringApplication.run(MamilovebeApplication.class, args);
		new BathSeeder().seed();
	}
}
