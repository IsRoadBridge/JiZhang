package com.all.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.all.entity.User;
import com.all.service.BillService;
import com.all.service.UserService;

@Controller
public class UserController {

	@Autowired
	private BillService bs;

	@Autowired
	private UserService us;

	@RequestMapping("/gologin")
	public String goLogin() {
		return "login";
	}

	@RequestMapping("/loginout")
	public String loginout() {
		try {
			return "loginOut";
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			System.exit(0);
			return "loginOut";
		}

	}



	@RequestMapping("/register")
	public String goRegister() {
		return "register";
	}

	@RequestMapping("/registerDo")
	public String goRegisterDo(User user) {
		us.insert(user);
		return "login";
	}
}
