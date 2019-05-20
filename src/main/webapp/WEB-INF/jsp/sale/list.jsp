<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/17 0017
  Time: 13:59
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
    <script src="${ctx}/script/common.js"></script>
</head>
<body>

<div class="page_title">销售机会管理</div>

<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <button class="common_button" onclick="to('${ctx}/sal/toadd');">新建</button>
    <f:form id="bt" action="${ctx}/sale/salChanceList" modelAttribute="salChance" method="post">
    <button class="common_button" onclick="reload('${ctx}/sale/salChanceList');">查询</button>
</div>
<table class="query_form_table">
    <tr>
        <th>客户名称</th>
        <td><input name="chcCustName" id="chcCustName" /></td>
        <th>概要</th>
        <td><input name="chcTitle" id="chcTitle" /></td>
        <th>联系人</th>
        <td>
            <input name="chcLinkman" size="20" id="chcLinkman" />
        </td>
    </tr>
</table>
</f:form>
<br />
<table class="data_list_table">
    <tr>
        <th>编号</th>
        <th>客户名称</th>
        <th>概要</th>
        <th>联系人</th>
        <th>联系人电话</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    <c:forEach var="c" items="${list}">

        <tr>
            <td class="list_data_number">${c.chcId}</td>
            <td class="list_data_text">${c.chcCustName}</td>
            <td class="list_data_ltext">${c.chcTitle}</td>
            <td class="list_data_text">${c.chcLinkman}</td>
            <td class="list_data_text">${c.chcTel}</td>
            <td class="list_data_text"><fmt:formatDate value="${c.chcCreateDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
            <td class="list_data_op">
                <img onclick="to('${ctx}/sale/loaddispatch?chcId=${c.chcId}');" title="指派" src="${ctx}/images/bt_linkman.gif" class="op_button" />
                <img onclick="to('${ctx}/sale/salChanceload?chcId=${c.chcId}');" title="编辑" src="${ctx}/images/bt_edit.gif" class="op_button" />
                <img onclick="del('${ctx}/sale/delSale','${c.chcId}');" title="删除" src="${ctx}/images/bt_del.gif" class="op_button" />

            </td>
        </tr>


    </c:forEach>
    <tr>
        <th colspan="7" class="pager">
            <div class="pager">
                共59条记录 每页<input value="10" size="2" />条
                第<input value="1" size="2"/>页/共5页
                <a href="#">第一页</a>
                <a href="#">上一页</a>
                <a href="#">下一页</a>
                <a href="#">最后一页</a>
                转到<input value="1" size="2" />页
                <button width="20" onclick="reload();">GO</button>
            </div>
        </th>
    </tr>
</table>
</body>
</html>