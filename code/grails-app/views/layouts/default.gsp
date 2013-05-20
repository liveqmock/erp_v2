<%@ page contentType="text/html;charset=UTF-8" %><!DOCTYPE HTML>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="ERP SYSTEM" /> - ERP NZ</title>
	<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<![endif]-->
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" />
	<meta name='robots' content='noindex,nofollow' />
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'common.css')}" type="text/css" media="all" />
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css" media="all" />
	<g:layoutHead />
</head>
<body itemscope itemtype="http://schema.org/WebPage">
<header class="header">
	<h1 id="logo">
		<a href="${createLink(controller: 'main')}" title="爱自然进销存管理系统" rel="home">爱自然进销存管理系统</a>
	</h1>
	<nav class="navigation${controllerName=='main'?' home':''}" role="navigation">
		<ul class="clearfix">
			<li class="index${controllerName=='main'?' current':''}">
				<a href="${createLink(controller: 'main')}">首页</a>
			</li>
			<li class="product${controllerName=='product'?' current':''}">
				<a href="${createLink(controller: 'product')}">商品</a>
			</li>
			<li class="sale${controllerName=='sale'?' current':''}">
				<a href="${createLink(controller: 'sale')}">订单</a>
			</li>
			<li class="postSale${controllerName=='postSale'?' current':''}">
				<a href="${createLink(controller: 'postSale')}">售后</a>
			</li>
			<li class="home${controllerName=='storeIn'?' current':''}">
				<a href="${createLink(controller: 'storeIn')}">采购</a>
			</li>
			<li class="storeManage${controllerName=='storeManage'?' current':''}">
				<a href="${createLink(controller: 'storeManage')}">库存</a>
			</li>
			<li class="finance${controllerName=='finance'?' current':''}">
				<a href="${createLink(controller: 'finance')}">财务</a>
			</li>
			<li class="report${controllerName=='report'?' current':''}">
				<a href="${createLink(controller: 'report')}">报表</a>
			</li>
			<li class="customer${controllerName=='customer'?' current':''}">
				<a href="${createLink(controller: 'customer')}">会员</a>
			</li>
			<li class="marketing${controllerName=='marketing'?' current':''}">
				<a href="${createLink(controller: 'marketing')}">营销</a>
			</li>
		</ul>
	</nav>
	<ul class="copyright clearfix">
		<li>
			<a href="${createLink(controller: 'main')}">
				系统首页
			</a>
		</li>
		<li>
			<a href="${createLink(uri: '/help.html')}">
				使用帮助
			</a>
		</li>
		<li>
			<a href="#" onclick="alert('爱自然进销存管理系统'); return false;">
				关于我们
			</a>
		</li>
	</ul>
	<p class="userinfo">
		欢迎您, <%=session?.user.loginName%>
		<a href="${createLink(controller: 'profile')}">帐号管理</a>
		<a href="${createLink(controller: 'profile', action: 'edit')}">编辑</a>
	</p>
	<div class="userPanel">
		<div class="inner">
			<img alt='matthew' src='${resource(dir: 'images', file: 'avatar.png')}' height='43' width='43' />
			<ul>
				<li class="setting">
					<a href="${createLink(controller: 'settings')}">系统设置</a>
				</li>
				<li class="cancel">
					<a href="${createLink(controller: 'login', action: 'logout')}">注销</a>
				</li>
				<li class="logout">
					<a href="${createLink(controller: 'login', action: 'logout')}">退出</a>
				</li>
			</ul>
		</div>
	</div>
</header>
<div id="content" class="clearfix">
	<g:layoutBody />
</div>
<footer>
	<p>
		感谢您使用爱自然进销存管理系统<span>	Copyright &copy; 2011-<%=(new Date().format('yyyy'))%> Love Nature (NZ) Co., Ltd.</span>
	</p>
</footer>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.4.4.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.uniform.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.jqtransform.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'common.js')}"></script>
</body>
</html>