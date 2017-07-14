<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <%--<div class="tpl-content-page-title">
        Amaze UI 文字列表
    </div>--%>
    <ol class="am-breadcrumb">
        <li><a href="#" class="am-icon-home">客户管理</a></li>
       <li class="active"><a href="${pageContext.request.contextPath}/user/customerlist">客户列表</a></li>
    </ol>
    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <%--<div class="caption font-green bold">


            </div>--%>
        <div class="portlet-input input-small input-inline">
            <div class="input-icon right">
                <i class="am-icon-search"></i>
                <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default am-btn-success" onclick="addButton()"><span class="am-icon-plus"></span> 新增</button>
                    <button type="button" class="am-btn am-btn-default am-btn-danger" onclick="deleteButton(null)"><span class="am-icon-trash-o"></span> 删除</button>
                </div>
                <%--<div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                    </div>
                </div>--%>


        </div>
        <div class="tpl-block">
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-check"><input type="checkbox" name="checkbox" class="tpl-table-fz-check"></th>
                                <th class="table-title" width="30%">客户名称</th>
                                <th class="table-type" width="25%">客户账号</th>
                                <th class="table-date am-hide-sm-only" width="15%">创建日期</th>
                                <th class="table-set" width="">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pageDataList.pageRecords}" var="item">
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>${item.nickname}</td>
                                        <td>${item.username}</td>
                                        <td class="am-hide-sm-only"><fmt:formatDate value="${item.createDate}" pattern="yyyy-MM-dd"/> </td>
                                        <td>
                                         <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a type="button" href="${pageContext.request.contextPath}/user/doCustomerUpdate/${item.id}?keyword=${queryBean.keyword}&currentPage=${queryBean.currentPage}&pageSize=${queryBean.pageSize}" class="am-btn am-btn-default am-btn-xs am-text-secondary" ><i  class="am-icon-pencil-square-o"></i> 编辑</a>
                                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="editButton(${item.id})"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteButton(${item.id})"><span class="am-icon-trash-o"></span> 删除</button>
                                             </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                      <%--  <div class="am-cf">

                            <div class="am-fr">
                                <ul class="am-pagination tpl-pagination">
                                    <li class="am-disabled"><a href="#">«</a></li>
                                    <li class="am-active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">»</a></li>
                                </ul>
                            </div>
                        </div>--%>
                        <hr>
                    </form>
                </div>
            </div>
        </div>
        <div class="tpl-alert"></div>
    </div>
</div>
</div>
</div>
<script type="text/javascript">

    function addButton(){
        window.location="${pageContext.request.contextPath}/user/doCustomerSave/?currentPage=${queryBean.currentPage}&pageSize=${queryBean.pageSize}";
    }
    function editButton(id){
        window.location="${pageContext.request.contextPath}/user/doCustomerUpdate/"+id+"?currentPage=${queryBean.currentPage}&pageSize=${queryBean.pageSize}";
    }
    function deleteButton(id){
        //id==null时，表示删除多条数据
        if(id == null){
            var ids = $("input[name='checkbox']:checked").serialize();
            if(ids !=null){
                if (confirm("你确认要删除选中的数据吗？")){
                    window.location = "${pageContext.request.contextPath}/user/deleteCustomer/"+ids +
                        "?keyword="+$("#keyword").val()+"&currentPage="+${queryBean.currentPage}+"&pageSize="+${queryBean.pageSize};
                }
            }else{
                alert("请选择要删除的数据!");
            }

        }else{
            if (confirm("你确认要删除吗？")){
                window.location = "${pageContext.request.contextPath}/user/deleteCustomer/"+id +
                    "?keyword="+$("#keyword").val()+"&currentPage="+${queryBean.currentPage}+"&pageSize="+${queryBean.pageSize};
            }
        }
    }
</script>
</body>
</html>
