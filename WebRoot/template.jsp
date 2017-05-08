<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <!-- 定义标题 -->
  <head>
     <title><tiles:getAsString name="title"/></title>
     <link rel="stylesheet" href="css/main.css">
     <link rel="stylesheet" href="css/header.css">
  </head>
  
  <body>
     <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <!-- 定义页首 -->
        <tr height="12%"><td><tiles:insertAttribute name="header"/></td></tr>
        <!-- 定义内容区 -->
        <tr style="overflow: scroll;"><td><tiles:insertAttribute name="body"/></td></tr>
     </table>
  </body>
</html>
