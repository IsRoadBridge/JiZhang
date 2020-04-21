package com.all.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BillController {

    @Autowired
    private BillService billService;

    @Autowired
    private UserService userService;

    private User uss = null;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String gologin(User user, HttpServletRequest request) {
        if (userService.getUserByUser(user) != null) {
            uss = user;
            List<Bill> ls = billService.getBillByUsername(user.getUserName());
            request.setAttribute("all", ls);
            request.setAttribute("username", uss.getUserName());
            return "index";
        } else {
            if (user.getUserName() != null) {
                request.setAttribute("error", "用户名或者密码错误！");
            }
            return "login";
        }

    }

    @RequestMapping("/billDelete")
    public String billDelete(@Param("id") int id, HttpServletRequest request) {
        billService.deleteOne(id);
        List<Bill> ls = billService.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        request.setAttribute("username", uss.getUserName());
        return "index";
    }

    @RequestMapping("/billInsert")
    public String billInsert(Bill bill, HttpServletRequest request) {
        bill.setUser(uss);
        billService.insertOne(bill);
        List<Bill> ls = billService.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        request.setAttribute("username", uss.getUserName());

        return "index";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Bill> ls = billService.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        request.setAttribute("username", uss.getUserName());
        return "index";
    }

    @RequestMapping(value = "/billUpdate", method = RequestMethod.GET)
    public String billUpdate(Bill bill, HttpServletRequest request) {
        bill.setUser(uss);
        billService.updateOne(bill);
        List<Bill> ls = billService.getBillByUsername(uss.getUserName());
        request.setAttribute("all", ls);
        request.setAttribute("username", uss.getUserName());
        return "index";
    }


    @RequestMapping("/allCost")
    public String goAllCost(HttpServletRequest request) {
        List<Bill> all = billService.getBillByType("消费", uss.getUserName());
        request.setAttribute("all", all);
        request.setAttribute("username", uss.getUserName());
        return "allCost";
    }

    @RequestMapping("/allIncome")
    public String goAllIncome(HttpServletRequest request) {
        List<Bill> all = billService.getBillByType("收入", uss.getUserName());
        request.setAttribute("all", all);
        request.setAttribute("username", uss.getUserName());
        return "allIncome";
    }

    @RequestMapping("/sum")
    public String goSum(HttpServletRequest request) {
        List<Bill> all = billService.getBillByUsername(uss.getUserName());
        request.setAttribute("all", all);
        request.setAttribute("username", uss.getUserName());
        return "sum";
    }

    @RequestMapping("/incomeAnalysis")
    public String goIncomeAnalysis(HttpServletRequest request) {
        List<Bill2> all = billService.getBillMoney("收入", uss.getUserName());
        int i = 0;
        List<String> smalltype = new ArrayList<>();
        for (Bill2 bill : all) {
            smalltype.add(bill.getSmalltype());
            ++i;
        }
        request.setAttribute("number", i);
        request.setAttribute("username", uss.getUserName());
        return "incomeAnalysis";
    }

    @RequestMapping(value = "/costAnalysis")
    public String goCostAnalysis(HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<Bill2> all = billService.getBillMoney("消费", uss.getUserName());
        int i = 0;
        List<String> smalltype = new ArrayList<>();
        for (Bill2 bill : all) {
            smalltype.add(bill.getSmalltype());
            ++i;
        }
        request.setAttribute("number", i);
        request.setAttribute("username", uss.getUserName());
        return "costAnalysis";
    }

    @RequestMapping("/costAnalysisDo")
    @ResponseBody()
    public void goCostAnalysisDo(HttpServletResponse response) throws IOException {
        List<Bill2> all = billService.getBillMoney("消费", uss.getUserName());
        // System.out.println(all);
        List<String> smalltype = new ArrayList<>();
        List<Double> money = new ArrayList<>();
        for (Bill2 bill : all) {
            smalltype.add(bill.getSmalltype());
            money.add(bill.getMoney());
        }
        Map<String, List> map = new HashMap<>();
        map.put("smallType", smalltype);
        map.put("moneymuch", money);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        pw.print(JSON.toJSONString(map));
    }

    @RequestMapping("/incomeAnalysisDo")
    @ResponseBody
    public void goIncomeAnalysisDo(HttpServletResponse response) throws IOException {
        List<Bill2> all = billService.getBillMoney("收入", uss.getUserName());
        //  System.out.println(all);
        List<String> smalltype = new ArrayList<>();
        List<Double> money = new ArrayList<>();
        for (Bill2 bill : all) {
            smalltype.add(bill.getSmalltype());
            money.add(bill.getMoney());
        }
        Map<String, List> map = new HashMap<>();
        map.put("smallType", smalltype);
        map.put("moneymuch", money);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        pw.print(JSON.toJSONString(map));
    }
}
