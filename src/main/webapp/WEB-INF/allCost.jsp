<%@ page import="java.util.List" %>
<%@ page import="com.all.entity.Bill" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html class="no-js">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>支出总览</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>

<header class="am-topbar admin-header" style="background-color: #8080C0">
  <div class="am-topbar-brand">
    <strong style="color: white">CFO</strong> <small style="color: white">记账管理系统</small>
      <span style="color: white;margin-left:1050px; " > 欢迎你${username} </span>
     <a href="gologin" type="button" class="am-btn am-btn-primary" style="margin-left: 10px;color: white">退出登录</a>
  </div>
  
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar" style="background-color: #ECF5FF">
    <ul class="am-list admin-sidebar-list" style="background-color: #ECF5FF">
      <li style="background-color: #ECF5FF"><a href="index"><span class="am-icon-home"></span> 首页</a></li>
      <li style="background-color: #ECF5FF"><a href="accountAdd"><span class="am-icon-pencil-square-o"></span>记账</a></li>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong><strong>/</strong><small>支出总览</small> </div>
    </div>
        <div class="am-g error-log">
      <div class="am-u-sm-12 am-u-sm-centered">
        <pre class="am-pre-scrollable">
         <div id="collapse-panel-2" class="am-in">
            <table class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover">
              <tbody>
              <tr>
                <th class="am-text-center">消费类型</th>
                <th class="am-text-center">金额(¥)</th>
                <th class="am-text-center">日期</th>
              </tr>
              <% boolean a=true;
                 %>
              <c:forEach var="bill" items="${all}" varStatus="it">
              <% 
                 if(a==true){
                	 a=false;

              %>       
             <tr class="am-active">
                 <td class="am-text-center">${bill.account.smallType}</td>
                 <td class="am-text-center">${bill.money}</td>
                 <td class="am-text-center"><fmt:formatDate value="${bill.date}" pattern="yyyy-MM-dd"/></td>
               </tr>
               <%}else{
            	   a=true;
                   %>
                <tr class="am-success">
                 <td class="am-text-center" style="color: black">${bill.account.smallType}</td>
                 <td class="am-text-center" style="color: black">${bill.money}</td>
                 <td class="am-text-center" style="color: black"><fmt:formatDate value="${bill.date}" pattern="yyyy-MM-dd"/></td>
               </tr>
               <%} %>
              </c:forEach>
              <tr class="am-danger">
                  <%double sum = 0;
                      List<Bill> list = (List) request.getAttribute("all");
                      for (int i = 0; i < list.size(); i++) {
                          sum=sum+(double)list.get(i).getMoney();
                      }

                  %>
                  <td class="am-text-center" style="color: black"><b>总支出</b></td>
                  <td class="am-text-center" style="color: black" ><b><%=sum%></b></td>
                <td class="am-text-center" style="color: black"></td>
              </tr>

              </tbody>
            </table>
          </div>
        </pre>
      </div>
    </div>
   
    </div>
  </div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>

</html>
          