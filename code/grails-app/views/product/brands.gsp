<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>商品品牌</title>
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
		</div>

		<div class="wrapper clearfix">
			<h2 class="search">品牌管理</h2>
			<div class="pannel">
				<div class="clearfix" style="width:100%;">
					<div id="add_box">
						<form class="jqtransform" action="${createLink(action: 'brandsAdd')}" method="post">
							<fieldset>
								<legend><h3>添加品牌</h3></legend>
								<div class="clearfix box">
									<label for="name">品牌名称</label>
								</div>
								<div class="clearfix box">
									<input type="text" name="name" id="name" class="textfield" value="" />
								</div>
								<div>
									<label for="logo">品牌LOGO</label>
								</div>
								<div class="clearfix box">
									<input type="file" name="logo" id="logo" />
								</div>
								<div class="clearfix box">
									<input type="submit" class="button" value="添加新品牌" />
								</div>
							</fieldset>
						</form>
					</div>

					<div id="list_box" >
						<table class="table">
							<thead>
							<tr>
								<th>品牌名称</th>
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
									<td>5</td>
									<td>&yen600(&yen200 / &yen200 / &yen200)</td>
									<td>
										<a href="#">查看</a>
										<span>|</span>
										<a href="${createLink(action: 'brandsEdit', id: it.id)}">编辑</a>
									</td>
								</tr>
								</g:each>
							</g:if>
							<g:else>
								<tr><td colspan="4">无数据</td></tr>
							</g:else>
							</tbody>
						</table>
						<g:pagenavi total="${total}" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>