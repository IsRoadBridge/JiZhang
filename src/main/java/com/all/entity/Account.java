package com.all.entity;

public class Account {

	private int accountId;
	private String type;
	private String smallType;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSmallType() {
		return smallType;
	}

	public void setSmallType(String smallType) {
		this.smallType = smallType;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", type=" + type + ", smallType=" + smallType + "]";
	}

}
