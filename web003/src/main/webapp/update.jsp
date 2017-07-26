<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   	 <form action="student/update">
   	 	<input type="hidden" name="id" value="${student.id}">
    	姓名:<input type="text" name="name"  value="${student.name }"><span id="s1"></span><br/>
    	性别:<input type="radio" name="gender"  value="1" <c:if test="${student.gender==1 }">checked="checked"</c:if> >男
    	<input type="radio" name="gender"  value="0" <c:if test="${student.gender==0 }">checked="checked"</c:if>>女<br/>
    	年龄:<input type="text" name="age"  value="${student.age }"><span id="s2"></span><br/>
    	生日:<input type="text" name="date"  value="<f:formatDate value='${student.birthday }' pattern='yyyy-MM-dd'/>"><span id="s3"></span><br/>
    	教室:<select name="classes.cid" >
    		<c:forEach items="${classes }" var="c">
    			<option value="${c.cid }" <c:if test="${student.classes.cid==c.cid }">selected="selected"</c:if> >${c.cname }</option>
    		</c:forEach>
    	</select><span id="s4"></span><br/>
    	<input type="submit" value="修改">
    </form>
  </body>
</html>
