<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>NOT FOUND 404</title>
	<meta http-equiv="refresh" content="5;url=${request.getHeader('Referer')?:createLink(controller: 'main')}">
	<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<![endif]-->
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" />
	<meta name='robots' content='noindex,nofollow' />
	<link rel='stylesheet' href='${resource(dir: 'css', file: 'common.css')}' type='text/css' media='all' />
	<link rel='stylesheet' href='${resource(dir: 'css', file: 'style.css')}' type='text/css' media='all' />
	<link rel='stylesheet' href='${resource(dir: 'css', file: 'signin.css')}' type='text/css' media='all' />
</head>
<body itemscope itemtype="http://schema.org/WebPage">
<div class="wrapper">
	<article class="loginbox clearfix">
		<H1>页面没有找到. 5秒后 <a href="${request.getHeader('Referer')?:createLink(controller: 'main')}">返回</a></H1>
	</article>
</div>
</body>
</html>