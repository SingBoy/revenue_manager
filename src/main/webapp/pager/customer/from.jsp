<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>

</head>

<body data-type="generalComponents">


<div class="tpl-page-container">
    <div class="tpl-content-wrapper">
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">客户管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/user/customerlist">客户列表</a></li>
            <li class="am-active">${user.id==null ?"新增客户":"修改客户"}</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">
                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal"  id="formUser"  onsubmit="return checkInfo(this);"
                              action="${pageContext.request.contextPath}/user/saveCustomer" method="post">
                            <input type="hidden" name="id" id="id" value="${user.id}">
                            <input type="hidden" name="keyword" id="keyword" value="${queryBean.keyword}">
                            <input type="hidden" name="currentPage" id="currentPage" value="${queryBean.currentPage}">
                            <input type="hidden" name="pageSize" id="pageSize" value="${queryBean.pageSize}">
                            <div class="am-form-group">
                                <label for="username" class="am-u-sm-3 am-form-label">账号</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="username" name="username" placeholder="输入账号"
                                           value="${user.username}" onblur="checkUserName()">
                                    <label id="usernameError"></label>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="nickname" class="am-u-sm-3 am-form-label">名称</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="nickname" name="nickname" value="${user.nickname}"
                                           placeholder="输入名称">
                                    <label id="nicknameError"></label>
                                </div>
                            </div>
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
<script>
    function checkInfo(channelform) {
        var username = channelform.username.value;
        var flg = true;
        if(username==null||username==""){
            $("#usernameError").text("请输入账号！")
            $("#usernameError").css({"color":"red"});
            flg = false;
        }else{
            $("#usernameError").text("");
            flg = true;
        }
        var nickname = channelform.nickname.value;
        if(nickname==null||nickname==""){
            $("#nicknameError").text("请输入名称！")
            $("#nicknameError").css({"color":"red"});
            flg = false;
        }else{
            $("#nicknameError").text("");
            flg = true;
        }
        return flg;
    }
    function checkUserName() {
       var username = $("#username").val();
       if(username !=null &&username!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkUserName",
                data:{username:username,userRole:3},
                type:"POST",
                success:function (data) {
                    if(data=="success"){
                        $("#usernameError").text("")
                    }else{
                        $("#username").val("")
                        $("#usernameError").text("账户已存在,请更换一个！")
                        $("#usernameError").css({"color":"red"});
                    }
                }
            })
       }
    }
    
</script>
</body>

</html>