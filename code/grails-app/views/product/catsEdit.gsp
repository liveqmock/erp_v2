<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>分类编辑</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jqtransform.css')}" type="text/css" media="all" />
</head>
<body>
<div class="main" role="main">
	<div class="inner">
		<div class="title">
			<a href="${createLink(controller: 'main')}">爱自然进销存管理系统</a>
			<span>&gt;</span>
			<a>产品管理</a>
			<span>&gt;</span>
			<a>分类管理</a>
			<span>&gt;</span>
			<a>分类编辑</a>
		</div>

		<div class="wrapper">
			<h2 class="search">编辑分类</h2>
			<div class="pannel">
				<form action="${createLink(action: 'catsEdit')}" class="jqtransform" method="post">
					<table class="layout">
						<tbody>
						<tr>
							<th>
								<label for="name">分类名称：</label>
							</th>
							<td>
								<input type="text" class="regular-text" name="name" id="name" value="${cat.name}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="description">分类描述：</label>
							</th>
							<td>
								<input type="text" class="regular-text" name="description" id="description" value="${cat.description}" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<g:hiddenField name="id" value="${cat.id}" />
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
<g:render template="sidebar" />
</body>
</html>