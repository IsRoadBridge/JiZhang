$(function() {
	$("input").change(function() {
		var myId = $(this).parent().parent().children("div.col-sm-4");
		var id = $(this).attr("id")
		myId2 = $(this).parent().parent()
		if (id == "username") {
			var user = $(this).val()
			var regex = /^[a-zA-Z][0-9a-zA-Z_]{1,9}$/

			if (regex.test(user)) {
				myId.html('<p class="glyphicon glyphicon-ok text-success"></p>')
				successChange()
			} else {
				myId.html('<p class="glyphicon glyphicon-remove text-danger"></p><span>字母数字下划线10位以内，必须是字母开头</span>')
				errorChange()
			}
		} else if (id == "pwd") {
			var user = $(this).val()
			var regex = /^.{6,16}$/

			if (regex.test(user)) {
				myId.html('<p class="glyphicon glyphicon-ok text-success"></p>')
				successChange()
			} else {
				myId.html('<p class="glyphicon glyphicon-remove text-danger"></p><span>任意字符，6到16位</span>')
				errorChange()
			}
		} else if (id == "pwdTwo") {
			var user = $(this).val()
			var result = $("#pwd").val() == user

			if (result) {
				myId.html('<p class="glyphicon glyphicon-ok text-success"></p>')
				successChange()
			} else {
				myId.html('<p class="glyphicon glyphicon-remove text-danger"></p><span>两次输入密码不相同</span>')
				errorChange()
			}
		} else if (id == "inputEmail") {
			var user = $(this).val()
			var regex = /^[0-9a-zA-Z._-]+[@][0-9a-zA-Z_-]+[.][a-z]{2,3}$/

			if (regex.test(user)) {
				myId.html('<p class="glyphicon glyphicon-ok text-success"></p>')
				successChange()
			} else {
				myId.html('<p class="glyphicon glyphicon-remove text-danger"></p><span>邮箱格式不正确</span>')
				errorChange()
			}

		}
		// 验证码部分
		else if (id == "yzm") {
			var val = $(this).val().toLowerCase();
			var num = show_num.join("");
			if (val == num) {
				myId.html('<p class="glyphicon glyphicon-ok text-success"></p>')
				successChange()
				// $(this).val('');
			} else {
				myId.html('<p class="glyphicon glyphicon-remove text-danger"></p><span>验证码输入不正确</span>')
				errorChange()
				// $(this).val('');
			}
		}
	})
//	$("button").click(function() {
//		var result = false;
//		var s = $("div.form-group:not(:last)")
//		for (var i = 0; i < s.length; i++) {
//			if (s.eq(i).hasClass("has-success")) {
//				result = true;
//			} else {
//				result = false;
//				break;
//			}
//
//		}
//		if (result) {
//			alert("登录成功")
//			window.location.href = "登陆界面.html"
//		} else {
//			alert("登录失败")
//		}

		// 				var btnresult0 = $("input").eq(0).parent().parent().hasClass("has-success")
		// 				var btnresult1 = $("input").eq(1).parent().parent().hasClass("has-success")
		// 				var btnresult2 = $("input").eq(2).parent().parent().hasClass("has-success")
		// 				var btnresult3 = $("input").eq(3).parent().parent().hasClass("has-success")
		// 
		// 				// if (btnresult0 && btnresult1 && btnresult2 && btnresult3) {
		// 				// 	alert("success")
		// 				// } else {
		// 				// 	alert("error")
		// 				// }
		// 				if (btnresult0) {
		// 					if (btnresult1) {
		// 						if (btnresult2) {
		// 							if (btnresult3) {
		// 								alert("注册成功")
		// 								window.location.href ="登陆界面.html"
		// 							} else {
		// 								alert("邮箱格式不正确")
		// 							}
		// 						} else {
		// 							alert("两次密码不一致")
		// 						}
		// 					} else {
		// 						alert("密码错误")
		// 					}
		// 				} else {
		// 					alert("用户名错误")
		// 				}
//
//	})
})

function successChange() {
	myId2.addClass("has-success")
	if (myId2.hasClass("has-error")) {
		myId2.removeClass("has-error")
	}
}

function errorChange() {
	myId2.addClass("has-error")
	if (myId2.hasClass("has-success")) {
		myId2.removeClass("has-success")
	}
}
$(function() {
	show_num = [];
	draw(show_num);
	$("#canvas").on('click', function() {
		draw(show_num);
	})

})
//生成并渲染出验证码图形
function draw(show_num) {
	var canvas_width = $('#canvas').width();
	var canvas_height = $('#canvas').height();
	var canvas = document.getElementById("canvas"); //获取到canvas的对象，演员
	var context = canvas.getContext("2d"); //获取到canvas画图的环境，演员表演的舞台
	canvas.width = canvas_width;
	canvas.height = canvas_height;
	var sCode =
		"a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
	var aCode = sCode.split(",");
	var aLength = aCode.length; //获取到数组的长度
	for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
		var j = Math.floor(Math.random() * aLength); //获取到随机的索引值
		// var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
		var deg = Math.random() - 0.5; //产生一个随机弧度
		var txt = aCode[j]; //得到随机的一个内容
		show_num[i] = txt.toLowerCase();
		var x = 10 + i * 20; //文字在canvas上的x坐标
		var y = 20 + Math.random() * 8; //文字在canvas上的y坐标
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
