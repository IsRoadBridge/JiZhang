<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="no-js">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>账目修改</title>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong><strong>/</strong><small>账目修改</small> </div>
    </div>
   
    <div class="am-u-sm-12 am-u-md-8 ">
        <form class="am-form am-form-horizontal" action="updateType" method="get" onsubmit="return check()">
        <div class="am-u-sm-9">
              <input type="hidden"  value="${one.accountId}" name="accountId" >
             
            </div>
          <div class="am-form-group">
            <label for="account-type" class="am-u-sm-3 am-form-label">账目类型</label>
            <div class="am-u-sm-9">
              <input type="text" id="acount-type" value="${one.type}" name="type" readonly="readonly">
             
            </div>
          </div>

          <div class="am-form-group">
            <label for="son-class" class="am-u-sm-3 am-form-label">子分类</label>
            <div class="am-u-sm-9">
              <input type="text" id="son-class" value="${one.smallType}" name="smallType">
              
            </div>
          </div>

          <div class="am-form-group" style="margin-left: 400px;">
            <div class="am-u-sm-9 ">
              <button type="submit" class="am-btn am-btn-primary" href="typeUpdate">保存修改</button>
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
<script >
function check(){
  var smtype=document.getElementById("son-class").value.trim();
  if(smtype==""){
	  alert("子分类不能为空");
	  return false;
  }
  return true;
}
</script>
</html>
          