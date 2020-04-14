package com.all.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.AccountMapper;
import com.all.entity.Account;
import com.all.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountMapper am;

	@Override
	public List<Account> getAll() {
		List<Account> all = am.getAll();
		return all;
	}

	@Override
	public Account getOne(int accountId) {
		Account account = am.getOne(accountId);
		return account;
	}

	@Override
	public void delete(int accountId) {
		am.delete(accountId);

	}

	@Override
	public void updateOne(Account account) {
		am.updateOne(account);
	}

	@Override
	public void insertOne(Account account) {
		am.insertOne(account);
	}

}
