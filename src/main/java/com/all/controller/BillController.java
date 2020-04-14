package com.all.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.all.entity.Bill;
import com.all.entity.Bill2;
import com.all.entity.User;
import com.all.service.BillService;
import com.all.service.UserService;

@Controller
public class BillController {

    @Autowired
    private BillService bs;

    @Autowired
    private UserService us;

    private static User uss = null;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String gologin(User user, HttpServletRequest request) {
        if (us.getUserByUser(user) != null) {
            uss = user;
            List<Bill> ls = bs.getBillByUsername(user.getUserName());
            request.setAttribute("all", ls);
            return "index";
        } else {
            request.setAttribute("error", "用户名或者密码错误！");
            return "login";
        }

    }

    @RequestMapping("/billDelete")
    public String billDelete(@Param("id") int id, HttpServletRequest request) {
        bs.deleteOne(id);
        List<Bill> ls = bs.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        return "index";
    }

    @RequestMapping("/billInsert")
    public String billInsert(Bill bill, HttpServletRequest request) {
        bill.setUser(uss);
        bs.insertOne(bill);
        List<Bill> ls = bs.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        return "index";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Bill> ls = bs.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        return "index";
    }

    @RequestMapping(value = "/billUpdate", method = RequestMethod.GET)
    public String billUpdate(Bill bill, HttpServletRequest request) {
        bill.setUser(uss);
        bs.updateOne(bill);
        List<Bill> ls = bs.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        return "index";
    }

    @RequestMapping("/indexUpdate")
    public String goIndexUpdate(int Bid, HttpServletRequest request) {
        Bill bill = bs.selectOne(Bid);
        request.setAttribute("one", bill);
        return "indexUpdate";
    }

    @RequestMapping("/allCost")
    public String goAllCost(HttpServletRequest request) {
        List<Bill> all = bs.getBillByType("消费", uss.getUserName());
        request.setAttribute("all", all);
        return "allCost";
    }

    @RequestMapping("/allIncome")
    public String goAllIncome(HttpServletRequest request) {
        List<Bill> all = bs.getBillByType("收入", uss.getUserName());
        request.setAttribute("all", all);
        return "allIncome";
    }

    @RequestMapping("/sum")
    public String goSum(HttpServletRequest request) {
        List<Bill> all = bs.getBillByUsername(uss.getUserName());
        request.setAttribute("all", all);
        return "sum";
    }

    @RequestMapping("/incomeAnalysis")
    public String goIncomeAnalysis() {
        return "incomeAnalysis";
    }

    @RequestMapping(value = "/costAnalysis", method = RequestMethod.GET)
    public String goCostAnalysis(HttpServletResponse response) throws IOException {
        List<Bill2> all = bs.getBillMoney("消费", uss.getUserName());
        System.out.println(all);
        List<String> smalltype = new ArrayList<>();
        List<Double> money = new ArrayList<>();
        for (Bill2 bill : all) {
            smalltype.add(bill.getSmalltype());
            money.add(bill.getMoney());
        }
        System.out.println(smalltype);
        System.out.println(money);
        Map<String, List> map = new HashMap<>();
        map.put("smalltype", smalltype);
        map.put("money", money);
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        pw.write(JSON.toJSONString(map));
        System.out.println(JSON.toJSONString(map));
        return "costAnalysis";
    }

    @RequestMapping("/accountAdd")
    public String goAccountAdd(HttpServletRequest request) {
        List<Bill> bills = bs.getBillByUsername(uss.getUserName());
        request.setAttribute("all",bills);
        return "accountAdd";
    }
}
