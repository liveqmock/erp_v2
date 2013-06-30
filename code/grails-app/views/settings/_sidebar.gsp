<%@ page contentType="text/html;charset=UTF-8" %>
<aside class="sidebar">
	<h2 class="favorites first">
		<span>系统设置</span>
	</h2>
	<ul>
		<li>
			<a href="${createLink(controller: 'user', action: 'list')}">用户列表</a>
		</li>
		<li>
			<a href="${createLink(controller: 'user', action: 'create')}">创建用户</a>
		</li>
		<li>
			<a href="${createLink(controller: 'taobaoTask', action: 'index')}">淘宝异步任务</a>
		</li>
	</ul>
	<g:render template="/layouts/sidebar_sufix" />
</aside>