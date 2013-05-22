<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>爱自然进销存管理系统淘宝用户绑定</title>
	<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<![endif]-->
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" />
	<meta name='robots' content='noindex,nofollow' />
	<link rel='stylesheet' href='${resource(dir: 'css', file: 'common.css')}' type='text/css' media='all' />
	<link rel='stylesheet' href='${resource(dir: 'css', file: 'style.css')}' type='text/css' media='all' />
	<link rel='stylesheet' href='${resource(dir: 'css', file: 'signin.css')}' type='text/css' media='all' />
	<script type='text/javascript' src='${resource(dir: 'js', file: 'jquery-1.4.4.min.js')}'></script>
	<script type='text/javascript' src='${resource(dir: 'js', file: 'common.js')}'></script>
	<script type='text/javascript' src='${resource(dir: 'js', file: 'jquery.uniform.min.js')}'></script>
</head>
<body itemscope itemtype="http://schema.org/WebPage">
<div class="wrapper">
	<article class="loginbox clearfix">
		<section class="login">
			<h1 title="爱自然进销存管理系统">爱自然进销存管理系统</h1>
			<p class="copyright">Copyright &copy; 2011-2013, Powered By <a href="http://code.yinheli.com/">Yinheli</a></p>
			<p class="copyright">Love Nature (NZ) Co., Ltd. All rights reserved.</p>
		</section>
		<section class="loginForm">
			<p>尚未绑定系统账号, 请输入用户名和密码, 绑定成功后, 可以通过淘宝账号快捷登录</p>
			<form name="loginform" id="loginform" action="${createLink(action: 'bind')}" method="post">
				<g:if test="${flash.message}"><span class="error">${flash.message}</span></g:if>
				<p class="login-username">
					<label for="username">用户名：</label>
					<input type="text" name="username" id="username" class="input" value="" size="20" />
				</p>
				<p class="login-password">
					<label for="password">密　码：</label>
					<input type="password" name="password" id="password" class="input" value="" size="20" />
				</p>
				<p class="login-submit">
					<input type="submit" name="wp-submit" id="wp-submit" class="button-primary" value="绑  定" />
				</p>
			</form>
		</section>
	</article>
</div>
</body>
</html>