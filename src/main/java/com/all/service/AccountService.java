package com.all.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.all.entity.Account;

@Service
public interface AccountService {

	public List<Account> getAll();

	public Account getOne(int accountId);

	public void delete(int accountId);

	public void updateOne(Account account);

	public void insertOne(Account account);
}
