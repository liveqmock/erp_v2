<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>采购管理</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jqtransform.css')}" type="text/css" media="all" />
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
			<h2 class="search">${instance.id?'更新':'创建'}供应商</h2>
			<div class="pannel">
				<form action="${createLink(action:'providerSave')}" class="jqtransform" method="post">
					<g:if test="${flash.message}">
						<div class="message">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${instance}">
						<div class="errors">
							<g:renderErrors bean="${instance}" as="list" />
						</div>
					</g:hasErrors>
					<table class="layout">
						<tbody>
						<tr>
							<th>
								<label for="name">供应商名称：</label>
							</th>
							<td>
								<input type="text" name="name" id="name" value="${instance.name}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="addr">供应商地址：</label>
							</th>
							<td>
								<input type="text" name="addr" id="addr" value="${instance.addr}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="webSite">网站：</label>
							</th>
							<td>
								<input type="text" name="webSite" id="webSite" value="${instance.webSite}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="taxNo">税号：</label>
							</th>
							<td>
								<input type="text" name="taxNo" id="taxNo" value="${instance.taxNo}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="accountNo1">收款账号1：</label>
							</th>
							<td>
								<input type="text" name="accountNo1" id="accountNo1" value="${instance.accountNo1}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="accountNo2">收款账号2：</label>
							</th>
							<td>
								<input type="text" name="accountNo2" id="accountNo2" value="${instance.accountNo2}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="contacts">联系人：</label>
							</th>
							<td>
								<input type="text" name="contacts" id="contacts" value="${instance.contacts}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="contactsMobile">联系手机：</label>
							</th>
							<td>
								<input type="text" name="contactsMobile" id="contactsMobile" value="${instance.contactsMobile}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="contactsTel">联系电话：</label>
							</th>
							<td>
								<input type="text" name="contactsTel" id="contactsTel" value="${instance.contactsTel}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="fax">传真：</label>
							</th>
							<td>
								<input type="text" name="fax" id="fax" value="${instance.fax}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="email">电子邮箱：</label>
							</th>
							<td>
								<input type="text" name="email" id="email" value="${instance.email}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="wangwang">旺旺：</label>
							</th>
							<td>
								<input type="text" name="wangwang" id="wangwang" value="${instance.wangwang}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="qq">QQ：</label>
							</th>
							<td>
								<input type="text" name="qq" id="qq" value="${instance.qq}" />
							</td>
						</tr>
						<tr>
							<th>
								<label for="remark">备注：</label>
							</th>
							<td>
								<textarea name="remark" id="remark" cols="30" rows="10">${instance.remark}</textarea>
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<input type="submit" value="提交" />
								<g:hiddenField name="id" value="${instance.id}"/>
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