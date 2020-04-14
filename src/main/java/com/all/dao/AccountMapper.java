package com.all.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.all.entity.Account;

@Repository
public interface AccountMapper {

	public List<Account> getAll();

	public Account getOne(int accountId);

	public void delete(int accountId);

	public void updateOne(Account account);

	public void insertOne(Account account);
}
