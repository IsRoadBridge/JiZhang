package com.all.dao;

import org.springframework.stereotype.Repository;

import com.all.entity.User;

@Repository
public interface UserMapper {

	public User getUserByUser(User user);

	public void insert(User user);
}
