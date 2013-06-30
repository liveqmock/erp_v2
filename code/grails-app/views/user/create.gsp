<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>采购管理</title>
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
			<a>创建用户</a>
		</div>
		<div class="wrapper">
			<h2 class="search">${instance.id?'更新':'创建'}用户</h2>
			<div class="pannel">
				<form action="${createLink(action:'save')}" class="jqtransform" method="post">
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
								<label for="loginName">登录名：</label>
							</th>
							<td>
								<input type="text" name="loginName" id="loginName" value="${instance.loginName}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="name">昵称：</label>
							</th>
							<td>
								<input type="text" name="name" id="name" value="${instance.name}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="realname">真实姓名：</label>
							</th>
							<td>
								<input type="text" name="realname" id="realname" value="${instance.realname}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="email">邮箱：</label>
							</th>
							<td>
								<input type="text" name="email" id="email" value="${instance.email}" />
							</td>
						</tr>
						<g:if test="${!(instance.id)}">
						<tr>
							<th>
								<label for="password">密码：</label>
							</th>
							<td>
								<input type="password" name="password" id="password" value="" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="password2">重复密码：</label>
							</th>
							<td>
								<input type="password" name="password2" id="password2" value="" />
							</td>
						</tr>
						</g:if>
						<tr>
							<th>
								<label for="mobile">手机：</label>
							</th>
							<td>
								<input type="text" name="mobile" id="mobile" value="${instance.mobile}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="status">状态：</label>
							</th>
							<td>
								<g:select from="${erp_v2.User.statusMap}" optionKey="key" optionValue="value" name="status" value="${instance.status}"></g:select>
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<input type="submit" value="提交" />
								<g:hiddenField name="id" value="${instance.id}"/>
							</td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<g:if test="${!(instance.id)}">
<script type="text/javascript">
	(function($) {
		$(function() {
			$('.jqtransform').submit(function() {
				var p1 = $('#password').val(), p2 = $('#password2').val()
				if (p1.length < 6) {
					alert('密码必须设置大约6位');
					$('#password').focus();
					return false;
				} else if (p1 != p2) {
					alert('两次密码输入不一致');
					$('#password2').focus();
					return false;
				}
			});
		});
	})(jQuery);
</script>
</g:if>
<g:render template="../settings/sidebar" />
</body>
</html>