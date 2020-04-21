<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> </div>
    </div>


    <div class="am-g">
      <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped am-table-hover  admin-content-table" style="text-align: center">
          <thead>
          <tr  >
            <th style="text-align: center">ID</th><th style="text-align: center">账目类型</th><th style="text-align: center">子分类</th>
            <th style="text-align: center">金额</th><th style="text-align: center">消费说明</th>
            <th style="text-align: center">支付方式</th><th style="text-align: center">消费日期</th><th >管理</th>
          </tr>
          </thead>
          <tbody>
           <c:forEach var="bill" items="${all}" varStatus="it">           
           <tr>
               <td>${it.count}</td>
               <td>${bill.account.type}</td>
               <td>${bill.account.smallType}</td>
               <td>￥${bill.money}</td>
               <td>${bill.pay}</td>
               <td>${bill.remarks}</td>
               <td><fmt:formatDate value="${bill.date}" pattern="yyyy-MM-dd"/></td>

              <td>
              <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="indexUpdate?Bid=${bill.billId} " style="color: #46A3FF"><span class="am-icon-pencil-square-o"></span> 编辑</a>
                    <a class="am-btn am-btn-default am-btn-xs" href="#" onclick="del(${bill.billId})" style="color: #EA0000"><span class="am-icon-trash-o" ></span> 删除</a>
                  </div>
                </div>
            </td>
              
           </tr>
     </c:forEach>
        
         
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
<script type="text/javascript">
function del(id) {
	var b = confirm("确定要删除吗")
	if (b == true) {
		location.href="billDelete?id="+id;
	}
}	
	</script> 

</html>
          