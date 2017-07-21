<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>游戏和应用收益管理平台</title>
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/plugins/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/plugins/i/app-icon72x72@2x.png">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/amazeui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/admin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/app.css">
</head>

<body data-type="login">

<div class="am-g myapp-login">
	<div class="myapp-login-logo-block  tpl-login-max">
		<div class="myapp-login-logo-text">
			<div class="myapp-login-logo-text">
				<span> 游戏和应用收益管理平台</span> <i class="am-icon-skyatlas"></i>

			</div>
		</div>

		<div class="login-font ">

		</div>
		<div class="am-u-sm-10 login-am-center">
			<form class="am-form" action="${pageContext.request.contextPath}/login" method="post">
				<div class=""><span class="am-text-danger">${errorMessages}</span></div>
				<fieldset>

					<div class="am-form-group">
						<input type="text" class="" name="username" id="doc-ipt-email-1" placeholder="输入账号">
					</div>
					<div class="am-form-group">
						<input type="password" class="" name="password" id="doc-ipt-pwd-1" placeholder="输入密码">
					</div>
					<p><button type="submit" class="am-btn am-btn-default">登录</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript"  src="${pageContext.request.contextPath}/plugins/js/jquery.min.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/plugins/js/amazeui.min.js"></script>

</body>

</html>
