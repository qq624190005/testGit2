<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
  <script type="text/javascript">
  	$(function(){
  		var uname=false;
  		var uage=false;
  		var udate=false;
  		var uclasses=false;
  		$("#name").blur(function(){
  			name=$("#name").val();
  			if(name==null||name==""){
  				$("#s1").css({
  					color:"red"
  				}).text("用户名不能为空");
  			}else
  			{
  				$("#s1").css({
  					color:"green"
  				}).text("√");
  				uname=true;
  			}
  		});
  		$("#age").blur(function(){
  			age=$("#age").val();
  			if(age==null||age==""){
  				$("#s2").css({
  					color:"red"
  				}).text("年龄不能为空");
  			}else
  			{
  				$("#s2").css({
  					color:"green"
  				}).text("√");
  				uage=true;
  			}
  		});
  		$("#date").blur(function(){
  			date=$("#date").val();
  			if(date==null||date==""){
  				$("#s3").css({
  					color:"red"
  				}).text("生日不能为空");
  			}else
  			{
  				$("#s3").css({
  					color:"green"
  				}).text("√");
  				udate=true;
  			}
  		});
  		$("#classes").blur(function(){
  			classes=$("#classes").val();
  			if(classes==null||classes==""){
  				$("#s4").css({
  					color:"red"
  				}).text("请选择班级");
  			}else
  			{
  				$("#s4").css({
  					color:"green"
  				}).text("√");
  				uclasses=true;
  			}
  		});
  		gender=$("#s7").val();
  		$("#s7").click(function(){
  			gender=$("#s7").val();		
  		});
  		$("#s6").click(function(){
  			gender=$("#s6").val();		
  		});		
  		$("#tj").click(function(){
  			if(uname&&uage&&udate&&uclasses){
  				$.post("${pageContext.request.contextPath }/student/add",{"name":name,"age":age,"date":date,"classes.cid":classes,"gender":gender},function(d){
  					if(d=="ok"){
  						alert("添加成功");
  						window.location.href="${pageContext.request.contextPath }/student/selectAll";
  					}else{
  						alert("添加失败");
  					}
  				},"json");
  			}else
  			{
  				alert("添加方式有误");
  			}
  		});
  	});
  </script>
  <body>
    <form action="" method="post">
    	姓名:<input type="text" name="name" id="name"><span id="s1"></span><br/>
    	性别:<input type="radio" name="gender" checked="checked" value="1" id="s7">男
    	<input type="radio" name="gender" value="0" id="s6" >女<br/>
    	年龄:<input type="text" name="age" id="age"><span id="s2"></span><br/>
    	生日:<input type="text" name="date" id="date"><span id="s3"></span><br/>
    	教室:<select name="classes.cid" id="classes">
    		<option selected="selected" value="">选择教室</option>
    		<c:forEach items="${classes }" var="c">
    			<option value="${c.cid }">${c.cname }</option>
    		</c:forEach>
    	</select><span id="s4"></span><br/>
    	<input type="button" value="提交" id="tj">
    </form>
  </body>
</html>
