<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<script type="text/javascript" src="css/jquery.js"></script>
<title>注册</title>
</head>
<body style="background-image: url('images/login.png') ;background-repeat: no-repeat;background-size:cover">

<div class="container" style="margin-left: 450px;margin-top: 100px;background-color: rgba(255,255,255,0.5);width: 600px">
   <div style="margin-bottom: 50px;"><h2>用户注册</h2>
   <hr style="border-color:#005AB5;border-width: 5px"></div>
   <form style="margin-left: 90px;" method="get" action="${pageContext.request.contextPath }/registerDo" onsubmit="return check()">
       <div class="form-group ">
        <label class="col-md-2 control-label" for="exampleInputEmail1" style="margin-top: 10px;">用户：</label>
          <div  class="col-md-8 " >
          <input  type="text" class="form-control" id="user" name="userName" placeholder="请输入用户名">
          </div>
       </div>
       <br><br>
        <div class="form-group  ">
        <label for="exampleInputPassword1" style="margin-top: 10px;" class="col-md-2 control-label">密码：</label>
          <div class="col-md-8" >
           <input type="password" class="form-control" id="Password1" name="password" placeholder="请输入密码">
           </div>
         </div>
          <br><br>
            <div class="form-group  ">
        <label for="exampleInputPassword2" style="margin-top: 10px;margin-left: -40px;" class="col-md-3 control-label">确认密码：</label>
          <div class="col-md-8" >
           <input type="password" class="form-control" id="Password2"  placeholder="请再次输入密码">
           </div>
         </div>
			<br><br>
  <div style="margin-left: 100px">
  <button  type="submit" class="btn btn-default">注册</button>
  <a  href="login" class="btn btn-default">返回</a>
  </div>
</form>
</div>
</body>
<script type="text/javascript">
function check(){
    var user = document.getElementById("user").value;
	var password1 = document.getElementById("Password1").value;
	var password2 = document.getElementById("Password2").value;
	  if(user==""){
		  alert("请输入用户名");
		  return false;
	  }
	  
	  if(password1==""){
		  alert("请输入密码");
		  return false;
	  }
	  
	  if(password2==""){
		  alert("请再次输入密码");
		  return false;
	  }
	  
	  if(password2!=password1){
		  alert("两次密码不一致");
		  return false;
	  }
	  return true;
}
</script>


</html>