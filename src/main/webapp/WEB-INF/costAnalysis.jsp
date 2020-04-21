<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html class="no-js">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>支出分析</title>
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
  <script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript">
function go(){
    var mychart = echarts.init(document.getElementById('myDiv'));
    var url ="costAnalysisDo";
    $.ajax({
    	   url:url,    //路径
		   dataType:"json",  //返回类型
		   type:"post",   //请求方式
		   success:function(data){//回调函数
			   var option = {
			    	    title: {
			    	        text: '个人消费情况',
			    	       // subtext: '纯属虚构',
			    	        left: 'center'
			    	    },
			    	    tooltip: {
			    	        trigger: 'item',
			    	        formatter: '{a} <br/>{b} : {c} ({d}%)'
			    	    },
			    	    legend: {
			    	        orient: 'vertical',
			    	        left: 'left',
			    	        data: data.smallType
                                //['一日三餐', '饮料', '联盟广告', '视频广告', '搜索引擎']
			    	    },
			    	    series:[
                            {
                                name: '消费类型',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: [
                                    <% int number =(int) request.getAttribute("number");
                                    for(int i = 0; i <number; i++) {
                                      if(i<number-1){
                                          %>
                                    {value: data.moneymuch[<%=i%>], name: data.smallType[<%=i%>]},
                                      <%}
                                      if(i==number-1){
                                          %>
                                    {value: data.moneymuch[<%=i%>], name: data.smallType[<%=i%>]},
                                    <%
                                      }
                                    }

                                    %>

                                ],
			    	            emphasis: {
			    	                itemStyle: {
			    	                    shadowBlur: 10,
			    	                    shadowOffsetX: 0,
			    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			    	                }
			    	            }
			    	        }
			    	    ]
			    	};
    mychart.setOption(option);
    	 }
    });

}


</script>
</head>
<body onload="go()">

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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong><strong>/</strong><small>支出分析</small> </div>
    </div>
     <div style="width: 800px;height: 500px;" id = "myDiv">
      </div>
    </div>
  </div>
</body>


</html>
