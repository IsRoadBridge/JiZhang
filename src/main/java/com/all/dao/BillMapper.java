package com.all.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.all.entity.Bill;
import com.all.entity.Bill2;

@Repository
public interface BillMapper {

	public List<Bill> getBillByUsername(String username);

	public List<Bill> getBillByType(String type, String name);

	public List<Bill2> getBillMoney(String type, String name);

	public void deleteOne(int BillId);

	public void updateOne(Bill bill);

	public void insertOne(Bill bill);

	public Bill selectOne(int billId);

}
