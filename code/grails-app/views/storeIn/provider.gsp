<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>采购管理</title>
</head>
<body>
<div class="main" role="main">
	<div class="inner">
		<div class="title">
			<a href="${createLink(controller: 'main')}">爱自然进销存管理系统</a>
			<span>&gt;</span>
			<a href="${createLink(action: 'index')}">采购管理</a>
			<span>&gt;</span>
			<a>供应商列表</a>
		</div>
		<div class="wrapper">
			<h2 class="search">供应商列表</h2>
			<div class="pannel">
			</div>
			<table class="table">
				<thead>
				<tr>
					<th>供应商名称</th>
					<th>联系人</th>
					<th>手机</th>
					<th>电话</th>
					<th>传真</th>
					<th>电子邮箱</th>
					<th>旺旺</th>
					<th>QQ</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<g:if test="${list}">
				<g:each in="${list}">
				<tr>
					<td>${it.name}</td>
					<td>${it.contacts}</td>
					<td>${it.contactsMobile}</td>
					<td>${it.contactsTel}</td>
					<td>${it.fax}</td>
					<td>${it.email}</td>
					<td>${it.wangwang}</td>
					<td>${it.qq}</td>
					<td>
						<a href="${createLink(action: 'providerEdit', id: it.id)}">编辑</a>
						<span>|</span>
						<a href="${createLink(action:'providerDelete', id: it.id)}">删除</a>
						<span>|</span>
						<a href="${createLink(action: 'providerShow', id: it.id)}">查看</a>
					</td>
				</tr>
				</g:each>
				</g:if>
				<g:else>
					<tr><td colspan="9">无数据</td></tr>
				</g:else>
				</tbody>
			</table>
			<g:pagenavi total="${total}" />
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>