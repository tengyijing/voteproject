<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>注册成功</title>
	<link href="//data.toutoupiao.com/Images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="//data.toutoupiao.com/Content/style.min.css" rel="stylesheet" />
	<script src="//data.toutoupiao.com/Scripts/modernizr-2.8.3.js"></script>	
</head>
<body class="right-sb">
	<div class="container">
		<!-- Start Header -->
		<header class="header-wrap clearfix">
			<div class="logo" role="banner">
				<a href="/" title="投票网" rel="home">
					<div class="logo-text">
						<h1 class="logo-name">投票网</h1>
					</div>
				</a>
			</div>
			<nav class="main-nav clearfix">
				<div class="menu-navigation-container">
					<ul id="menu-navigation" class="menu">

						<li><a href="<c:url value="/index"/>">首页</a></li>
						<li><a Id="loginLink" href="<c:url value="/userAction_loginJsp"/>">登录</a></li>
						<li><a Id="registerLink" href="<c:url value="/userAction_registerJsp"/>">注册</a></li>
						<li><a href="">帮助</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- End Header -->
		<h1>注册成功</h1>
	</div>
</body>

</html>