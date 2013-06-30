<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>用户管理</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jqtransform.css')}" type="text/css" media="all" />
</head>
<body>
<div class="main" role="main">
	<div class="inner">
		<div class="title">
			<a href="${createLink(controller: 'main')}">爱自然进销存管理系统</a>
			<span>&gt;</span>
			<a href="${createLink(controller: 'settings')}">系统设置</a>
			<span>&gt;</span>
			<a>用户管理</a>
		</div>
		<div class="wrapper">
			<h2 class="search">用列表</h2>
			<div class="pannel">
				<form id="searchbox" class="jqtransform" action="">
					<fieldset>
						<p class="clearfix">
							<input type="text" name="s" id="keywords" class="textfield" value="" />
							<input type="submit" class="button" value="搜索" />
						</p>
					</fieldset>
				</form>
			</div>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<table class="table">
				<thead>
				<tr>
					<th>序号</th>
					<th>登录名</th>
					<th>姓名</th>
					<th>上次登录IP</th>
					<th>上次登录时间</th>
					<th>状态</th>
					<th>绑定淘宝?</th>
					<th>淘宝昵称</th>
					<th>用于同步?</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<g:if test="${list}">
					<g:each in="${list}">
						<tr>
							<td>${it.id}</td>
							<td>${it.loginName}</td>
							<td>${it.realname}</td>
							<td>${it.lastIp}</td>
							<td>${it.timeLogin?.format('yyyy-MM-dd HH:mm:ss')}</td>
							<td>${erp_v2.User.statusMap[it.status]}</td>
							<td style="text-align: center">${it.taobaoUserId && it.taobaoUserId > 0 ? '&#8730;':'&#967;'}</td>
							<td>${it.taobaoUserNick}</td>
							<td style="text-align: center">${it.isPrimaryTaobaoUser ? '&#8730;':'&#967;'}</td>
							<td>
								<a href="${createLink(action: 'edit', id: it.id)}">编辑</a>
								<span>|</span>
								<a href="${createLink(action:'delete', id: it.id)}" onclick="return confirm('删除 ${it.loginName}(${it.realname})?')">删?</a>
								<span>|</span>
								<a href="${createLink(action:'resetPassword', id: it.id)}" onclick="return confirm('重置密码 ${it.loginName}(${it.realname})?')">重置密码</a>
								<g:if test="${!(it.isPrimaryTaobaoUser)}">
								<span>|</span>
								<a href="${createLink(action:'setAsSyncId', id: it.id)}" title="同步淘宝订单数据使用该账号">设置为同步</a>
								</g:if>
							</td>
						</tr>
					</g:each>
				</g:if>
				<g:else>
					<tr><td colspan="10">无数据</td></tr>
				</g:else>
				</tbody>
			</table>
			<g:pagenavi total="${total}" />
		</div>
	</div>
</div>
<g:render template="../settings/sidebar" />
</body>
</html>