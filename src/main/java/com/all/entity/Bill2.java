package com.all.entity;

public class Bill2 {

	private String smalltype;

	private double money;

	public String getSmalltype() {
		return smalltype;
	}

	public void setSmalltype(String smalltype) {
		this.smalltype = smalltype;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "Bill2 [smalltype=" + smalltype + ", money=" + money + "]";
	}

}
