package com.all.service;

import org.springframework.stereotype.Service;

import com.all.entity.User;

@Service
public interface UserService {

	public User getUserByUser(User user);

	public void insert(User user);

}
