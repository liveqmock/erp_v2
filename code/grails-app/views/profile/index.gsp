<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>帐号管理</title>
</head>
<body>
<div class="main" role="main">
	<div class="inner">
		<div class="title">
			<a href="${createLink(controller: 'main')}">爱自然进销存管理系统</a>
			<span>&gt;</span>
			<a>管理首页</a>
			<span>&gt;</span>
			<a>帐号管理</a>
		</div>
		<div class="wrapper">
			<h2 class="search">帐号管理</h2>
			<div class="pannel">
				<p>用户名: ${session.user.loginName}</p>
				<p>真实姓名:${session.user.realname}</p>
				<p>TODO ...</p>
			</div>
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>