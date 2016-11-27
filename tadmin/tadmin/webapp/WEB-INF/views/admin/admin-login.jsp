<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>用户登录</title>

<link rel="stylesheet" type="text/css" href="lib/layer/skin/layer.css">
<link rel="stylesheet" type="text/css" href="lib/layer/skin/layer.ext.css">

<script type="text/javascript" src="script/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="lib/layer/layer.js"></script>
<script type="text/javascript" src="lib/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="script/md5.js"></script>
<style type="text/css">
body {
	background: #ebebeb;
	font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
		"\9ED1\4F53", Arial, sans-serif;
	color: #222;
	font-size: 12px;
}

* {
	padding: 0px;
	margin: 0px;
}

.top_div {
	background: #008ead;
	width: 100%;
	height: 300px;
}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

.ipt:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

.error {
	border-color: #ffa8a8;
	background-color: #fff3f3;
}


.u_logo {
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;
}

.p_logo {
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}

a {
	text-decoration: none;
}

.tou {
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}

.left_hand {
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}

.right_hand {
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}

.initial_left_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}

.initial_right_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}

.left_handing {
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}

.right_handinging {
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}
</style>
<script type="text/javascript">
	$(function() {
		//得到焦点
		$("#password").focus(function() {
			$("#left_hand").animate({
				left : "150",
				top : " -38"
			}, {
				step : function() {
					if (parseInt($("#left_hand").css("left")) > 140) {
						$("#left_hand").attr("class", "left_hand");
					}
				}
			}, 2000);
			$("#right_hand").animate({
				right : "-64",
				top : "-38px"
			}, {
				step : function() {
					if (parseInt($("#right_hand").css("right")) > -70) {
						$("#right_hand").attr("class", "right_hand");
					}
				}
			}, 2000);
		});
		//失去焦点
		$("#password").blur(function() {
			$("#left_hand").attr("class", "initial_left_hand");
			$("#left_hand").attr("style", "left:100px;top:-12px;");
			$("#right_hand").attr("class", "initial_right_hand");
			$("#right_hand").attr("style", "right:-112px;top:-12px");
			
			if($(this).val().length<6){
				$(this).addClass('error');
			}
		});
		
		$("#uname,#password").focus(function(){
			if($(this).is('.error')){
				$(this).removeClass('error');
			}
		}) ;
		
		$("#uname").blur(function() {
			if($(this).val() == ''){
				$(this).addClass('error');
			}
		});
	});
	
	
	
	function login(){
		if($("#uname,#password").is(".error")){
			return false ;
		}
		if($("#uname").val()==''){
			$("#uname").addClass('error');
			return false ;
		}
		if($("#password").val().length<6){
			$("#password").addClass('error');
			return false ;
		}
		var index = layer.load(0, {shade: [0.1,'#fff']}); //0代表加载的风格，支持0-2
		$.ajax({
			url : 'admin/login',
			data:{'uname' : $("#uname").val() ,'password':MD5($("#password").val()) },
			dataType:'json',
			type:'post',
			success:function(data){
				//alert(data.success) ;
				//return ;
				//alert(data) ;
				/*
				if(data.success){
					$.messager.progress({
						title: "系统提示",
						msg: "登录成功,正在跳转请稍后……"
					});
					setTimeout(function(){
						//$.messager.progress('close');
						window.location.href = "index.do";
					}, 2000) ;
				}else{
					$.messager.progress('close');
					showError(data.msg);
				}
				*/
				layer.close(index);
				if(data.r == true){
					layer.msg("登录成功,正在跳转请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
						window.location.href = "admin";
					}) ;
				}else{
					layer.alert(data.m , {icon: 2,title:"系统提示"});
				}
			},
			error :function(){
				layer.close(index);
				layer.alert("系统异常,请稍后再试...." , {icon: 2,title:"系统提示"});
			}
		});
	}
</script>
</head>
<body>
	<div class="top_div"></div>
	<div
		style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
		<div style="width: 165px; height: 96px; position: absolute;">
			<div class="tou"></div>
			<div class="initial_left_hand" id="left_hand"></div>
			<div class="initial_right_hand" id="right_hand"></div>
		</div>
		<p style="padding: 30px 0px 10px; position: relative;">
			<span class="u_logo"></span> <input class="ipt" id = "uname" type="text"
				placeholder="请输入用户名" value="admin">
		</P>
		<P style="position: relative;">
			<span class="p_logo"></span> <input class="ipt" id="password"
				type="password" placeholder="请输入至少六位密码" value="123456">
		</P>
		<div
			style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			<P style="margin: 0px 35px 20px 45px;">
				<span style="float: left;">
					<A
					style="color: rgb(204, 204, 204); margin-left: 20px ;" href="javascript:layer.alert('请联系管理员' , {icon:5 , title:'系统提示'});">忘记密码?</a>
					</span> <span
					style="float: right;">
					<!-- <a style="color: rgb(204, 204, 204); margin-right: 10px;" href="#">注册</a> -->
					<a style="background: rgb(0, 142, 173); padding: 7px 40px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
					href="javascript:login();">登&nbsp;&nbsp;&nbsp;&nbsp;录</a> </span>
			</P>
		</div>
	</div>
	<div style="text-align: center;"></div>
</body>
</html>