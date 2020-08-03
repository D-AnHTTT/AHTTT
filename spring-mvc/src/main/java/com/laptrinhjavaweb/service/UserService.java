package com.laptrinhjavaweb.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.User;
import com.laptrinhjavaweb.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository UserRP;

	public boolean saveUser(User user) {
		String password = user.getPassword();
		return UserRP.save(user) != null;
	}

	public List<User> findAll() {
		return UserRP.findAll();
	}

	public User findId(long id) {
		return UserRP.findOne(id);
	}
	public User findByUsernameAndPassword(String username,String password) {
		return UserRP.findByUsernameAndPassword(username, password);
	}
	

	public void delete(long id) {
		UserRP.delete(id);
	}

}
