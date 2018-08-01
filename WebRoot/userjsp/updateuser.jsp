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
<title>用户信息修改_投票网</title>
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
<script type="text/javascript">
	<!--表单提交验证-->
	function check(){
			var username = document.getElementById("username").value.trim();
			var password = document.getElementById("password").value.trim();
			var repassword = document.getElementById("repassword").value.trim();
			var age = document.getElementById("age").value.trim();
			var usernamemsg = document.getElementById("usernamemsg");
			var pswmsg = document.getElementById("pswmsg");
			var repswmsg = document.getElementById("repswmsg");
			var agemsg = document.getElementById("agemsg");
			var flag = 0;
			if(username==null||username==''){
				usernamemsg.innerHTML='昵称不能为空';
				flag=1;
			}else{
				usernamemsg.innerHTML='';
			}
			
			if(password==null||password==''){
				pswmsg.innerHTML='密码不能为空';
				flag=1;
			}else if(password.length>11||password.length<3){
				pswmsg.innerHTML='密码长度在3~12之间';
				flag=1;
			}else{
				pswmsg.innerHTML='';
			}
			if(repassword!=password){
				repswmsg.innerHTML='两次密码不一致';
				flag=1;
			}else{
				repswmsg.innerHTML='';
			}
			
			if(age==null||age==''){
				agemsg.innerHTML='年龄不能为空';
				flag=1;
			}else if(isNaN(age)){
				agemsg.innerHTML='年龄不合法';
				flag=1;
			}else if(age>100||age<0){
				agemsg.innerHTML='年龄不合法';
				flag=1;
			}else{
				agemsg.innerHTML='';
			}
			if(flag==0)
				return true;
			return false;
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
						<li><a class="username" href="<c:url value="userAction_userMsg"/>" title="管理">${user.username}</a>
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
                        <h1 class="page-title">用户信息修改</h1>
                    </header>
                    <div class="entry-content clearfix">
                    	<p><span style="color: red;">${msg }</span></p>
                        <form action="<c:url value="/userAction_updateUser"/>" method="post" onsubmit="return check();">
                        <p>
                            <label for="UserName">昵称</label><br />
                            <input id="username" name="username" type="text" value="${user.username }" />
                             <span id="usernamemsg" style="color: red;"></span>
                        </p>
                        <p>
                            <label for="Password">密码</label><br />
                            <input id="password" name="password" type="password" value="${user.password }"/>
                            <span  id="pswmsg" style="color: red;"></span>
                        </p>
                        
                        <p>
                            <label for="Password">确认密码</label><br />
                            <input id="repassword" name="repassword" type="password" value="${repassword }"/>
                            <span  id="repswmsg" style="color: red;"></span>
                        </p>
                        
                        <p>
                            <label for="sex">性别</label><br />
                            <c:choose>
                            	<c:when test="${user.sex eq 1 }">
                            		<input name="sex" type="radio" value="1" checked="checked"/>男
                            		<input name="sex" type="radio" value="0"/>女
                            	</c:when>
                            	<c:otherwise>
                            		<input name="sex" type="radio" value="1" />男
                            		<input name="sex" type="radio" value="0" checked="checked"/>女
                            	</c:otherwise>
                            </c:choose>
                        </p>
                        
                        <p>
                            <label for="age">年龄</label><br />
                            <input id="age" name="age" type="text" value="${user.age }"/>
                            <span id="agemsg" style="color: red;"></span>
                        </p> 
                      	
                        <p>	
                            <input type="submit" value="保存" />
                        </p>
                        	
                      </form>
                   </div>
                </article>
            </div>
            <aside id="main-sidebar" class="sidebar">
                <div class="sb-widget">
                    <div class="widget-content">
                      <h4 class="widget-title">关于我们</h4>
                      <div class="author-bio-widget">
                        <div class="author-avatar image-frame">
                            <img alt="投票网" src="//data.toutoupiao.com/Images/logo.png"  class="avatar avatar-150 photo" height="150" width="150" />
                        </div>
                        <div class="author-bio"><p>投票网。</p></div>
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

