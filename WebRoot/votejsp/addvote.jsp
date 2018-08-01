<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--[if lt IE 7 ]><html class="ie ie6" lang="zh"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="zh"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="zh"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="zh">
<!--<![endif]-->

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="//data.toutoupiao.com/Images/favicon.ico"
		rel="shortcut icon" type="image/x-icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>创建投票</title>
	<link href="//data.toutoupiao.com/Content/style.min.css" rel="stylesheet" />
	<link href="//data.toutoupiao.com/Content/froalaeditor/froalaeditor.min.css" rel="stylesheet" />
	<link href="//data.toutoupiao.com/Content/datetimepicker/DateTimePicker.css" rel="stylesheet" />
	<link href="//data.toutoupiao.com/Content/fineuploader/fine-uploader5.3.0.css" rel="stylesheet" />
	<link href="//data.toutoupiao.com/Content/notifIt/notifIt.css" rel="stylesheet" />
	<script src="//data.toutoupiao.com/Scripts/modernizr-2.8.3.js"></script>
	<script src="//data.toutoupiao.com/Scripts/jquery-1.11.1.min.js"></script>
	<script src="//data.toutoupiao.com/Scripts/common.min.js"></script>
	<script src="//data.toutoupiao.com/Scripts/froalaeditor/froala_editor.js"></script>
	<script src="//data.toutoupiao.com/Scripts/froalaeditor/plugins/plugins.min.js"></script>
	<script src="//data.toutoupiao.com/Scripts/froalaeditor/langs/zh_cn.js"></script>
	<script src="//data.toutoupiao.com/Scripts/addinputarea/add-input-area.js"></script>
	<script src="//data.toutoupiao.com/Scripts/fineuploader/fineuploader5.3.0.js"></script>
	<script src="//data.toutoupiao.com/Scripts/datetimepicker/DateTimePicker.js"></script>
	<script src="//data.toutoupiao.com/Scripts/notifIt/notifIt.js"></script>
	<script type="text/template" id="pic-template"></script>
	<script src="//data.toutoupiao.com/Scripts/inputvote.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-45890340-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
	
		function gtag() {
			dataLayer.push(arguments);
		}
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
						<li><a class="username"
							href="<c:url value="userAction_userMsg"/>" title="管理">${sessionScope.user.username}</a>
							<ul class="sub-menu">
								<li><a href="">创建投票</a></li>
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
			<div id="main-content" class="content">
				<form action="<c:url value="/voteAction_addVote.action"/>"
					method="post" enctype="multipart/form-data"
					onsubmit="return ValidateVote()">
					<input type="hidden" name="userid" value="${u.userid }">
					<article class="loop-container content-margin clearfix">
						<header class="page-title-wrap">
							<h1 class="page-title">创建投票</h1>
						</header>
						<div class="validation-summary-valid" data-valmsg-summary="true">
							<ul>
								<li style="display:none"></li>
							</ul>
						</div>
						<div class="entry-content clearfix">
							<p>
								<label for="VoteName">投票标题</label><br /> <input id="VoteName"
									name="votetitle" type="text" value="" />

							</p>

							<ul id="options_list" class="item-list">
								<li class="options_list_var">
									<div class="clearfix">
										<label for="item-0" for-format="item-%d">选项1</label><br /> <input
											id="InputVoteItemList_0__ItemName"
											id-format="InputVoteItemList_[%d]__ItemName"
											name="voteoptionlist[0].name"
											name-format="voteoptionlist[%d].name" type="text" value="" /><br />
										<label>图片</label><br /> <input class="pic-link"
											id="InputVoteItemList_0__Pic"
											id-format="InputVoteItemList_[%d]__pic" name="optionimg"
											name-format="optionimg" type="file" value="" /><br /> <label
											name="picbutton_0" id="picbutton_0" role="button"
											class="options_input"></label> <label class="options_input"><input
											type="button" class="options_list_del" value="删除" /></label>
									</div>
									<div name="options_list_0" id="options_list_0"></div>
								</li>
							</ul>
							<input type="button" class="options_list_add" id="add_item"
								value="增加选项" />
						</div>
					</article>

					<section
						class="loop-container related-posts content-background content-margin">
						<header class="page-title-wrap">
							<h1 class="page-title">功能设置</h1>
						</header>
						<ul class="related-wrap">
							<li>
								<div class="function_tag">
									单选多选： <label class="checked">单选</label> <label>多选</label>
									 <input name="ischeck" type="hidden" value="单选" />

								</div>
							</li>

							<li>
								<div class="function_tag">
									投票截止日期： <input type="text" name="overtime" id="EndTime"
										class="input" data-field="datetime" readonly="readonly" /> <span
										class="field-validation-valid" data-valmsg-for="EndTime"
										data-valmsg-replace="true"></span>
									<div id="dtBox"></div>
								</div>
							</li>
						</ul>
					</section>

					<div class="content-background clearfix">
						<h3 class="center-container">

							<input type="submit" id="addsubmit" class="submit" value="发布投票" />

						</h3>
					</div>
				</form>
			</div>

			<aside id="main-sidebar" class="sidebar">
				<div class="sb-widget">
				<footer id="footer" class="footer clearfix">
					<nav class="social-nav clearfix">
						<div class="menu-social-container">
							<ul id="menu-social" class="menu">
								<li class="menu-item"><a target="_blank"
									href="mailto:1210253763@qq.com"><span class="social-icon"><i
											class="fa fa-social"></i></span><span class="screen-reader-text">Email</span></a></li>
								<li class="menu-item"><a target="_blank"
									href="http://weibo.com/2138175953"><span
										class="social-icon"><i class="fa fa-social"></i></span><span
										class="screen-reader-text">新浪微博</span></a></li>
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
			</aside>
			</div>
    </div>
</body>
</html>