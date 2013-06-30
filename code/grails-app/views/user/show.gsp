
<%@ page import="erp_v2.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.loginName.label" default="Login Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "loginName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.regIp.label" default="Reg Ip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "regIp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.lastIp.label" default="Last Ip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "lastIp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.timeCreate.label" default="Time Create" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.timeCreate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.accessToken.label" default="Access Token" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "accessToken")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.isPrimaryTaobaoUser.label" default="Is Primary Taobao User" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.isPrimaryTaobaoUser}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.mobile.label" default="Mobile" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "mobile")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.r1ExpiresIn.label" default="R1 Expires In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "r1ExpiresIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.r2ExpiresIn.label" default="R2 Expires In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "r2ExpiresIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.reExpiresIn.label" default="Re Expires In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "reExpiresIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.realname.label" default="Realname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "realname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.refreshToken.label" default="Refresh Token" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "refreshToken")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.taobaoBindIp.label" default="Taobao Bind Ip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "taobaoBindIp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.taobaoBindTime.label" default="Taobao Bind Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.taobaoBindTime}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.taobaoUserId.label" default="Taobao User Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "taobaoUserId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.taobaoUserNick.label" default="Taobao User Nick" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "taobaoUserNick")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.timeLogin.label" default="Time Login" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.timeLogin}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.timeUpdate.label" default="Time Update" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${userInstance?.timeUpdate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.tokenType.label" default="Token Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "tokenType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.w1ExpiresIn.label" default="W1 Expires In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "w1ExpiresIn")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.w2ExpiresIn.label" default="W2 Expires In" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "w2ExpiresIn")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
