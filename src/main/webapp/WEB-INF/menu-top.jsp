<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>游戏和应用收益管理平台</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/plugins/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/plugins/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/css/app.css">
    <%-- <sitemesh:write property="head" />--%>
</head>

<body data-type="generalComponents">

<%--top头信息--%>
<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <a href="javascript:;" class="tpl-logo">
            <img src="${pageContext.request.contextPath}/plugins/img/logo3.png" alt="">
        </a>
    </div>
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
              <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
              <%--<li class="am-hide-sm-only">
                  <a href="javascript:;" class="tpl-header-list-link">
                    <span class="profile tpl-header-list-user-nick"><span>&nbsp;欢迎您，${sessionScope.current_user.nickname }&nbsp;</span></span>
                 </a>
              </li>--%>
            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="profile tpl-header-list-user-nick"><span>&nbsp;欢迎您，${sessionScope.current_user.nickname }&nbsp;</span></span>
                    <li class="am-hide-sm-only"><a href="javascript:;" type="button" onclick="editPasswordDialog()"  id="admin-editpass" class="tpl-header-list-link"><span class="am-icon-cog"></span> <span class="admin-fullText"> 修改密码</span></a></li>
                    <li class="am-hide-sm-only"><a href="javascript:;" onclick="logout()"  id="admin-logout" class="tpl-header-list-link"><span class="am-icon-power-off"></span> <span class="admin-fullText">退出</span></a></li>
                </a>
                <%--<ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="am-hide-sm-only"><a href="javascript:;" type="button" onclick="editPasswordDialog()"  id="admin-editpass" class="tpl-header-list-link"><span class="am-icon-cog"></span> <span class="admin-fullText"> 修改密码</span></a></li>
                    <li class="am-hide-sm-only"><a href="javascript:;" onclick="logout()"  id="admin-logout" class="tpl-header-list-link"><span class="am-icon-power-off"></span> <span class="admin-fullText">退出</span></a></li>
                </ul>--%>
            </li>
        </ul>
    </div>
</header>




<%--左侧菜单信息--%>
<div class="tpl-page-container tpl-page-header-fixed">
    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <%--<li class="tpl-left-nav-item">
                    <a href="${pageContext.request.contextPath}/welcome/index" class="nav-link active">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>
                </li>--%>

                <li class="tpl-left-nav-item">
                    <a href="javascript:;"  class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-align-justify"></i>
                        <span>数据管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" >
                        <li>
                            <!-- 打开状态 a 标签添加 active 即可   -->
                            <a href="${pageContext.request.contextPath}/revenue/list" >
                                <i class="am-icon-angle-right"></i>
                                <span>数据列表</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <c:if test="${sessionScope.current_user.userRole ==1 }">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:;"  class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-user"></i>
                            <span>客户管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <!-- 打开状态 a 标签添加 active 即可   -->
                                <a href="${pageContext.request.contextPath}/user/customerlist" >
                                    <i class="am-icon-angle-right"></i>
                                    <span>客户列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="tpl-left-nav-item">
                        <!-- 打开状态 a 标签添加 active 即可   -->
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-bookmark"></i>
                            <span>商务管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu" >
                            <li>
                                <!-- 打开状态 a 标签添加 active 即可   -->
                                <a href="${pageContext.request.contextPath}/user/businesslist" class="active">
                                    <i class="am-icon-angle-right"></i>
                                    <span>商务列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>


        </div>
    </div>
</div>

<div class="modal fade" id="myModalEditPass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    X
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改密码
                </h4>
            </div>
            <div class="am-g tpl-amazeui-form">
            <div class="am-u-sm-12 am-u-md-12">
                    <form class="am-form am-form-horizontal" id="formPass"
                          action="${pageContext.request.contextPath}/updatePassword" method="post">
                        <div class="modal-body">
                            <div class="am-form-group">
                                <label  class="am-u-sm-3 am-form-label">账号</label>
                                <div class="am-u-sm-9">
                                    <span type="text" >${sessionScope.current_user.nickname}</span>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="password" class="am-u-sm-3 am-form-label">密码</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="password" name="password" >
                                    <label id="firstpass"></label>
                                </div>
                             </div>
                            <div class="am-form-group">
                                <label for="pwdAgain" class="am-u-sm-3 am-form-label">重复密码</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="pwdAgain" name="pwdAgain" >
                                    <label id="secendpass"></label>
                                    <label id="thirdpass"></label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">确定</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="page-content">
    <sitemesh:write property="body" />
</div>
<%--<jsp:include page="/welcome/index" />--%>

<script src="${pageContext.request.contextPath}/plugins/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/js/app.js"></script>
<script>
    $(document).ready(function(){
        $("#formPass").bind("submit", function(){
            var password = $.trim($("#password").val())
            var pwdAgain = $.trim($("#pwdAgain").val())
            var isSuccess = 1;
            if(password.length == 0||password ==""){
                $("#firstpass").text("密码不能为空！")
                $("#firstpass").css({"color":"red"});
                isSuccess = 0;
            }else{
                $("#firstpass").text("")
            }
            if(pwdAgain.length == 0||pwdAgain==""){
                $("#secendpass").text("重复密码不能为空！")
                $("#secendpass").css({"color":"red"});
                isSuccess = 0;
            }else{
                $("#secendpass").text("")
            }
            if(password!=""&&pwdAgain!=""&&password != pwdAgain)
            {
                $("#thirdpass").text("两次密码输入不一致！")
                $("#thirdpass").css({"color":"red"});
                isSuccess = 0;
            }else{
                $("#thirdpass").text("")
            }

            if(isSuccess == 0)
            {
                return false;
            }
        })
    })
    function logout(){
        window.location="${pageContext.request.contextPath}/logout";
    }
    $('.tpl-left-nav-link-list').on('click', function() {
        $(this).siblings('.tpl-left-nav-sub-menu').slideToggle(80)
            .end()
            .find('.tpl-left-nav-more-ico').toggleClass('tpl-left-nav-more-ico-rotate');
        $(this).next().find('.tpl-left-nav-more-ico').attr("class","active");

    })
    // ==========================
    // 头部导航隐藏菜单
    // ==========================

    $('.tpl-header-nav-hover-ico').on('click', function() {
        $('.tpl-left-nav').toggle();
        $('.tpl-content-wrapper').toggleClass('tpl-content-wrapper-hover');
    });

    function editPasswordDialog(){
        $('#myModalEditPass').modal('show').css({
            width: '100%',
        });
        $('.modal').css({'overflow-x':'scroll'});
    }

</script>
</body>

</html>