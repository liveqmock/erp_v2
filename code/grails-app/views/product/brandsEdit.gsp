<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>商品品牌编辑</title>
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
			<a>商品品牌</a>
			<span>&gt;</span>
			<a>品牌编辑</a>
		</div>

		<div class="wrapper">
			<h2 class="search">编辑品牌</h2>
			<div class="pannel">
				<form action="#" class="jqtransform" method="post">
					<table class="layout">
						<tbody>
						<tr>
							<th>
								<label for="name">品牌名称：</label>
							</th>
							<td>
								<input type="text" class="regular-text" name="name" id="name" value="${brand.name}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="logo">品牌LOGO：</label>
							</th>
							<td>
								<input type="file" name="logo" id="logo" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<g:hiddenField name="id" value="${brand.id}" />
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