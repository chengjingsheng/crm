<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/17 0017
  Time: 13:58
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
    <script src="${ctx}/script/jquery-1.7.2.min.js"></script>
</head>
<body>
<script>
    function add(url){
        alert(url);
       /* var name=document.getElementById("chcCustName").val();
        alert(name);*/
       var myo=myon;
        var json={
            "chcSource":$("#chcSource").val(),
            "chcCustName":$("#chcCustName").val(),
            "chcTitle":$("#chcTitle").val(),
            "chcRate":$("#chcRate").val(),
            "chcLinkman":$("#chcLinkman").val(),
            "chcTel":$("#chcTel").val(),
            "chcDesc":$("#chcDesc").val(),
            "chcCreateBy":$("#chcCreateBy").val(),
            "datestring":$("#t11").val()
        }
            $.ajax({
                url:url,
                type: "post",
                data: json,
                dataType:"json",
                success: function (data) {
                    if(data.status==1){
                        alert(data.message);
                        window.location.reload( );
                        //window.location.href="http://localhost:8080/mooc/admin/listorganization";
                    }
                    else {//如果验证失败,则 显示错误信息
                        alert(data.message);
                        window.location.reload( );
                        //window.location.href="http://localhost:8080/mooc/admin/listorganization";
                    }
                }

            })
    }

        function myon() {
            alert("进入了");
            var chcCustName=$("#chcCustName").val();
            var chcRate=$("#chcRate").val();
            var chcTitle=$("#chcTitle").val();
            var chcDesc=$("#chcDesc").val();
            var chcCreateBy=$("#chcCreateBy").val();
            if(chcCustName !=null){
                alert("客户名称不能为空");
                return 1;
            }
            else if(chcRate != null){
                alert("成功机率不能为空");
                return 1;
            }
            else if(chcTitle != null){
                alert("概要不能为空");
                return 1;
            }
            else if(chcDesc != null){
                alert("机会描述不能为空");
                return 1;
            }
            else if(chcCreateBy != null){
                alert("创建人不能为空");
                return 1;
            }
            else{
                return 0;
            }

        }




</script>

<div class="page_title">销售机会管理&nbsp; &gt; 新建销售机会</div>
<div class="button_bar">
    <button class="common_button" onclick="help('');">帮助</button>
    <button class="common_button" onclick="back();">返回</button>
    <button class="common_button"  onclick="add('${ctx}/sale/addSale');">保存</button>
</div>
<f:form>
<table class="query_form_table">
    <tr>
        <th>编号</th>
        <td><input readonly /></td>
        <th>机会来源</th>
        <td>
            <input name="T4" id="chcSource" size="20" /></td>
    </tr>
    <tr>
        <th>客户名称</th>
        <td><input id="chcCustName"  name="chcCustName"   /><span class="red_star">*</span></td>
        <th>成功机率</th>
        <td><input id="chcRate"  /><span class="red_star">*</span></td>
    </tr>
    <tr>
        <th>概要</th>
        <td colspan="3"><input name="T0" id="chcTitle"   size="52" /><span class="red_star">*</span></td>
    </tr>
    <tr>
        <th>联系人</th>
        <td><input name="T21" size="20" id="chcLinkman"  /></td>
        <th>联系人电话</th>
        <td><input name="T5" size="20" id="chcTel" /></td>
    </tr>
    <tr>
        <th>机会描述</th>
        <td colspan="3"><textarea rows="6" id="chcDesc"  cols="50"  name="S1"></textarea><span class="red_star">*</span></td>
    </tr>
    <tr>
        <th>创建人</th>
        <td><input name="T19" id="chcCreateBy" value="刘颖" readonly size="20" /><span class="red_star">*</span></td>
        <th>创建时间</th>
        <td>
            <input id="t11"  readonly size="20" value="<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>" />
            <span class="red_star">*</span>
        </td>
    </tr>
</table>
<br />
<table disabled class="query_form_table" id="table1">
    <tr>
        <th>指派给</th>
        <td>
            <select name="D1"id="chcDueTo">
                <option>请选择...</option>
                <option value="小明">小明</option>
                <option value="旺财">旺财</option>
                <option value="球球">球球</option>
                <option value="孙小美">孙小美</option>
                <option value="周洁轮">周洁轮</option>
            </select> <span class="red_star">*</span></td>
        <th>指派时间</th>
        <td>
            <input id="t10"  readonly size="20" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>"  /><span class="red_star">*</span></td>
    </tr>
</table>
</f:form>
<script>
    setCurTime('t1');
    setCurTime('t2');
</script>
</body>
</html>