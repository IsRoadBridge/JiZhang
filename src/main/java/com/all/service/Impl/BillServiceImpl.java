package com.all.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.dao.BillMapper;
import com.all.entity.Bill;
import com.all.entity.Bill2;
import com.all.service.BillService;

@Service
public class BillServiceImpl implements BillService {

	@Autowired
	private BillMapper bm;

	@Override
	public List<Bill> getBillByUsername(String username) {
		List<Bill> ls = bm.getBillByUsername(username);
		return ls;
	}

	@Override
	public void deleteOne(int BillId) {
		bm.deleteOne(BillId);
	}

	@Override
	public void updateOne(Bill bill) {
		bm.updateOne(bill);
	}

	@Override
	public void insertOne(Bill bill) {
		bm.insertOne(bill);
	}

	@Override
	public Bill selectOne(int billId) {
		Bill bill = bm.selectOne(billId);
		return bill;
	}

	@Override
	public List<Bill> getBillByType(String type, String name) {
		List<Bill> all = bm.getBillByType(type, name);

		return all;
	}

	@Override
	public List<Bill2> getBillMoney(String type, String name) {
		List<Bill2> all = bm.getBillMoney(type, name);
		return all;
	}

}
