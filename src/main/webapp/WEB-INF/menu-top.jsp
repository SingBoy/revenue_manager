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
            <img src="${pageContext.request.contextPath}/plugins/img/logo.png" alt="">
        </a>
    </div>
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
            <%--<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="am-icon-bell-o"></span> 提醒 <span class="am-badge tpl-badge-success am-round">5</span></span>
                </a>
                <ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="tpl-dropdown-content-external">
                        <h3>你有 <span class="tpl-color-success">5</span> 条提醒</h3><a href="###">全部</a></li>
                    <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-plus tpl-dropdown-ico-btn-size tpl-badge-success"></span> 【预览模块】移动端 查看时 手机、电脑框隐藏。</a>
                        <span class="tpl-dropdown-list-fr">3小时前</span>
                    </li>
                    <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-check tpl-dropdown-ico-btn-size tpl-badge-danger"></span> 移动端，导航条下边距处理</a>
                        <span class="tpl-dropdown-list-fr">15分钟前</span>
                    </li>
                    <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-warning"></span> 追加统计代码</a>
                        <span class="tpl-dropdown-list-fr">2天前</span>
                    </li>
                </ul>
            </li>
            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="am-icon-comment-o"></span> 消息 <span class="am-badge tpl-badge-danger am-round">9</span></span>
                </a>
                <ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="tpl-dropdown-content-external">
                        <h3>你有 <span class="tpl-color-danger">9</span> 条新消息</h3><a href="###">全部</a></li>
                    <li>
                        <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="${pageContext.request.contextPath}/plugins/img/user02.png" alt=""> </span>
                            <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> 禁言小张 </span>
                                <span class="tpl-dropdown-content-time">10分钟前 </span>
                                </span>
                            <span class="tpl-dropdown-content-font"> Amaze UI 的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </span>
                        </a>
                        <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="${pageContext.request.contextPath}/plugins/img/user03.png" alt=""> </span>
                            <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> Steam </span>
                                <span class="tpl-dropdown-content-time">18分钟前</span>
                                </span>
                            <span class="tpl-dropdown-content-font"> 为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。 </span>
                        </a>
                    </li>

                </ul>
            </li>
            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="am-icon-calendar"></span> 进度 <span class="am-badge tpl-badge-primary am-round">4</span></span>
                </a>
                <ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="tpl-dropdown-content-external">
                        <h3>你有 <span class="tpl-color-primary">4</span> 个任务进度</h3><a href="###">全部</a></li>
                    <li>
                        <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">Amaze UI 用户中心 v1.2 </span>
                                <span class="percent">45%</span>
                                </span>
                            <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-success" style="width:45%"></div></div>
                    </span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">新闻内容页 </span>
                                <span class="percent">30%</span>
                                </span>
                            <span class="progress">
                       <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-secondary" style="width:30%"></div></div>
                    </span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">管理中心 </span>
                                <span class="percent">60%</span>
                                </span>
                            <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-warning" style="width:60%"></div></div>
                    </span>
                        </a>
                    </li>

                </ul>
            </li>--%>
            <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                <%--<span class="tpl-header-list-user-nick">禁言小张</span>--%><span class="tpl-header-list-user-ico"> <img src="${pageContext.request.contextPath}/plugins/img/user01.png"></span>
            </a>
                <ul class="am-dropdown-content">
                    <li><a href="#"><span class="am-icon-bell-o"></span> 资料</a></li>
                    <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                    <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li><a href="###" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
        </ul>
    </div>
</header>




<%--
                         <i class="am-icon-glass"></i>
                         <i class="am-icon-music"></i>
                         <i class="am-icon-search"></i>
                         <i class="am-icon-envelope-o"></i>
                         <i class="am-icon-heart"></i>
                         <i class="am-icon-star"></i>
                         <i class="am-icon-star-o"></i>
                         <i class="am-icon-user"></i>
                         <i class="am-icon-film"></i>
                         <i class="am-icon-th-large"></i>
                         <i class="am-icon-th"></i>
                         <i class="am-icon-th-list"></i>
                         <i class="am-icon-check"></i>
                         <i class="am-icon-close"></i>
                         <i class="am-icon-search-plus"></i>
                         <i class="am-icon-search-minus"></i>
                         <i class="am-icon-power-off"></i>
                         <i class="am-icon-signal"></i>
                         <i class="am-icon-cog"></i>
                         <i class="am-icon-trash-o"></i>
                         <i class="am-icon-home"></i>
                         <i class="am-icon-file-o"></i>
                         <i class="am-icon-clock-o"></i>
                         <i class="am-icon-road"></i>
                         <i class="am-icon-download"></i>
                         <i class="am-icon-arrow-circle-o-down"></i>
                         <i class="am-icon-arrow-circle-o-up"></i>
                         <i class="am-icon-inbox"></i>
                         <i class="am-icon-play-circle-o"></i>
                         <i class="am-icon-repeat"></i>
                         <i class="am-icon-refresh"></i>
                         <i class="am-icon-list-alt"></i>
                         <i class="am-icon-lock"></i>
                         <i class="am-icon-flag"></i>
                         <i class="am-icon-headphones"></i>
                         <i class="am-icon-volume-off"></i>
                         <i class="am-icon-volume-down"></i>
                         <i class="am-icon-volume-up"></i>
                         <i class="am-icon-qrcode"></i>
                         <i class="am-icon-barcode"></i>
                         <i class="am-icon-tag"></i>
                         <i class="am-icon-tags"></i>
                         <i class="am-icon-book"></i>
                         <i class="am-icon-bookmark"></i>
                         <i class="am-icon-print"></i>
                         <i class="am-icon-camera"></i>
                         <i class="am-icon-font"></i>
                         <i class="am-icon-bold"></i>
                         <i class="am-icon-italic"></i>
                         <i class="am-icon-text-height"></i>
                         <i class="am-icon-text-width"></i>
                         <i class="am-icon-align-left"></i>
                         <i class="am-icon-align-center"></i>
                         <i class="am-icon-align-right"></i>
                         <i class="am-icon-align-justify"></i>
                         <i class="am-icon-list"></i>
--%>

<%--左侧菜单信息--%>
<div class="tpl-page-container tpl-page-header-fixed">
    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="${pageContext.request.contextPath}/welcome/index" class="nav-link active">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>
                </li>

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
            </ul>


        </div>
    </div>
</div>


<div class="page-content">
    <sitemesh:write property="body" />
</div>
<%--<jsp:include page="/welcome/index" />--%>

<script src="${pageContext.request.contextPath}/plugins/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/js/app.js"></script>
</body>
<script>
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

</script>
</html>