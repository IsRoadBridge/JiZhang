<%@ page import="com.all.entity.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="com.all.entity.Bill" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html class="no-js">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>

<header class="am-topbar admin-header" style="background-color: #8080C0">
    <div class="am-topbar-brand">
        <strong style="color: white">CFO</strong>
        <small style="color: white">记账管理系统</small>
        <span style="color: white;margin-left:1070px; "> 欢迎你管理员 </span>
        <a href="gologin" type="button" class="am-btn am-btn-primary" style="margin-left: 10px;color: white">退出登录</a>
    </div>

</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar" style="background-color: #ECF5FF">
        <ul class="am-list admin-sidebar-list" style="background-color: #ECF5FF">
            <li style="background-color: #ECF5FF"><a href="index"><span class="am-icon-home"></span> 首页</a></li>
            <li style="background-color: #ECF5FF"><a href="accountAdd"><span
                    class="am-icon-pencil-square-o"></span>记账</a></li>
            <li class="admin-parent" style="background-color: #ECF5FF">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 财务统计
                    <span ></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav" style="background-color: #ECF5FF">
                    <li style="background-color: #ECF5FF"><a href="sum" class="am-cf"><span
                            class="am-icon-bank"></span> 收支总览</a></li>
                    <li style="background-color: #ECF5FF"><a href="allIncome"><span class="am-icon-check"></span>
                        收入总览</a></li>
                    <li style="background-color: #ECF5FF"><a href="allCost"><span class="am-icon-th"></span> 支出总览</a></li>
                </ul>
            </li>

            <li class="admin-parent" style="background-color: #ECF5FF">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-adjust"></span> 财务分析
                    <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav2" style="background-color: #ECF5FF">
                    <li style="background-color: #ECF5FF"><a href="incomeAnalysis" class="am-cf"><span
                            class="am-icon-pie-chart"></span> 收入分析</a></li>
                    <li style="background-color: #ECF5FF"><a href="costAnalysis"><span
                            class="am-icon-circle-o-notch"></span> 支出分析</a></li>
                </ul>
            </li>

            <li style="background-color: #ECF5FF"><a href="typeUpdate"><span class="am-icon-table"></span> 账目类别修改</a>
            </li>
        </ul>

        <div class="am-panel am-panel-default admin-sidebar-panel">
            <div class="am-panel-bd" style="background-color:#ECF5FF">
                <p><span class="am-icon-bookmark"></span> 公告</p>
                <p>今天你记账了吗？</p>
                <p style="text-align: right">版本号1.0.0</p>
            </div>
        </div>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong><strong>/</strong>
                <small>账目修改</small>
            </div>
        </div>

        <div class="am-u-sm-12 am-u-md-8 ">
            <form class="am-form am-form-horizontal" action="billUpdate" method="get" onsubmit="return check()">

                <div>
                    <input type="hidden" name="billId" value="${one.billId}">

                </div>
                <div class="am-form-group">
                    <label for="account-type" class="am-u-sm-3 am-form-label">账目类型</label>
                    <div class="am-u-sm-9">
                        <%--<input type="text" id="account-type" name="account.type" value="${one.account.type}">--%>
                        <select name="account.type" id="account-type">
                            <option value=${one.account.type}>${one.account.type} </option>
                            <% Bill one = (Bill) request.getAttribute("one");
                                if (one.getAccount().getType().equals("消费")) {%>
                            <option value="收入">收入</option>
                            <% } else {%>
                            <option value="消费">消费</option>
                            <%}%>
                        </select>
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="smallType" class="am-u-sm-3 am-form-label">子分类</label>
                    <div class="am-u-sm-9">
                        <%--<input type="text" id="smallType" value="${one.account.smallType}" name="account.smallType">--%>
                        <select id="smallType" name="account.smallType">
                            <option value=${one.account.smallType} selected>${one.account.smallType} </option>
                            <% Bill bill = (Bill) request.getAttribute("one");
                                List<Account> accounts = (List<Account>) request.getAttribute("all");
                                for (int i = 0; i < accounts.size(); i++) {
                                    if (accounts.get(i).getSmallType().equals(bill.getAccount().getSmallType())) {
                                        continue;
                                    }
                            %>
                            <option value=<%=accounts.get(i).getSmallType()%>><%=accounts.get(i).getSmallType()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="money" class="am-u-sm-3 am-form-label">金额</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="money" value="${one.money}" name="money">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="money-mouse" class="am-u-sm-3 am-form-label">消费说明</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="money-mouse" value="${one.remarks}" name="remarks">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="pay" class="am-u-sm-3 am-form-label">支付方式</label>
                    <div class="am-u-sm-9">
                        <input type="text" id="pay" value="${one.pay}" name="pay">
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="date" class="am-u-sm-3 am-form-label">日期</label>
                    <div class="am-u-sm-9">
                        <input type="date" name="date"
                               value="<fmt:formatDate value="${one.date}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                               id="date">
                    </div>
                </div>

                <div class="am-form-group" style="margin-left: 400px;">
                    <div class="am-u-sm-9 ">
                        <button type="submit" class="am-btn am-btn-primary">保存修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
<script>
    function check() {
        var smtype = document.getElementById("smallType").value.trim();
        var money = document.getElementById("money").value.trim();
        var mm = document.getElementById("money-mouse").value.trim();
        var pay = document.getElementById("pay").value.trim();
        var date = document.getElementById("date").value.trim();
        if (smtype == "") {
            alert("子分类不能为空");
            return false;
        }
        if (money == "") {
            alert("金额不能为空");
            return false;
        }
        if (isNaN(money)) {
            alert("金额只能是数字");
            return false;
        }
        if (mm == "") {
            alert("消费说明不能为空");
            return false;
        }
        if (pay == "") {
            alert("支付方式不能为空");
            return false;
        }
        if (date == "") {
            alert("日期不能为空");
            return false;
        }
        return true;
    }
</script>
</html>
          