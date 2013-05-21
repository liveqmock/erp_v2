<%@ page contentType="text/html;charset=UTF-8" %>
<aside class="sidebar">
	<h2 class="favorites first">
		<span>采购管理</span>
	</h2>
	<ul>
		<li class="${actionName=='provider'?'current':''}">
			<a href="${createLink(action: 'provider')}">供应商列表</a>
		</li>
		<li class="${actionName=='providerCreate'?'current':''}">
			<a href="${createLink(action: 'providerCreate')}">创建供应商</a>
		</li>
		<li class="${actionName=='storeInCreate'?'current':''}">
			<a href="${createLink(action: 'storeInCreate')}">创建采购订单</a>
		</li>
		<li class="${actionName=='index'?'current':''}">
			<a href="${createLink(action: 'index')}">采购列表</a>
		</li>
	</ul>

	<g:render template="/layouts/sidebar_sufix" />
</aside>