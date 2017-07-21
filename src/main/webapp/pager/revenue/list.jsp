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
            <li><a href="#" class="am-icon-align-justify">数据管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/revenue/list">数据列表</a></li>
        </ol>
        <div class="tpl-portlet-components">
            <form action="${pageContext.request.contextPath}/revenue/list" method="post" class="form-inline" role="form">
                 <div class="portlet-title">
                <div class="portlet-input  input-inline">
                    <div class="input-icon right">
                        <input type="text" class="form-control form-control-solid" name="keyword" id="keyword"  value="${queryBean.keyword }"  placeholder="搜索...">
                        <input type="datetime" class="form-control form-control-solid" name="startDate" id="startDate" value="${queryBean.startDate }" placeholder="开始时间" data-am-datepicker="yyyy-MM-dd" readonly/>
                        <input type="text" class="form-control form-control-solid" name="endDate" id="endDate" value="${queryBean.endDate }" placeholder="结束时间" data-am-datepicker="yyyy-MM-dd" readonly/>
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="submit" class="am-btn am-btn-primary">
                                <span class="am-icon-search"></span>查询
                            </button>
                        </div>
                    </div>
                </div>
                <c:if test="${sessionScope.current_user.userRole ==1 }">
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default am-btn-success" onclick="myModalImport()"><span class="am-icon-cloud-upload"></span> 导入</button>
                            <button type="button" class="am-btn am-btn-default am-btn-danger" onclick="deleteButton(null)"><span class="am-icon-trash-o"></span> 删除</button>
                        </div>
                    </div>
                </c:if>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                    <tr>
                                        <th class="table-check"><input type="checkbox" id="checkboxTh" onclick="allCheck()"  class="tpl-table-fz-check" ></th>
                                        <th class="table-title" width="15%">游戏名称</th>
                                        <th class="table-type" width="20%">公司名称</th>
                                        <th class="table-type" width="12%">新注册用户数</th>
                                        <th class="table-type" width="10%">消费订单数</th>
                                        <th class="table-type" width="10%">消费用户数</th>
                                        <th class="table-type" width="10%">消费金额</th>
                                        <th class="table-date am-hide-sm-only" width="10%">日期</th>
                                        <c:if test="${sessionScope.current_user.userRole ==1 }">
                                            <th class="table-set" width="10%">操作</th>
                                        </c:if>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageDataList.pageRecords}" var="item">
                                        <tr>
                                            <td><input type="checkbox" name="checkboxInput" value="${item.id}"></td>
                                            <td>${item.gameName}</td>
                                            <td>${item.companyName}</td>
                                            <td>${item.registeredNum}</td>
                                            <td>${item.cuonsumOrderNum}</td>
                                            <td>${item.cuonsumNum}</td>
                                            <td>${item.cuonsumAmount}</td>
                                            <td class="am-hide-sm-only"><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd"/> </td>
                                            <c:if test="${sessionScope.current_user.userRole ==1 }">
                                                <td>
                                                    <div class="am-btn-toolbar">
                                                        <div class="am-btn-group am-btn-group-xs">
                                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteButton(${item.id})"><span class="am-icon-trash-o"></span> 删除</button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <th class="table-check"></th>
                                        <th class="table-title" width="15%">总数</th>
                                        <th class="table-type" width="20%"></th>
                                        <th class="table-type" width="12%">${revenueTotal.registeredNum}</th>
                                        <th class="table-type" width="10%">${revenueTotal.cuonsumOrderNum}</th>
                                        <th class="table-type" width="10%">${revenueTotal.cuonsumNum}</th>
                                        <th class="table-type" width="10%">${revenueTotal.cuonsumAmount}</th>
                                        <th class="table-date am-hide-sm-only" width="10%"></th>
                                        <c:if test="${sessionScope.current_user.userRole ==1 }">
                                            <th class="table-set" width="10%"></th>
                                        </c:if>
                                    </tr>
                                    </tbody>
                                </table>
                                <div>


                                </div>
                                <hr class="wide" />
                                <div class="footer">
                                    <!-- 分页  -->
                                    <c:url var="pageUrl" value="/revenue/list">
                                        <c:param name="keyword" value="${queryBean.keyword}" />
                                    </c:url>
                                    <page:pagerNav modelRef="pageDataList" url="${pageUrl}" type="beyond" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalImport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    X
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   导入数据
                </h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/revenue/uploadFileExcel" enctype="multipart/form-data">
                <div class="modal-body">
                        <input type="file" name="file" />
                </div>
                <input type="text" class="form-control form-control-solid hide" name="keyword" value="${queryBean.keyword }"  />
                <input type="text" class="form-control form-control-solid hide" name="currentPage" value="${queryBean.currentPage }"  />
                <input type="text" class="form-control form-control-solid hide" name="pageSize" value="${queryBean.pageSize }"  />
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


    function allCheck(){
        var flgBox = $("#checkboxTh").is(":checked");
        $("input[name='checkboxInput']").prop("checked", flgBox);
    }
    function deleteButton(id){
        //id==null时，表示删除多条数据
        if(id == null){
            var ids = new Array();//$("input[name='checkboxInput']:checked").serialize();
            $.each($('input:checkbox:checked'),function(){
                if($(this).val()!="on"){//第一条等于on
                    ids.push($(this).val());
                }
            });
            if(ids !=null){
                if (confirm("你确认要删除选中的数据吗？")){
                    window.location = "${pageContext.request.contextPath}/revenue/delete/?ids="+ids+"&keyword="+$("#keyword").val()+"&currentPage="+${queryBean.currentPage}+"&pageSize="+${queryBean.pageSize};
                }
            }else{
                alert("请选择要删除的数据!");
            }

        }else{
            if (confirm("你确认要删除吗？")){
                window.location = "${pageContext.request.contextPath}/revenue/delete/?ids="+id+"&keyword="+$("#keyword").val()+"&currentPage="+${queryBean.currentPage}+"&pageSize="+${queryBean.pageSize};
            }
        }
    }
    function myModalImport(){
        $('#myModalImport').modal('show').css({
            width: '100%',
        });
        $('.modal').css({'overflow-x':'scroll'});
    }
</script>
</body>
</html>
