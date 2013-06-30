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
			<a>帐号管理</a>
		</div>
		<div class="wrapper">
			<h2 class="search">账号信息</h2>
			<div class="pannel">
				<table class="table">
					<tbody>
					<tr>
						<th>登录名</th>
						<td>${instance.loginName}</td>
						<th>昵称</th>
						<td>${instance.name}</td>
						<th>真实姓名</th>
						<td>${instance.realname}</td>
					</tr>
					<tr>
						<th>邮箱</th>
						<td>${instance.email}</td>
						<th>电话</th>
						<td colspan="3">${instance.mobile}</td>
					</tr>
					<tr>
						<th>上次登录时间</th>
						<td>${instance.timeLogin?.format('yyyy-MM-dd HH:mm:ss')}</td>
						<th>上次登录IP</th>
						<td colspan="3">${instance.lastIp}</td>
					</tr>
					<g:if test="${instance.taobaoUserId && instance.taobaoUserId > 0}">
					<tr>
						<th>淘宝昵称</th>
						<td>${instance.taobaoUserNick}</td>
						<th>绑定时间</th>
						<td>${instance.taobaoBindTime?.format('yyyy-MM-dd HH:mm:ss')}</td>
						<th>绑定IP</th>
						<td>${instance.taobaoBindIp}</td>
					</tr>
					</g:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>