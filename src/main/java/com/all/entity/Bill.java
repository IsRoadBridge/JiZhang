package com.all.entity;

import java.util.Date;

public class Bill {

	private int billId;
	private String remarks;
	private double money;
	private String pay;
	private Date date;
	private Account account;
	private User user;

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getBillId() {
		return billId;
	}

	public void setBillId(int billId) {
		this.billId = billId;
	}

	@Override
	public String toString() {
		return "Bill [billId=" + billId + ", remarks=" + remarks + ", money=" + money + ", pay=" + pay + ", date="
				+ date + ", account=" + account + ", user=" + user + "]";
	}

}
