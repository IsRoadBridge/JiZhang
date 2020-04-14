package com.all.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.UserMapper;
import com.all.entity.User;
import com.all.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper um;

	@Override
	public User getUserByUser(User user) {
		User us = um.getUserByUser(user);
		return us;
	}

	@Override
	public void insert(User user) {
		um.insert(user);
	}

}
