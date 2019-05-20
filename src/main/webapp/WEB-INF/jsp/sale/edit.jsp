<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/17 0017
  Time: 14:02
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

<div class="page_title">销售机会管理&nbsp; &gt; 编辑销售机会</div>
<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <button class="common_button" onclick="back();">返回</button>
    <button class="common_button" onclick="save('${ctx}/sale/editSale');">保存</button>
</div>
<table class="query_form_table">
    <tr>
        <th>编号</th>
        <td><input readonly id="chcId" value="${salChance1.chcId}" /></td>
        <th>机会来源</th>
        <td>
            <input name="T4" id="chcSource" value="${salChance1.chcSource}" size="20" /></td>
    </tr>
    <tr>
        <th>客户名称</th>
        <td><input value="${salChance1.chcCustName}" id="chcCustName" /><span class="red_star">*</span></td>
        <th>成功机率（%）</th>
        <td><input value="${salChance1.chcRate}" id="chcRate" /><span class="red_star">*</span></td>
    </tr>
    <tr>
        <th>概要</th>
        <td colspan="3"><input value="${salChance1.chcTitle}" id="chcTitle" name="T0" size="52" /><span class="red_star">*</span></td>
    </tr>
    <tr>
        <th>联系人</th>
        <td><input name="T21" value="${salChance1.chcLinkman}" id="chcLinkman" size="20" /></td>
        <th>联系人电话</th>
        <td><input name="T5" value="${salChance1.chcTel}" id="chcTel" size="20" /></td>
    </tr>
    <tr>
        <th>机会描述</th>
        <td colspan="3"><textarea rows="6" cols="50" id="chcDesc" name="S1">${salChance1.chcDesc}</textarea><span class="red_star">*</span></td>
    </tr>
    <tr>
        <th>创建人</th>
        <td><input name="T19" value="${salChance1.chcCreateBy}" id="chcCreateBy" readonly size="20" /><span class="red_star">*</span></td>
        <th>创建时间</th>
        <td><input id="t11" name="T15" value="${salChance1.chcCreateDate}" id="chcCreateDate" readonly size="20" /><span class="red_star">*</span></td>
    </tr>
</table>
<br />
<table disabled class="query_form_table" id="table1">
    <tr>
        <th>指派给</th>
        <td>
            <select name="D1">
                <option>请选择...</option>
                <option>小明</option>
                <option>旺财</option>
                <option>球球</option>
                <option>孙小美</option>
                <option>周洁轮</option>
            </select> <span class="red_star">*</span></td>
        <th>指派时间</th>
        <td>
            <input id="t2" name="T20" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>" readonly size="20" /><span class="red_star">*</span></td>
    </tr>
</table>
<script>
    setCurTime('t1');
    setCurTime('t2');
</script>
</body>
</html>