<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<script type="text/javascript" src="css/jquery.js"></script>
<title>登录</title>
</head>
<body style="background-image: url('images/login.png') ;background-repeat: no-repeat;background-size:cover">
<div style="text-align: right;margin-right: 50px"><a href="loginout" style="font-size: 20px;">退出系统</a></div>
<div><input  type="hidden"  id="error" value="<%=request.getAttribute("error") %>" ></div>
<div class="container" style="margin-left: 450px;margin-top: 100px;background-color: rgba(255,255,255,0.5);width: 600px">
   <div style="margin-bottom: 50px;"><h2>欢迎使用记账管理系统</h2>
   <hr style="border-color:#005AB5;border-width: 5px"></div>
   <div style="margin-bottom: 10px;margin-left: 50px;"><h4 style="color: #005AB5;">账号登录</h4>
   <hr style="border-color:black;width: 450px;margin-left: -5px; "></div>
   <form style="margin-left: 90px;" method="get" action="${pageContext.request.contextPath }/login" onsubmit="return check()" >
       <div class="form-group ">
        <label class="col-md-2 control-label" for="exampleInputEmail1" style="margin-top: 10px;">用户：</label>
          <div  class="col-md-8 " >
          <input  type="text" class="form-control" id="user" name="userName" placeholder="User">
          </div>
       </div>
       <br><br>
        <div class="form-group  ">
        <label for="exampleInputPassword1" style="margin-top: 10px;" class="col-md-2 control-label">密码：</label>
          <div class="col-md-8" >
           <input type="password" class="form-control" id="Password1" name="password" placeholder="Password">
           </div>
         </div>
          <br><br>
       <div class="form-group">
		    <label for="inputYZM" class="col-md-3 control-label" style="margin-left: -14px" >验证码：</label>
		    <div class="col-md-4" style="margin-top: -10px;margin-left: -26px">
		      <input type="text" class="form-control" id="inputYZM" placeholder="请输入验证码">
		    </div>
			<div class="col-md-3" style="border-color: gainsboro;border-style: solid;margin-top: -10px;margin-left: -10px">
			  <canvas id="canvas" width="100" height="30" ></canvas>
			</div>
			</div>
			<br><br>
  <div style="margin-left: 100px">
  <button  type="submit" class="btn btn-default">登录</button>
  <a  href="register" class="btn btn-default">注册</a>
  </div>
</form>
</div>
</body>
<script type="text/javascript">
    $(function(){
     show_num = [];
  	  draw(show_num);
  	  $("#canvas").on('click',function(){
  	   draw(show_num);
  	})
  	var error =document.getElementById("error").value;
  	  if(error=="用户名或者密码错误！"){
  	       alert(error);
  	  }
    })
    
function draw(show_num) {
	  var canvas_width=$('#canvas').width();
	  var canvas_height=$('#canvas').height();
	  var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
	  var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
	  canvas.width = canvas_width;
	  canvas.height = canvas_height;
	  var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
	  var aCode = sCode.split(",");
	  var aLength = aCode.length;//获取到数组的长度
	  for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
	   var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
	   // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
	   var deg = Math.random() - 0.5; //产生一个随机弧度
	   var txt = aCode[j];//得到随机的一个内容
	   show_num[i] = txt.toLowerCase();
	   var x = 10 + i * 20;//文字在canvas上的x坐标
	   var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
	   context.font = "bold 23px 微软雅黑";
	   context.translate(x, y);
	   context.rotate(deg);
	   context.fillStyle = randomColor();
	   context.fillText(txt, 0, 0);
	   context.rotate(-deg);
	   context.translate(-x, -y);
	  }
	  for (var i = 0; i <= 5; i++) { //验证码上显示线条
	   context.strokeStyle = randomColor();
	   context.beginPath();
	   context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
	   context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
	   context.stroke();
	  }
	  for (var i = 0; i <= 30; i++) { //验证码上显示小点
	   context.strokeStyle = randomColor();
	   context.beginPath();
	   var x = Math.random() * canvas_width;
	   var y = Math.random() * canvas_height;
	   context.moveTo(x, y);
	   context.lineTo(x + 1, y + 1);
	   context.stroke();
	  }
	 }
	 //得到随机的颜色值
	 function randomColor() {
	  var r = Math.floor(Math.random() * 256);
	  var g = Math.floor(Math.random() * 256);
	  var b = Math.floor(Math.random() * 256);
	  return "rgb(" + r + "," + g + "," + b + ")";
	 }
</script>     
<script>		   
     function check(){
     var user = document.getElementById("user").value;
	 var password = document.getElementById("Password1").value;
	  if(user==""){
		  alert("请输入用户名");
		  return false;
	  }
	  
	  if(password==""){
		  alert("请输入密码");
		  return false;
	  }
	  
	  var val = $("#inputYZM").val().toLowerCase();
		   var num = show_num.join("");
		   if(val==""){
				  alert("请输入验证码");
				  return false;
			  }
		   if(val != num){
			   alert("验证码错误")
			   return false;
		   }
		   return true;
     }
</script>
</html>