<%@ page contentType="text/html;charset=UTF-8" %>
<aside class="sidebar">
	<h2 class="favorites first">
		<span>订单管理</span>
	</h2>
	<ul>
		<li class="${actionName=='create'?'current':''}">
			<a href="${createLink(action: 'create')}">新增订单</a>
		</li>
		<li class="${actionName=='review'?'current':''}">
			<a href="${createLink(action: 'review')}">订单审核</a>
		</li>
		<li class="${actionName=='sout'?'current':''}">
			<a href="${createLink(action: 'sout')}">打单配货</a>
		</li>
		<li class="${actionName=='send'?'current':''}">
			<a href="${createLink(action: 'send')}">确认发货</a>
		</li>
		<li class="${actionName=='index'?'current':''}">
			<a href="${createLink(action: 'index')}">历史订单</a>
		</li>
	</ul>

	<g:render template="/layouts/sidebar_sufix" />
</aside>