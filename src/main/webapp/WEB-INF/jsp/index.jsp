<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/17 0017
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>客户关系管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset rows="85,*,40" frameborder="NO" noresize Borders="NO" framespacing="0">
    <frame name="topFrame" frameborder="NO" scrolling="NO" noresize Borders="NO" src="${ctx}/top.jsp"  marginwidth="value" marginheight="value" >
    <frame name="mainFrame" noresize Borders="NO" src="${ctx}/index-ec.jsp" marginwidth="value" marginheight="value" >
    <frame src="${ctx}/footer.jsp" name="top1Frame" frameborder="NO" scrolling="NO" noresize  marginwidth="0" marginheight="0" Borders="NO" >
</frameset>
<noframes><body bgcolor="#FFFFFF">

</body></noframes>
</html>
