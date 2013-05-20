<%@ page contentType="text/html;charset=UTF-8" %>
<aside class="sidebar">
	<h2 class="favorites first">
		<span>商品管理</span>
	</h2>
	<ul>
		<li class="${actionName=='index'?'current':''}">
			<a href="${createLink(action: 'index')}">商品列表</a>
		</li>
		<li class="${actionName=='cats'?'current':''}">
			<a href="${createLink(action: 'cats')}">分类目录</a>
		</li>
		<li class="${actionName=='brands'?'current':''}">
			<a href="${createLink(action: 'brands')}">商品品牌</a>
		</li>
	</ul>

	<g:render template="/layouts/sidebar_sufix" />
</aside>