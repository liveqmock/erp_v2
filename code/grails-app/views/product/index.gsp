<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>产品管理</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jqtransform.css')}" type="text/css" media="all" />
</head>
<body>
<div class="main" role="main">
	<div class="inner">
		<div class="title">
			<a href="${createLink(controller: 'main')}">爱自然进销存管理系统</a>
			<span>&gt;</span>
			<a>产品管理</a>
		</div>

		<div class="wrapper">
			<h2 class="search">商品列表</h2>
			<div class="pannel">
				<form id="searchbox" class="jqtransform" action="#">
					<fieldset>
						<legend>商品搜索</legend>
						<p class="clearfix">
							<select name="category" id="category">
								<option value="0">请选择分类</option>
							</select>
							<select name="brand" id="brand">
								<option value="0">请选择品牌</option>
							</select>
							<input type="text" name="s" id="keywords" class="textfield" value="" />
							<input type="submit" class="button" value="搜索" />
						</p>
					</fieldset>
				</form>
			</div>
			<table class="table">
				<thead>
				<tr>
					<th>主图</th>
					<th>商品编码</th>
					<th>商品名称</th>
					<th>淘宝售价</th>
					<th>库存成本<span title="库存成本(南京|奥克兰)">?</span></th>
					<th>库存数量<span title="库存数量(南京|在途|奥克兰)">?</span></th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				<tr>
					<td>
						<img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1LBiwXhXnXXaUh5gU_014846.jpg_24x24.jpg" alt="" />
					</td>
					<td>EY012</td>
					<td><a href="#">Antipodes</a> / 有机青柠广藿香 洁面乳 200ml</td>
					<td>&yen;200.00</td>
					<td>&yen;180.00/&yen;150.00</td>
					<td>30/40/20</td>
					<td>
						<a href="product-edit.html">修改</a>
						<span>|</span>
						<a href="#">查看</a>
					</td>
				</tr>
				</tbody>
			</table>
			<div class='wp-pagenavi'>
				<span class='pages'>共有<strong>8</strong>页数据，当前第<strong>1</strong>页</span>
				<span class='current'>1</span>
				<a href='#' class='page larger'>2</a>
				<a href='#' class='page larger'>3</a>
				<a href='#' class='page larger'>4</a>
				<a href='#' class='page larger'>5</a>
				<span class='extend'>...</span>
				<a href='#' class='nextpostslink'>下一页</a>
				<a href='#' class='last'>尾页</a>
			</div>
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>