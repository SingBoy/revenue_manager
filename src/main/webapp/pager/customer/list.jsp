<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" uri="http://www.ibingo.net.cn/tags/pagination"%>
<%--
  Created by IntelliJ IDEA.
  User: lqj
  Date: 2017-07-13
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<div class="tpl-page-container">
    <div class="tpl-content-wrapper">
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-user">客户管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/user/customerlist">客户列表</a></li>
        </ol>
        <div class="tpl-portlet-components">
            <form action="${pageContext.request.contextPath}/user/customerlist" method="post" class="form-inline" role="form">
            <div class="portlet-title">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <input type="text" class="form-control form-control-solid" name="keyword" id="keyword"
                               value="${queryBean.keyword }" placeholder="搜索...">

                        <div class="am-btn-group am-btn-group-xs">
                            <button type="submit" class="am-btn am-btn-primary">
                                <span class="am-icon-search"></span>查询
                            </button>
                        </div>
                    </div>

                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <c:if test="${sessionScope.current_user.userRole ==1 }">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default am-btn-success" onclick="addButton()"><span
                                    class="am-icon-plus"></span> 新增
                            </button>
                            <button type="button" class="am-btn am-btn-default am-btn-danger" onclick="deleteButton(null)">
                                <span class="am-icon-trash-o"></span> 删除
                            </button>
                        </div>
                    </c:if>
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                    <tr>
                                        <th class="table-check"><input type="checkbox" id="checkboxTh" onclick="allCheck()"  class="tpl-table-fz-check"></th>
                                        <th class="table-title" width="20%">客户名称</th>
                                        <th class="table-type" width="20%">客户账号</th>
                                        <th class="table-type" width="10%">商务人员</th>
                                        <th class="table-date am-hide-sm-only" width="10%">创建日期</th>
                                        <th class="table-set" width="40%">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageDataList.pageRecords}" var="item">
                                        <tr>
                                            <td><input type="checkbox" name="checkboxInput" value="${item.id}"></td>
                                            <td>${item.nickname}</td>
                                            <td>${item.username}</td>
                                            <td>${item.businessName}</td>
                                            <td class="am-hide-sm-only"><fmt:formatDate value="${item.createDate}"
                                                                                        pattern="yyyy-MM-dd"/></td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <button type="button"
                                                                class="am-btn am-btn-default am-btn-xs am-text-secondary"
                                                                onclick="editButton(${item.id})"><span
                                                                class="am-icon-pencil-square-o"></span> 编辑
                                                        </button>
                                                        <c:if test="${sessionScope.current_user.userRole ==1 }">
                                                            <button type="button"
                                                                    class="am-btn am-btn-default am-btn-xs am-text-secondary"
                                                                    onclick="configButton(${item.id})"><span
                                                                    class="am-icon-tint"></span> 分配
                                                            </button>
                                                            <button type="button"
                                                                    class="am-btn am-btn-default am-btn-xs am-text-secondary"
                                                                    onclick="editPassWordDefault(${item.id})"><span
                                                                    class="am-icon-adjust"></span> 重置密码
                                                            </button>
                                                            <button type="button"
                                                                    class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
                                                                    onclick="deleteButton(${item.id})"><span
                                                                    class="am-icon-trash-o"></span> 删除
                                                            </button>
                                                         </c:if>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            <hr class="wide" />
                            <div class="footer">
                                <!-- 分页  -->
                                <c:url var="pageUrl" value="/user/customerlist">
                                    <c:param name="keyword" value="${queryBean.keyword}" />
                                </c:url>
                                <page:pagerNav modelRef="pageDataList" url="${pageUrl}" type="beyond" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="myModalConfig" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    X
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    客户分配
                </h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/user/setBusiness">
                <div class="modal-body">
                        <div class="am-form-group">
                            商务姓名：
                            <select id="businessId" name="businessId" class="multiselect" style="width: 210px;">
                                <option value="">姓名</option>
                               <c:forEach items="${businessUserList}" var="item">
                                    <option value="${item.id }" <%--<c:if test="${$("#selectId").val()= item.id}">selected="selected"</c:if>--%> >
                                            ${item.nickname }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                </div>
                <input type="text" class="hide" name="id" id="selectId"
                       value=""/>
                <input type="text" class="hide" name="keyword"
                       value="${queryBean.keyword }"/>
                <input type="text" class="hide" name="currentPage"
                       value="${queryBean.currentPage }"/>
                <input type="text" class="hide" name="pageSize"
                       value="${queryBean.pageSize }"/>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">确定</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">

    function addButton() {
        window.location = "${pageContext.request.contextPath}/user/doCustomerSave/?keyword="+$("#keyword").val()+"&currentPage=${queryBean.currentPage}&pageSize=${queryBean.pageSize}";
    }
    function editButton(id) {
        window.location = "${pageContext.request.contextPath}/user/doCustomerUpdate/" + id + "?keyword="+$("#keyword").val()+"&currentPage=${queryBean.currentPage}&pageSize=${queryBean.pageSize}";
    }

    function editPassWordDefault(id) {
        if (confirm("你确认要重置该客户的密码吗？")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/editPassWordDefault",
                data:{id:id},
                type:"POST",
                success:function(data){
                    if(data=="success"){
                        alert("密码重置成功")
                    }else{
                        alert("密码重置失败")
                    }
                }
            })
        }
    }
    function allCheck(){
        var flgBox = $("#checkboxTh").is(":checked");
        $("input[name='checkboxInput']").prop("checked", flgBox);
    }

    function deleteButton(id) {
        //id==null时，表示删除多条数据
        if (id == null) {
            var ids = new Array();
            $.each($('input:checkbox:checked'), function () {
                ids.push($(this).val());
            });
            if (ids != null) {
                if (confirm("你确认要删除选中的数据吗？")) {
                    window.location = "${pageContext.request.contextPath}/user/deleteCustomer/?ids=" + ids + "&keyword=" + $("#keyword").val() + "&currentPage="+${queryBean.currentPage}+
                    "&pageSize=" +${queryBean.pageSize};
                }
            } else {
                alert("请选择要删除的数据!");
            }

        } else {
            if (confirm("你确认要删除吗？")) {
                window.location = "${pageContext.request.contextPath}/user/deleteCustomer/?ids=" + id + "&keyword=" + $("#keyword").val() + "&currentPage="+${queryBean.currentPage}+
                "&pageSize=" +${queryBean.pageSize};
            }
        }
    }
    function configButton(id) {
        $('#myModalConfig').modal('show').css({
            width: '100%',
        });
        $('#selectId').val(id);
        $('.modal').css({'overflow-x': 'scroll'});
    }

</script>
</body>
</html>
