<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/19 0019
  Time: 10:28
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

<div class="page_title">销售机会管理&nbsp; &gt; 指派销售机会</div>
<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <button class="common_button" onclick="back();">返回</button>
    <button class="common_button" onclick="update('${ctx}/sale/updateDispatch','${salChance1.chcId}');">保存</button>
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
<br />
<table class="query_form_table" id="table1">
    <tr>
        <th>指派给</th>
        <td>
            <select name="D1" id="chcDueTo">
                <option>请选择...</option>
                <option value="小明">小明</option>
                <option value="旺财">旺财</option>
                <option value="球球">球球</option>
                <option value="孙小美">孙小美</option>
                <option value="周洁轮">周洁轮</option>
            </select> <span class="red_star">*</span></td>
        <th>指派时间</th>
        <td>
            <input id="t10" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>" readonly size="20" /><span class="red_star">*</span></td>
    </tr>
</table>
<script>
    setCurTime('t2');
</script>
</body>
</html>
