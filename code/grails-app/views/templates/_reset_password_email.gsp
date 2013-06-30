<%@ page contentType="text/html;charset=UTF-8" %>
<div class="erp_email_wrap">
	<p>
		尊敬的 ${user.realname?:user.loginName}, 您好, 您的密码已被重置!
	</p>
	<p>
		<a href="${createLink(controller: 'active', action: '', params: [code: user.resetActiveCode, uid: user.id], absolute: true)}">请点击链接</a>重新激活并设置您的密码!
		如果您的邮箱无法点击链接. 请复制下面的URL: <br>
		${createLink(controller: 'active', action: '', params: [code: user.resetActiveCode, uid: user.id], absolute: true)}
	</p>
	<p>重置链接24小时内有效.</p>
</div>