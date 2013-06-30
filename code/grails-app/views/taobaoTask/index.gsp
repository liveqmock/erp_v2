<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>淘宝异步任务</title>
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
			<a>淘宝异步任务</a>
		</div>
		<div class="wrapper">
			<h2 class="search">异步任务列表</h2>
			<div class="pannel">
				<a href="${createLink(action: 'addTask')}" class="button">添加任务</a>
			</div>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<table class="table">
				<thead>
				<tr>
					<th>序号</th>
					<th>方法</th>
					<th>开始</th>
					<th>结束</th>
					<th>状态</th>
					<th>最后检查</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<g:if test="${list}">
					<g:each in="${list}">
						<tr>
							<td>${it.taskId}</td>
							<td>${it.method}</td>
							<td>${it.startTime?.format('yyyy-MM-dd HH:mm:ss')}</td>
							<td>${it.endTime?.format('yyyy-MM-dd HH:mm:ss')}</td>
							<td>${it.status}</td>
							<td>${it.timeChecked?.format('yyyy-MM-dd HH:mm:ss')}</td>
							<td>${it.timeCreated?.format('yyyy-MM-dd HH:mm:ss')}</td>
							<td>
								<a href="${createLink(action: 'checkStatus', id: it.id)}">检查状态</a>
								<span>|</span>
								<a href="${createLink(action:'delete', id: it.id)}" onclick="return confirm('删除 ${it.id}?')">删?</a>
								<g:if test="${it.status == 'done'}">
								<span>|</span>
								<a href="${createLink(action:'doSyncDetial', id: it.id)}" onclick="return confirm('执行同步 ${it.taskId}?')">同步?</a>
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