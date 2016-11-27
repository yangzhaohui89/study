<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="css/skin/green/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<title>TAdmin</title>
</head>
<body>
<header class="Hui-header cl"> <a class="Hui-logo l" title="H-ui.admin v2.3" href="/">H-ui.admin</a> <a class="Hui-logo-m l" href="/" title="H-ui.admin">H-ui</a> <span class="Hui-subtitle l">beat<!--V2.3--></span>
	<nav class="mainnav cl" id="Hui-nav">
		<ul>
			<li class="dropDown"><a href="javascript:;"  onClick="displaynavbar(this)" class="dropDown_A"><i class="Hui-iconfont">&#xe681;</i> </a>
			</li>
		</ul>
	</nav>
	<ul class="Hui-userbar">
		<li>超级管理员</li><!-- 超级管理员 -->
		<li class="dropDown dropDown_hover"><a href="javascript:void(0)" class="dropDown_A"><shiro:principal property="name"></shiro:principal> <i class="Hui-iconfont">&#xe6d5;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:void(0)">个人信息</a></li>
				<shiro:hasRole name="admin">
				<li><a href="javascript:void(0)" onclick="openIframe('dddd','rrrr','aaaaa')">切换账户</a></li>
				</shiro:hasRole>
				<li><a href="javascript:logout()" >退出</a></li>
			</ul>
		</li>
		<li id="Hui-msg"> 
			<a href="javascript:void(0)" title="消息" onclick="layer_show('添加管理员','admin-add.html','800','500')">
				<span class="badge badge-danger">1</span>
				<i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i>
			</a>
		</li>
	</ul>
	<a aria-hidden="false" class="Hui-nav-toggle" href="#"></a> </header>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<!-- 
		<dl id = "menu-commodity">
			<dt><i class="Hui-iconfont">&#xe620;</i> 商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="member-list.html" href="javascript:;">商品分类</a></li>
					<li><a _href="member-list.html" href="javascript:;">商品类型</a></li>
					<li><a _href="commodityspec/index" href="javascript:;">商品规格</a></li>
					<li><a _href="member-list.html" href="javascript:;">商品属性</a></li>
					<li><a _href="member-list.html" href="javascript:;">商品品牌</a></li>
					<li><a _href="member-list.html" href="javascript:;">商品列表</a></li>
				</ul>
		</dl>
	
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="member-list.html" href="javascript:;">会员列表</a></li>
					<li><a _href="member-del.html" href="javascript:;">删除的会员</a></li>
					<li><a _href="member-level.html" href="javascript:;">等级管理</a></li>
					<li><a _href="member-scoreoperation.html" href="javascript:;">积分管理</a></li>
					<li><a _href="member-record-browse.html" href="javascript:void(0)">浏览记录</a></li>
					<li><a _href="member-record-download.html" href="javascript:void(0)">下载记录</a></li>
					<li><a _href="member-record-share.html" href="javascript:void(0)">分享记录</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="admin/list" href="javascript:void(0)">角色管理</a></li>
					<li><a _href="admin-permission.html" href="javascript:void(0)">权限管理</a></li>
					<li><a _href="admin/index" href="javascript:void(0)">管理员列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-tongji">
			<dt><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="charts-1.html" href="javascript:void(0)">折线图</a></li>
					<li><a _href="charts-2.html" href="javascript:void(0)">时间轴折线图</a></li>
					<li><a _href="charts-3.html" href="javascript:void(0)">区域图</a></li>
					<li><a _href="charts-4.html" href="javascript:void(0)">柱状图</a></li>
					<li><a _href="charts-5.html" href="javascript:void(0)">饼状图</a></li>
					<li><a _href="charts-6.html" href="javascript:void(0)">3D柱状图</a></li>
					<li><a _href="charts-7.html" href="javascript:void(0)">3D饼状图</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="system-base.html" href="javascript:void(0)">系统设置</a></li>
					<li><a _href="system-category.html" href="javascript:void(0)">栏目管理</a></li>
					<li><a _href="system-data.html" href="javascript:void(0)">数据字典</a></li>
					<li><a _href="system-shielding.html" href="javascript:void(0)">屏蔽词</a></li>
					<li><a _href="system-log.html" href="javascript:void(0)">系统日志</a></li>
				</ul>
			</dd>
		</dl>
		 -->
		${menu}
	</div>
</aside>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a>
			<a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="admin/main"></iframe>
		</div>
	</div>
</section>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/layer.js"></script> 
<script type="text/javascript" src="script/H-ui.js"></script> 
<script type="text/javascript" src="script/H-ui.admin.js"></script> 
<script type="text/javascript">
function logout(){
	$.post("admin/logout" , function(){
		layer.msg("退出成功,正在跳转请稍后……",{icon:1,time: 2000,shade: [0.1,'#fff']},function(){
			window.location.href = "admin/login"; 
		}) ;
	}) ;
}
</script>
</body>
</html>