<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<!--<![endif]-->

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="keywords" content="投票,文字投票," />
	<meta name="description" content="投票网，。。" />
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

<body>
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
						<li><a href='<c:url value="/index"/>'>首页</a></li>
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
		<header class="page-title-wrap">
			<h1 class="page-title">投票活动</h1>
		</header>
		
		<c:forEach var="vote" items="${page.voteList }">
			<div style="margin-top:10px; width: 250px; height:313px; margin-right: 30px;background-color: white; float: left;">
				<div style="padding:10% 10% 5% 5%; overflow: hidden;">
					<h6 class="auto-hidden">
						<a href="<c:url value="/voteAction_getVoteOption?vid=${vote.vid }"/>">${vote.votetitle }</a>
					</h6>
					<span> <i class="fa fa-clock-o"> </i> ${vote.overtime }
					</span>
				</div>

				<div style="width:250px;height: 130px; overflow: hidden;">
					<a href="<c:url value="/voteAction_getVoteOption?vid=${vote.vid }"/>"> 
						<c:forEach var="option" items="${vote.optionset }">
							<c:set var="img" value="${option.imgsrc }" />
						</c:forEach> 
						<c:choose>
							<c:when test="${not empty img}">
								<img class="image-middle" src="${img }" alt="1" />
							</c:when>
							<c:otherwise>
								<img class="image-middle"
									src="<c:url value="/voteoptionimg/votedefault.jpg"/>" alt="1" />
							</c:otherwise>
						</c:choose>
					</a>
				</div>
				<div style="width:250px;padding:10% 10% 5% 5%;">
					<p>
						创建人：${vote.user.username }<br /> 总票数：${vote.amount }<br />
						浏览量：${vote.vamount }
					</p>
				</div>
		</div>
		</c:forEach>
	</div>
	<div style="width: 100%;height:25px; float: left; ">
		<br>
		<center>
			<span>当前为第${page.pc }页/</span>
			<span>一共有${page.tp }页</span>
			<a href='<c:url value='/voteAction_getPageVote?pc=1'/>'> 首页</a>
			<c:if test="${page.pc > 1 }">
				<a href='<c:url value='/voteAction_getPageVote?pc=${page.pc-1 }'/>'> 上一页</a>
			</c:if>
			<c:choose>
				<c:when test="${page.tp <= 10 }">
					<c:set var='begin' value="1"></c:set>
					<c:set var='end' value="${page.tp }"></c:set>
				</c:when>
			<c:otherwise>
				<c:set var='begin' value="${page.pc-5 }"></c:set>
				<c:set var='end' value="${page.pc+4 }"></c:set>
				<c:if test="${begin < 1 }">
					<c:set var='begin' value="1"></c:set>
					<c:set var='end' value="10"></c:set>
				</c:if>
				<c:if test="${end > pb.tp }">
					<c:set var='begin' value="${page.tp-9 }"></c:set>
					<c:set var='end' value="${page.tp }"></c:set>
				</c:if>
			</c:otherwise>
		</c:choose>
		<c:forEach var='i' begin='${begin }' end='${end }'>
			<c:choose>
				<c:when test="${i eq page.pc }">
					<font color="gren">[${i }]</font>
				</c:when>
				<c:otherwise>
					<a href='<c:url value='/voteAction_getPageVote?pc=${i }'/>'>[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.pc < page.tp }">
			<a href='<c:url value='/voteAction_getPageVote?pc=${page.pc+1 }'/>'> 下一页</a>
		</c:if>
		<a href='<c:url value='/voteAction_getPageVote?pc=${page.tp }'/>'> 尾页</a>
	</center>
	</div>
</body>
</html>