<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>异步任务添加</title>
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
			<a href="${createLink(controller: 'taobaoTask', action: 'index')}">淘宝异步任务</a>
			<span>&gt;</span>
			<a>异步任务添加</a>
		</div>
		<div class="wrapper">
			<h2 class="search">添加任务</h2>
			<div class="pannel">
				<form action="${createLink(action:'sync')}" class="jqtransform" method="post">
					<g:if test="${flash.message}">
						<div class="message">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${instance}">
						<div class="errors">
							<g:renderErrors bean="${instance}" as="list" />
						</div>
					</g:hasErrors>
					<table class="layout">
						<tbody>
						<tr>
							<th>
								<label for="start">开始时间：</label>
							</th>
							<td>
								<input type="text" name="start" id="start" value="${instance.startTime?.format('yyyyMMdd')}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="end">结束时间：</label>
							</th>
							<td>
								<input type="text" name="end" id="end" value="${instance.endTime?.format('yyyyMMdd')}" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<input type="submit" value="提交" />
							</td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<g:render template="../settings/sidebar" />
</body>
</html>