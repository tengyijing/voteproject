<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="keywords" content="投票,文字投票," />
<meta name="description" content="投票网，只需简单几步即可创建投票。。" />
<title>投票网</title>
<link href="//data.toutoupiao.com/Images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="//data.toutoupiao.com/Content/style.min.css" rel="stylesheet" />
<link href="//data.toutoupiao.com/Content/owlcarousel/owlcarousel.css" rel="stylesheet" />
<script src="//data.toutoupiao.com/Scripts/modernizr-2.8.3.js"></script>
<script src="//data.toutoupiao.com/Scripts/jquery-1.11.1.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/common.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/owlcarousel/owlcarousel.js"></script>
<script src="//data.toutoupiao.com/Scripts/index.js"></script>
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

						<li><a Id="registerLink" href="<c:url value="/index"/>">首页</a></li>
						<c:choose>
							<c:when test="${not empty sessionScope.user }">
								<li><a class="username" href="<c:url value="userAction_userMsg"/>" title="管理"
									value="${sessionScope.user.userid }">${sessionScope.user.username }</a>
									<ul class="sub-menu">
										<li><a href="<c:url value="/voteAction_adVote"/>">创建投票</a></li>
										<li><a href="<c:url value="/voteAction_getUserVote"/>">我的发布</a></li>
										<li><a href="<c:url value="/voteAction_joinVot"/>">我的参与</a></li>
										<li><a href="<c:url value="/userAction_cancel"/>">注销</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li><a Id="loginLink" href="<c:url value="/userAction_loginJsp"/>">登录</a></li>
								<li><a Id="registerLink" href="<c:url value="/userAction_registerJsp"/>">注册</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="">帮助</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- End Header -->
		<div class="content-section clearfix">
			<div class="list-carousel clearfix">
				<header class="page-title-wrap">
					<h1 class="page-title">最热投票活动</h1>
				</header>
				<div class="owl-carousel owl-theme">
					<c:forEach var="vote" items="${votelist }">
						<div class="carousel-item">
							<div class="entry-margin">
								<h6 class="auto-hidden">
									<a
										href="<c:url value="/voteAction_getVoteOption?vid=${vote.vid }"/>">${vote.votetitle }</a>
								</h6>
								<span><i class="fa fa-clock-o"></i>${vote.overtime }</span>
							</div>
							<div class="carousel-image">
								<div class="entry-image">
									<a
										href="<c:url value="/voteAction_getVoteOption?vid=${vote.vid }"/>">
										<c:forEach var="option" items="${vote.optionset }">
											<c:set var="img" value="${option.imgsrc }"/>
										</c:forEach>				
										<c:choose>
											
											<c:when test="${not empty img}">
												<img class="image-middle"
												src="${img }" alt="1" />
											</c:when>
											<c:otherwise>
												<img class="image-middle"
												src="<c:url value="/voteoptionimg/votedefault.jpg"/>" alt="1" />
											</c:otherwise>
										</c:choose>
									</a>
								</div>
								<div class="entry-icon">
									<span class="fa-stack fa-lg"> <i
										class="fa fa-circle fa-stack-2x"></i> <i
										class="fa fa-picture-o fa-stack-1x fa-inverse"></i>
									</span>
								</div>
							</div>

							<div class="entry-margin">
								<p>
									创建人：${vote.user.username }<br /> 总票数：${vote.amount }<br />
									浏览量：${vote.vamount }
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<header class="page-title-wrap">
					<a href="<c:url value="/voteAction_getPageVote"/>"><h1 class="page-title">查看全部</h1></a>
			</header>
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
		</div>
	</div>
</body>
</html>
