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
<meta name="description" content="参与投票领奖励" />
<meta name="keywords" content="投票" />
<title>投票活动</title>

<link href="//data.toutoupiao.com/Images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="//data.toutoupiao.com/Content/style.min.css" rel="stylesheet" />
<link href="//data.toutoupiao.com/Content/lightbox/lightbox.css" rel="stylesheet" />
<link href="//data.toutoupiao.com/Content/notifIt/notifIt.css" rel="stylesheet" />
<link href="//data.toutoupiao.com/Content/stylecolor/yellow.css" rel="stylesheet" />

<script src="//data.toutoupiao.com/Scripts/modernizr-2.8.3.js"></script>
<script src="//data.toutoupiao.com/Scripts/jquery-1.11.1.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/common.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/jqueryval.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/lightbox/lightbox.min.js"></script>
<script src="//data.toutoupiao.com/Scripts/notifIt/notifIt.js"></script>
<script src="//data.toutoupiao.com/Scripts/comment.js"></script>
<script src="//data.toutoupiao.com/Scripts/vote.js"></script>
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
						<c:choose>
							<c:when test="${not empty sessionScope.user }">
								<li><a class="username"
									href="<c:url value="userAction_userMsg"/>" title="管理"
									value="${sessionScope.user.userid }">${sessionScope.user.username }</a>
									<ul class="sub-menu">
										<li><a href="<c:url value="/voteAction_adVote"/>">创建投票</a></li>
										<li><a href="<c:url value="/voteAction_getUserVote"/>">我的发布</a></li>
										<li><a href="<c:url value="/voteAction_joinVot"/>">我的参与</a></li>
										<li><a href="<c:url value="/userAction_cancel"/>">注销</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li><a Id="loginLink"
									href="<c:url value="/userAction_loginJsp"/>">登录</a></li>
								<li><a Id="registerLink"
									href="<c:url value="/userAction_registerJsp"/>">注册</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="">帮助</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- End Header -->

		<div class="ad-mobile ad-container-mb">
			<script async
				src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- 自适应horizontal -->
			<ins class="adsbygoogle" style="display:block"
				data-ad-client="ca-pub-0818696064622523" data-ad-slot="5199778549"
				data-ad-format="horizontal"></ins>
		</div>

		<div class="content-section clearfix">
			<div id="main-content" class="content">
				<article class="content-background clearfix">
					<header class="entry-header">
						<div class="clearfix">
							<h1 class="entry-title">${vote.votetitle }</h1>
						</div>
						<p class="entry-meta">
							<i class="fa fa-clock-o"></i> <span class="updated"> <c:choose>
									<c:when test="${vote.isover eq 0 }">
										${vote.overtime }
									</c:when>
									<c:otherwise>
										结束
									</c:otherwise>
								</c:choose>
							</span> <i class="fa fa-eye"></i><span class="entry-category">${vote.vamount }</span>
							<i class="fa fa-user"></i><span>${vote.user.username }</span>
						</p>
					</header>
				</article>
				<div id="send_vote" class="content-margin">
					<form action="<c:url value="/voteAction_vote.action"/>"
						method="Post">
						<ul class="pic-ul">
							<c:forEach var="voteoption" items="${vote.optionset }">
								<li>
									<div class="pic-wrapper">
										<c:choose>
											<c:when test="${not empty voteoption.imgsrc}">
												<a href="${voteoption.imgsrc}"
													class="lightbox image_gallery"
													data-lightbox-gallery="image_gallery"
													title="${voteoption.name }"> <img class="pic"
													src="${voteoption.imgsrc }" /></a>
											</c:when>
											<c:otherwise>
												<a href="<c:url value="/voteoptionimg/votedefault.jpg"/>"
													class="lightbox image_gallery"
													data-lightbox-gallery="image_gallery"
													title="${voteoption.name }"> <img class="pic"
													src="<c:url value="/voteoptionimg/votedefault.jpg"/>" /></a>
											</c:otherwise>
										</c:choose>

									</div>
									<div class="pic-info">
										<c:set var="flog" value="0" />
										<c:forEach var="u" items="${vote.users}">
											<c:if test="${u.userid eq user.userid }">
												<c:set var="flog" value="1" />
											</c:if>
										</c:forEach>
										<!-- 活动结束或者用户已经参加过 -->
										<!-- 查找用户选择的项 -->
										<c:choose>
											<c:when test="${flog eq 1 || vote1.isover eq 1}">
												<c:set var="color" value="0" />

												<c:forEach var="u" items="${voteoption.users }">
													<c:if test="${u.userid eq user.userid }">
														<c:set var="color" value="1" />
													</c:if>
												</c:forEach>
												<c:choose>
													<c:when test="${color eq 1}">
														<span style="color: green;">${voteoption.name}</span>
														<span style="color: green;">${voteoption.amount}票</span>
													</c:when>
													<c:otherwise>
														<span>${voteoption.name}</span>
														<span>${voteoption.amount}票</span>
													</c:otherwise>
												</c:choose>
											</c:when>

											<c:otherwise>
												<c:choose>
													<c:when test="${vote.ischeck}">
														<input name="Choice" type="checkbox"
															value="${voteoption.vptid }" />
														<input type="button" class="pic-choice" value="选择" />
														<span>${voteoption.name }</span>
													</c:when>

													<c:otherwise>
														<input id="Choice" name="Choice" type="radio"
															value="${voteoption.vptid }" />
														<input type="button" class="pic-choice" value="选择" />
														<span>${voteoption.name }</span>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</c:forEach>
						</ul>
						<!-- 用户没有参与活动并且没有结束 -->
						<c:if test="${flog eq 0 && vote.isover eq 0}">
							<input type="submit" value="投票">
						</c:if>
					</form>
				</div>
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
