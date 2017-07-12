<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>" />
	<meta charset="utf-8" />
    <title>品酷资源投放策略管理平台</title>

    <meta name="description" content="Error 404 - Page Not Found" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%--     <link rel="shortcut icon" href="${pageContext.request.contextPath}/plugins/img/favicon.png" type="image/x-icon"> --%>

    <!--Basic Styles-->
    <link href="${pageContext.request.contextPath}/plugins/beyond/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/beyond/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/beyond/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
<!--     <link href="http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css"> -->

    <!--Beyond styles-->
    <link id="beyond-link" href="${pageContext.request.contextPath}/plugins/beyond/css/beyond.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/beyond/css/demo.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/beyond/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="${pageContext.request.contextPath}/plugins/beyond/js/skins.min.js"></script>
</head>
<body class="body-404">
	<div class="error-header"> </div>
    <div class="container ">
        <section class="error-container text-center">
            <h1>404</h1>
            <div class="error-divider">
                <h2>&nbsp;</h2>
                <p class="description">暂无权限，请联系系统管理员</p>
            </div>
            <a href="javascript:history.back();" class="return-btn"><i class="fa fa-home"></i>返回</a>
        </section>
    </div>
    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/plugins/beyond/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/beyond/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="${pageContext.request.contextPath}/plugins/beyond/js/beyond.min.js"></script>

</body>
</html>