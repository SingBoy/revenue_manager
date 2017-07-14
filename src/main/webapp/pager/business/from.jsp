<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>

</head>

<body data-type="generalComponents">



<div class="tpl-page-container">

    <div class="tpl-content-wrapper">

        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">商务管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/user/businesslist">商务列表</a></li>
            <li class="am-active">${user.id==null ?"新增商务":"修改商务"}</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">


                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/user/saveBusiness" method="post">
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">账号</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-name" name="username" placeholder="输入账号" onblur="checkUserName()">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="nick-name" class="am-u-sm-3 am-form-label">姓名</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="nick-name" name="nickname" placeholder="输入姓名">
                                </div>
                            </div>
                            <%--
                                                        <div class="am-form-group">
                                                            <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
                                                            <div class="am-u-sm-9">
                                                                <input type="tel" id="user-phone" placeholder="输入你的电话号码 / Telephone">
                                                            </div>
                                                        </div>

                                                        <div class="am-form-group">
                                                            <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
                                                            <div class="am-u-sm-9">
                                                                <input type="number" pattern="[0-9]*" id="user-QQ" placeholder="输入你的QQ号码">
                                                            </div>
                                                        </div>

                                                        <div class="am-form-group">
                                                            <label for="user-weibo" class="am-u-sm-3 am-form-label">微博 / Twitter</label>
                                                            <div class="am-u-sm-9">
                                                                <input type="text" id="user-weibo" placeholder="输入你的微博 / Twitter">
                                                            </div>
                                                        </div>

                                                        <div class="am-form-group">
                                                            <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
                                                            <div class="am-u-sm-9">
                                                                <textarea class="" rows="5" id="user-intro" placeholder="输入个人简介"></textarea>
                                                                <small>250字以内写出你的一生...</small>
                                                            </div>
                                                        </div>--%>

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

</body>

</html>