<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	
	<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
	
	<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
	   <div class="form-group has-error">
	  <label class="control-label" for="inputError1">Input with error</label>
	  <input type="text" class="form-control" id="inputError1">
	</div>
  </body>
</html>
