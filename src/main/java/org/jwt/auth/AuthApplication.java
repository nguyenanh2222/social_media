package org.jwt.auth;

import org.jwt.auth.domain.Role;
import org.jwt.auth.domain.User;
import org.jwt.auth.service.UserService;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.context.annotation.Bean;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;

//-classpath /home/anh/Desktop/repo/respository/java/auth/target/classes
@SpringBootApplication
public class AuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(AuthApplication.class, args);
	}
	@Bean
	PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();

	}
	@Bean
	CommandLineRunner run (UserService userService) {
		return args -> {
			userService.saveRole(new Role(null, "ROLE_USER"));
			userService.saveRole(new Role(null, "ROLE_SUPPER_USER"));
			userService.saveRole(new Role(null, "USER_MANAGE"));
			userService.saveRole(new Role(null, "USER_IT"));
			userService.saveRole(new Role(null, "USER_HR"));

			userService.saveUser(new User(null, "Anh", "anh123", "123456", new ArrayList<>()));
			userService.saveUser(new User(null, "Dat", "dat123", "123456", new ArrayList<>()));
			userService.saveUser(new User(null, "Sang", "sang123", "123456", new ArrayList<>()));
			userService.saveUser(new User(null, "Long", "long23", "123456", new ArrayList<>()));
			userService.saveUser(new User(null, "TanLy", "tanly123", "123456", new ArrayList<>()));

			userService.addRoleToUser("anh123", "ROLE_USER");
			userService.addRoleToUser("anh123", "USER_HR");
			userService.addRoleToUser("dat123", "ROLE_SUPPER_USER");
			userService.addRoleToUser("sang123", "USER_MANAGE");
			userService.addRoleToUser("long23", "USER_IT");
			userService.addRoleToUser("tanly123", "USER_HR");
		};
	}
}
