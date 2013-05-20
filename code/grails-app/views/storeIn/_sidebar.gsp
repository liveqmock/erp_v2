<%@ page contentType="text/html;charset=UTF-8" %>
<aside class="sidebar">
	<h2 class="favorites first">
		<span>常用链接</span>
	</h2>
	<ul>
		<li>
			<a href="${createLink(controller: 'product', action: 'index')}">商品列表</a>
		</li>
		<li>
			<a href="${createLink(controller: 'product', action: 'cats')}">分类目录</a>
		</li>
		<li>
			<a href="${createLink(controller: 'product', action: 'brands')}">商品品牌</a>
		</li>
	</ul>

	<g:render template="/layouts/sidebar_sufix" />
</aside>