<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/19 0019
  Time: 10:23
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

<div class="page_title">客户开发计划</div>
<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <f:form id="bt" action="" modelAttribute="salChance" method="post">
    <button class="common_button" onclick="reload('${ctx}/sale/salPlanList');">查询</button>
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
        <th>状态</th>
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

        <c:if test="${c.chcStatus==2}">
            <td class="list_data_text">
                开发中
            </td>
            <td class="list_data_op">
                <img onclick="to('${ctx}/sale/loadSalPlan?plaChcId=${c.chcId}');" title="制定计划" src="${ctx}/images/bt_plan.gif" class="op_button" />
                <img onclick="to('${ctx}/sale/loadSalPlan1?plaChcId=${c.chcId}&surl=1');" title="执行计划" src="${ctx}/images/bt_feedback.gif" class="op_button" />
                <img onclick="alert('用户开发成功，已添加新客户记录。');" title="开发成功" src="${ctx}/images/bt_yes.gif" class="op_button" />
            </td>
            </c:if>
            <c:if test="${c.chcStatus==3}">
                <td class="list_data_text">
                    已归档
                </td>
                <td class="list_data_op">
                    <img onclick="to('dev_detail.html');" title="查看" src="${ctx}/images/bt_detail.gif" class="op_button" />
                </td>
            </c:if>
            <c:if test="${c.chcStatus==4}">
                <td class="list_data_text">
                    开发失败
                </td>
                <td class="list_data_op">

                    <img onclick="to('${ctx}/sale/loadSalPlan?plaChcId=${c.chcId}');" title="制定计划" src="${ctx}/images/bt_plan.gif" class="op_button" />
                    <img onclick="to('${ctx}/sale/loadSalPlan1?plaChcId=${c.chcId}&surl=1');" title="执行计划" src="${ctx}/images/bt_feedback.gif" class="op_button" />
                    <img onclick="alert('用户开发成功，已添加新客户记录。');" title="开发成功" src="${ctx}/images/bt_yes.gif" class="op_button" />
                </td>
            </c:if>


    </tr>


    </c:forEach>

    <tr>
        <td class="list_data_number">2</td>
        <td class="list_data_text">泰宝实业</td>
        <td class="list_data_ltext">采购笔记本电脑意向</td>
        <td class="list_data_text">马先生</td>
        <td class="list_data_text">13333239239</td>
        <td class="list_data_text">2007年11月16日</td>
        <td class="list_data_text">已归档</td>
        <td class="list_data_op">
            <img onclick="to('dev_detail.html');" title="查看" src="${ctx}/images/bt_detail.gif" class="op_button" />
        </td>
    </tr>
    <tr>
        <th colspan="10" class="pager">
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
