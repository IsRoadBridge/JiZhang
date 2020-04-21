package com.all.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.all.entity.Bill;
import com.all.entity.User;
import com.all.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.all.entity.Account;
import com.all.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private BillService billService;

    private User user = new User();
	@RequestMapping("/typeUpdate")
	public String goTypeUpdate(HttpServletRequest request) {
		List<Account> all = accountService.getAll();
		request.setAttribute("all", all);
		request.setAttribute("username",user.getUserName());
		return "typeUpdate";
	}

	@RequestMapping("/typeUpdateDo")
	public String goTypeUpdateDo(int id, HttpServletRequest request) {
		Account account = accountService.getOne(id);
		request.setAttribute("one", account);
		request.setAttribute("username", user.getUserName());
		return "typeUpdateDo";
	}

	@RequestMapping("/typeDelete")
	public String goTypeDelete(int id, HttpServletRequest request) {
		accountService.delete(id);
		List<Account> all = accountService.getAll();
		request.setAttribute("all", all);
		request.setAttribute("username", user.getUserName());
		return "typeUpdate";
	}

	@RequestMapping("/updateType")
	public String goUpdateType(Account account, HttpServletRequest request) {
		accountService.updateOne(account);
		List<Account> all = accountService.getAll();
		request.setAttribute("all", all);
		request.setAttribute("username", user.getUserName());
		return "typeUpdate";
	}

	@RequestMapping("/typeAdd")
	public String gotypeAdd(HttpServletRequest request) {
		request.setAttribute("username", user.getUserName());
		return "typeAdd";
	}

	@RequestMapping("/typeAddDo")
	public String gotypeAddDo(Account account, HttpServletRequest request) {
		accountService.insertOne(account);
		List<Account> all = accountService.getAll();
		request.setAttribute("all", all);
		request.setAttribute("username", user.getUserName());
		return "typeUpdate";
	}

	@RequestMapping("/accountAdd")
	public String goAccountAdd(HttpServletRequest request) {
		List<Account> accounts = accountService.getAll();
		request.setAttribute("all",accounts);
		request.setAttribute("username", user.getUserName());
		return "accountAdd";
	}

	@RequestMapping("/indexUpdate")
	public String goIndexUpdate(int Bid, HttpServletRequest request) {
		Bill bill = billService.selectOne(Bid);
        List<Account> accounts = accountService.getAll();
		request.setAttribute("one", bill);
		request.setAttribute("all", accounts);
		request.setAttribute("username", user.getUserName());
		return "indexUpdate";
	}
}
