<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>采购管理</title>
</head>
<body>
<div class="main" role="main">
	<div class="inner">
		<div class="title">
			<a href="${createLink(controller: 'main')}">爱自然进销存管理系统</a>
			<span>&gt;</span>
			<a href="${createLink(action: 'index')}">采购管理</a>
			<span>&gt;</span>
			<a>创建供应商</a>
		</div>
		<div class="wrapper">
			<h2 class="search">供应商 ${instance.name} 详情</h2>
			<div class="pannel">
				<table class="layout">
					<tbody>
					<tr>
						<th>
							<label for="name">供应商名称：</label>
						</th>
						<td>
							${instance.name}
						</td>
					</tr>
					<tr>
						<th>
							<label for="addr">供应商地址：</label>
						</th>
						<td>
							${instance.addr}
						</td>
					</tr>
					<tr>
						<th>
							<label for="webSite">网站：</label>
						</th>
						<td>
							${instance.webSite}
						</td>
					</tr>
					<tr>
						<th>
							<label for="taxNo">税号：</label>
						</th>
						<td>
							${instance.taxNo}
						</td>
					</tr>
					<tr>
						<th>
							<label for="accountNo1">收款账号1：</label>
						</th>
						<td>
							${instance.accountNo1}
						</td>
					</tr>
					<tr>
						<th>
							<label for="accountNo2">收款账号2：</label>
						</th>
						<td>
							${instance.accountNo2}
						</td>
					</tr>
					<tr>
						<th>
							<label for="contacts">联系人：</label>
						</th>
						<td>
							${instance.contacts}
						</td>
					</tr>
					<tr>
						<th>
							<label for="contactsMobile">联系手机：</label>
						</th>
						<td>
							${instance.contactsMobile}
						</td>
					</tr>
					<tr>
						<th>
							<label for="contactsTel">联系电话：</label>
						</th>
						<td>
							${instance.contactsTel}
						</td>
					</tr>
					<tr>
						<th>
							<label for="fax">传真：</label>
						</th>
						<td>
							${instance.fax}
						</td>
					</tr>
					<tr>
						<th>
							<label for="email">电子邮箱：</label>
						</th>
						<td>
							${instance.email}
						</td>
					</tr>
					<tr>
						<th>
							<label for="wangwang">旺旺：</label>
						</th>
						<td>
							${instance.wangwang}
						</td>
					</tr>
					<tr>
						<th>
							<label for="qq">QQ：</label>
						</th>
						<td>
							${instance.qq}
						</td>
					</tr>
					<tr>
						<th>
							<label for="remark">备注：</label>
						</th>
						<td>
							${instance.remark}
						</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<input type="submit" value="提交" />
							${instance.id}
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<g:render template="sidebar" />
</body>
</html>