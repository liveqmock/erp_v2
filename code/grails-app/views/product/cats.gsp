<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>分类管理</title>
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
		</div>

		<div class="wrapper clearfix">
			<h2 class="search">分类管理</h2>
			<div class="pannel">
				<form id="add_box" class="jqtransform" action="${createLink(action: 'catsAdd')}" method="post">
					<fieldset>
						<legend><h3>添加分类</h3></legend>
						<p class="box clearfix">
							<label for="name">分类名称</label>
						</p>
						<p class="box clearfix">
							<input type="text" name="name" id="name" class="textfield" value="" />
						</p>
						<p class="box clearfix">
							<label for="description">分类描述</label>
						</p>
						<p class="box clearfix">
							<input type="text" name="description" id="description" class="textfield" value="" />
						</p>
						<p class="box clearfix">
							<input type="submit" class="button" value="添加新分类" />
						</p>
					</fieldset>
				</form>

				<div id="list_box" >
					<table class="table">
						<thead>
						<tr>
							<th>分类名称</th>
							<th>分类描述</th>
							<th>商品数量</th>
							<th>库存价值(南京/在途/奥克兰)</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<g:if test="${list}">
							<g:each in="${list}">
							<tr>
								<td>${it.name}</td>
								<td>${it.description}</td>
								<td>5</td>
								<td>&yen600(&yen200 / &yen200 / &yen200)</td>
								<td>
									<a href="#">查看</a>
									<span>|</span>
									<a href="${createLink(action: 'catsEdit', id: it.id)}">编辑</a>
								</td>
							</tr>
							</g:each>
						</g:if>
						<g:else>
							<tr><td colspan="5">无数据</td></tr>
						</g:else>
						</tbody>
					</table>
					<g:pagenavi total="${total}" />
				</div>
			</div>
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>