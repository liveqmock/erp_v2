<%@ page import="erp_v2.User" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
	<title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
	<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
	</span>
	<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
	                                                                       args="[entityName]"/></g:link></span>
	<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
	                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
<h1><g:message code="default.edit.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${userInstance}">
	<div class="errors">
		<g:renderErrors bean="${userInstance}" as="list"/>
	</div>
</g:hasErrors>
<g:form method="post">
<g:hiddenField name="id" value="${userInstance?.id}"/>
<g:hiddenField name="version" value="${userInstance?.version}"/>
<div class="dialog">
<table>
<tbody>

<tr class="prop">
	<td valign="top" class="name">
		<label for="loginName"><g:message code="user.loginName.label" default="Login Name"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'loginName', 'errors')}">
		<g:textField name="loginName" maxlength="32" value="${userInstance?.loginName}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="name"><g:message code="user.name.label" default="Name"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'name', 'errors')}">
		<g:textField name="name" maxlength="32" value="${userInstance?.name}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="password"><g:message code="user.password.label" default="Password"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
		<g:textField name="password" value="${userInstance?.password}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="regIp"><g:message code="user.regIp.label" default="Reg Ip"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'regIp', 'errors')}">
		<g:textField name="regIp" value="${userInstance?.regIp}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="lastIp"><g:message code="user.lastIp.label" default="Last Ip"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastIp', 'errors')}">
		<g:textField name="lastIp" value="${userInstance?.lastIp}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="timeCreate"><g:message code="user.timeCreate.label" default="Time Create"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'timeCreate', 'errors')}">
		<g:datePicker name="timeCreate" precision="day" value="${userInstance?.timeCreate}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="status"><g:message code="user.status.label" default="Status"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'status', 'errors')}">
		<g:select name="status" from="${userInstance.constraints.status.inList}" value="${userInstance?.status}"
		          valueMessagePrefix="user.status"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="accessToken"><g:message code="user.accessToken.label" default="Access Token"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accessToken', 'errors')}">
		<g:textField name="accessToken" value="${userInstance?.accessToken}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="email"><g:message code="user.email.label" default="Email"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
		<g:textField name="email" value="${userInstance?.email}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="isPrimaryTaobaoUser"><g:message code="user.isPrimaryTaobaoUser.label"
		                                            default="Is Primary Taobao User"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'isPrimaryTaobaoUser', 'errors')}">
		<g:checkBox name="isPrimaryTaobaoUser" value="${userInstance?.isPrimaryTaobaoUser}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="mobile"><g:message code="user.mobile.label" default="Mobile"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'mobile', 'errors')}">
		<g:textField name="mobile" value="${userInstance?.mobile}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="r1ExpiresIn"><g:message code="user.r1ExpiresIn.label" default="R1 Expires In"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'r1ExpiresIn', 'errors')}">
		<g:textField name="r1ExpiresIn" value="${fieldValue(bean: userInstance, field: 'r1ExpiresIn')}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="r2ExpiresIn"><g:message code="user.r2ExpiresIn.label" default="R2 Expires In"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'r2ExpiresIn', 'errors')}">
		<g:textField name="r2ExpiresIn" value="${fieldValue(bean: userInstance, field: 'r2ExpiresIn')}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="reExpiresIn"><g:message code="user.reExpiresIn.label" default="Re Expires In"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'reExpiresIn', 'errors')}">
		<g:textField name="reExpiresIn" value="${fieldValue(bean: userInstance, field: 'reExpiresIn')}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="realname"><g:message code="user.realname.label" default="Realname"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'realname', 'errors')}">
		<g:textField name="realname" value="${userInstance?.realname}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="refreshToken"><g:message code="user.refreshToken.label" default="Refresh Token"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'refreshToken', 'errors')}">
		<g:textField name="refreshToken" value="${userInstance?.refreshToken}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="taobaoBindIp"><g:message code="user.taobaoBindIp.label" default="Taobao Bind Ip"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'taobaoBindIp', 'errors')}">
		<g:textField name="taobaoBindIp" value="${userInstance?.taobaoBindIp}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="taobaoBindTime"><g:message code="user.taobaoBindTime.label" default="Taobao Bind Time"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'taobaoBindTime', 'errors')}">
		<g:datePicker name="taobaoBindTime" precision="day" value="${userInstance?.taobaoBindTime}" default="none"
		              noSelection="['': '']"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="taobaoUserId"><g:message code="user.taobaoUserId.label" default="Taobao User Id"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'taobaoUserId', 'errors')}">
		<g:textField name="taobaoUserId" value="${fieldValue(bean: userInstance, field: 'taobaoUserId')}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="taobaoUserNick"><g:message code="user.taobaoUserNick.label" default="Taobao User Nick"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'taobaoUserNick', 'errors')}">
		<g:textField name="taobaoUserNick" value="${userInstance?.taobaoUserNick}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="timeLogin"><g:message code="user.timeLogin.label" default="Time Login"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'timeLogin', 'errors')}">
		<g:datePicker name="timeLogin" precision="day" value="${userInstance?.timeLogin}" default="none"
		              noSelection="['': '']"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="timeUpdate"><g:message code="user.timeUpdate.label" default="Time Update"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'timeUpdate', 'errors')}">
		<g:datePicker name="timeUpdate" precision="day" value="${userInstance?.timeUpdate}" default="none"
		              noSelection="['': '']"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="tokenType"><g:message code="user.tokenType.label" default="Token Type"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'tokenType', 'errors')}">
		<g:textField name="tokenType" value="${userInstance?.tokenType}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="w1ExpiresIn"><g:message code="user.w1ExpiresIn.label" default="W1 Expires In"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'w1ExpiresIn', 'errors')}">
		<g:textField name="w1ExpiresIn" value="${fieldValue(bean: userInstance, field: 'w1ExpiresIn')}"/>
	</td>
</tr>

<tr class="prop">
	<td valign="top" class="name">
		<label for="w2ExpiresIn"><g:message code="user.w2ExpiresIn.label" default="W2 Expires In"/></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'w2ExpiresIn', 'errors')}">
		<g:textField name="w2ExpiresIn" value="${fieldValue(bean: userInstance, field: 'w2ExpiresIn')}"/>
	</td>
</tr>

</tbody>
</table>
</div>

<div class="buttons">
	<span class="button"><g:actionSubmit class="save" action="update"
	                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
	<span class="button"><g:actionSubmit class="delete" action="delete"
	                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
	                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
</div>
</g:form>
</div>
</body>
</html>
