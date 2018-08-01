<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="zh"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="zh"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="zh"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="zh">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="//data.toutoupiao.com/Images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>用户登陆_投票网</title>
<link href="//data.toutoupiao.com/Content/style.min.css" rel="stylesheet" />
<script src="//data.toutoupiao.com/Scripts/modernizr-2.8.3.js"></script>
<script src="//data.toutoupiao.com/Scripts/jquery-1.11.1.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/common.min.js"></script>
<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-45890340-1"></script>
<script>
	 window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'UA-45890340-1');
</script>
<script type="text/javascript">
	<!--表单提交验证-->
	
	function check(){
		var email = document.getElementById("Email").value.trim();
		var password = document.getElementById("Password").value.trim();
		var emailmsg =document.getElementById("emailmsg");
		var passwordmsg = document.getElementById("passwordmsg");
		if(email==null||email==''){
			emailmsg.innerHTML='邮箱不能为空';
		}else{
			emailmsg.innerHTML='';
		}
		
		if(password==null||password==''){
			passwordmsg.innerHTML='密码不能为空';
		}else{
			passwordmsg.innerHTML='';
		}
		if(email==null||password==null||email==''||password==''){
			return false;
		}
		return true;
	}
</script>

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
		<div class="content-section clearfix">
			<div id="main-content">
				<article class="content-margin content-background clearfix">
					<header class="page-title-wrap">
						<h1 class="page-title">用户登陆</h1>
					</header>
					<div class="entry-content clearfix">
						<form action="/voteproject/userAction_login.action" method="post" onsubmit="return check()">
							<p>
								<label for="Email">邮箱</label><br /> 
								<input id="Email" name="email" type="text" value="${user.email }" />
								<span id="emailmsg" style="color: red;"></span>
							</p>
							<p>
								<label for="Password">密码</label><br /> 
								<input id="Password" name="password" type="password" />
								<span id="passwordmsg" style="color: red;"></span>
							</p>
							<span style="color: red;">${massege }</span>
							<p>
								<input type="submit" value="登陆" />
							</p>
						</form>
						<p>
							还没有账号? <a href="<c:url value="/userAction_registerJsp"/>">马上注册</a>
						</p>
					</div>
				</article>
			</div>
			<aside id="main-sidebar" class="sidebar">
				<div class="sb-widget">
					<div class="widget-content">
						<h4 class="widget-title">关于我们</h4>
						<div class="author-bio-widget">
							<div class="author-avatar image-frame">
								<img alt="投票网" src="//data.toutoupiao.com/Images/logo.png"
									class="avatar avatar-150 photo" height="150" width="150" />
							</div>
							<div class="author-bio">
								<p>投票网。</p>
							</div>
						</div>
					</div>
				</div>
			</aside>
		</div>
		<!-- footer -->
		<footer id="footer" class="footer clearfix">
			<nav class="social-nav clearfix">
				<div class="menu-social-container">
					<ul id="menu-social" class="menu">
						<li class="menu-item"><a target="_blank"
							href="mailto:1210253763@qq.com"><span class="social-icon"><i
									class="fa fa-social"></i></span><span class="screen-reader-text">Email</span></a></li>
						<li class="menu-item"><a target="_blank"
							href="http://weibo.com/2138175953"><span class="social-icon"><i
									class="fa fa-social"></i></span><span class="screen-reader-text">新浪微博</span></a></li>
						<li class="menu-item"><a target="_blank"
							href="//data.toutoupiao.com/Images/toutoupiao_weixin.jpg"><span
								class="social-icon"><i class="fa fa-social"></i></span><span
								class="screen-reader-text">微信</span></a></li>
					</ul>
				</div>
			</nav>
			<div class="copyright-wrap">
				<p class="copyright">
					Copyright &copy; 2018 <a href="/" title="投票网">投票网</a>
				</p>
			</div>
		</footer>
		<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	</div>
</body>
</html>

