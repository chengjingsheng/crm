<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/19 0019
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/head.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>jb-aptech毕业设计项目</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/script/jquery-1.7.2.min.js"></script>
    <script src="${ctx}/script/common.js"></script>
</head>
<body>

<div class="page_title">客户开发计划 &gt; 执行计划</div>
<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <button class="common_button" onclick="alert('开发失败，已归档。');window.location.href='dev.html';">终止开发</button>
    <button class="common_button" onclick="back();">返回</button>
    <button class="common_button" onclick="to('dev_plan.html');">制定计划</button>
    <button class="common_button" onclick="alert('用户开发成功，已添加新客户记录。');window.location.href='dev.html';">开发成功</button>

</div>
<table class="query_form_table">
    <tr>
        <th>编号</th>
        <td>${salChance1.chcId}</td>
        <th>机会来源</th>
        <td>${salChance1.chcSource}</td>
    </tr>
    <tr>
        <th>客户名称</th>
        <td>${salChance1.chcCustName}</td>
        <th>成功机率（%）</th>
        <td>&nbsp;${salChance1.chcRate}</td>
    </tr>
    <tr>
        <th>概要</th>
        <td colspan="3">${salChance1.chcTitle}</td>
    </tr>
    <tr>
        <th>联系人</th>
        <td>${salChance1.chcLinkman}</td>
        <th>联系人电话</th>
        <td>${salChance1.chcTel}</td>
    </tr>
    <tr>
        <th>机会描述</th>
        <td colspan="3">${salChance1.chcDesc}</td>
    </tr>
    <tr>
        <th>创建人</th>
        <td>${salChance1.chcCreateBy}</td>
        <th>创建时间</th>
        <td>${salChance1.chcCreateDate}</td>
    </tr>
</table>
<br/>
<table class="data_list_table" id="table1">

    <f:form  action="" method="post" modelAttribute="salPlan">
        <tr>
            <th>日期</th>
            <th>计划</th>
            <th>执行效果</th>
        </tr>
        <c:forEach items="${salPlans}" var="sa">
            <tr>
                <td class="list_data_text" height="24"><fmt:formatDate value="${sa.plaDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
                <td class="list_data_ltext" height="24">${sa.plaTodo}
                <td class="list_data_ltext"><input id="plaResult" value="${sa.plaResult}" />　
                    <button class="common_button" onclick="updateplaResult('${ctx}/sale/updateSalPlan','${sa.plaId}','${salChance1.chcId}');">保存</button>
                </td>
            </tr>
        </c:forEach>
    </f:form>


</body>
</html>