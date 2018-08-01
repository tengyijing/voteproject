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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="//data.toutoupiao.com/Images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="//data.toutoupiao.com/Content/style.min.css" rel="stylesheet" />
<title>用户信息_投票网</title>
<script src="//data.toutoupiao.com/Scripts/modernizr-2.8.3.js"></script>
<script src="//data.toutoupiao.com/Scripts/jquery-1.11.1.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/common.min.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-45890340-1">
</script>
<script>
      window.dataLayer = window.dataLayer || [];
      function gtag() { dataLayer.push(arguments); }
      gtag('js', new Date());
      gtag('config', 'UA-45890340-1');
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
						<li><a class="username" href="" title="管理">${user.username }</a>
							<ul class="sub-menu">
								<li><a href="<c:url value="/voteAction_adVote"/>">创建投票</a></li>
								<li><a href="<c:url value="/voteAction_getUserVote"/>">我的发布</a></li>
								<li><a href="<c:url value="/voteAction_joinVot"/>">我的参与</a></li>
								<li><a href="<c:url value="/userAction_cancel"/>">注销</a></li>
							</ul></li>

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
						<h1 class="page-title">管理账户</h1>
					</header>
					<div class="entry-content clearfix">
						<div class="validation-summary-valid" data-valmsg-summary="true">
							<ul>
								<li style="display:none"></li>
							</ul>
						</div>

						<p>
							<label for="Members_Email">注册邮箱</label><br /> ${user.email }
						</p>
						<p>
							<label for="Members_LoveName">昵称</label><br /> ${user.username }
						</p>

						<p>
							<label for="Members_LoveName">年龄</label><br /> ${user.age }
						</p>
						
						<p>
							<label for="Members_LoveName">性别</label><br />
							<c:choose>
								<c:when test="${user.sex eq 1 }">
									男
								</c:when>
								<c:otherwise>
									女
								</c:otherwise>
							</c:choose>
						</p>
						
						<p>
							<a href='<c:url value="/userAction_updateJsp"/>'>修改信息</a>
						</p>

					</div>
				</article>
			</div>
		</div>
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

