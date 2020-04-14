package com.all.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.all.entity.Account;
import com.all.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	private AccountService as;

	@RequestMapping("/typeUpdate")
	public String goTypeUpdate(HttpServletRequest request) {
		List<Account> all = as.getAll();
		request.setAttribute("all", all);
		return "typeUpdate";
	}

	@RequestMapping("/typeUpdateDo")
	public String goTypeUpdateDo(int id, HttpServletRequest request) {
		Account account = as.getOne(id);
		request.setAttribute("one", account);
		return "typeUpdateDo";
	}

	@RequestMapping("/typeDelete")
	public String goTypeDelete(int id, HttpServletRequest request) {
		as.delete(id);
		List<Account> all = as.getAll();
		request.setAttribute("all", all);
		return "typeUpdate";
	}

	@RequestMapping("/updateType")
	public String goUpdateType(Account account, HttpServletRequest request) {
		as.updateOne(account);
		List<Account> all = as.getAll();
		request.setAttribute("all", all);
		return "typeUpdate";
	}

	@RequestMapping("/typeAdd")
	public String gotypeAdd() {
		return "typeAdd";
	}

	@RequestMapping("/typeAddDo")
	public String gotypeAddDo(Account account, HttpServletRequest request) {
		as.insertOne(account);
		List<Account> all = as.getAll();
		request.setAttribute("all", all);
		return "typeUpdate";
	}
}
