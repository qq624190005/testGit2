<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select.jsp' starting page</title>
    
	
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	
	<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/datetimepicker/build/css/bootstrap-datetimepicker.min.css">
	
  	<script type="text/javascript" src="bootstrap-3.3.7-dist/moment/min/moment-with-locales.min.js"></script>
	
	<script type="text/javascript" src="bootstrap-3.3.7-dist/datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  	
  	<script type="text/javascript" src="js/index.js"></script>
  	<script type="text/javascript" src="js/angular.min.js"></script>

  </head>
  <body ng-app="select" ng-controller="SelectController">
   
   <!-- 添加 -->
	<div id="register" class="modal fade" tabindex="-1">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-body">
                      <button class="close" data-dismiss="modal">
                          <span>&times;</span>
                      </button>
                  </div>
                  <div class="modal-title">
                      <div class="row">
                      	<div class="col-md-3 col-md-offset-1">
                      		<h1 class="">注册</h1>
                      	</div>
                      </div>
                  </div>
                  <div class="modal-body">
                  	<div class="container">
                      <form class="form-group" action="">
                              <div class="form-group row">
                                  <div class="col-md-4">
                                  	<label class="control-label" for="addName">用户名</label>
                                  	<input class="form-control" type="text" id="addName" name="name" placeholder="6-15位字母或数字">
                                  	<span class="help-block" id="addS1"></span>
                                  </div>
                              </div>
                              
                              <div class="form-group row">
                              		<div class="col-md-4">
                              			<label for="">性别</label><br/>
                              			<label class="radio-inline">
  											<input type="radio" name="gender"  checked="checked" value="1"> 男
										</label>
										<label class="radio-inline">
  											<input type="radio" name="gender"  value="0"> 女
										</label>
                              		</div>
                              </div>
                              
                             <div class="form-group row">
                              	  <div class="col-md-4">
                              	  	<label for="">年龄</label>
                                    <input class="form-control" name="age" type="text" placeholder="例如:18">
                              	  </div>
                              </div> 
                              
                              <div  class="form-group row">
                              		<div class="col-md-4">
                              			<label for="">生日</label><br/>
                              			 <div class='input-group date' id='datetimepicker2'>  
               								 <input type='text' class="form-control" name="date" placeholder="点击右边图标填写时间"/>  
              								  <span class="input-group-addon">  
                   								 <span class="glyphicon glyphicon-calendar"></span>  
               								 </span>  
          					 			 </div>  
                              		</div>
                              </div>
                              
						<div class="form-group row">
							<div class="col-md-4">
								<label for="" >教室</label>
								<select class="form-control" name="classes.cid">
									
									
								</select>
							</div>
						</div>
                              
                              <div class="text-right row">
                              		<div class="col-md-4">
                              			 <button class="btn btn-primary" id="saveStu" type="button">提交</button>
                                  		 <button class="btn btn-danger" data-dismiss="modal" >取消</button>
                              		</div>
                              </div>
                              <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                      </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      
   	<!-- 修改-->
	<div id="update" class="modal fade" tabindex="-1">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-body">
                      <button class="close" data-dismiss="modal">
                          <span>&times;</span>
                      </button>
                  </div>
                  <div class="modal-title">
                      <div class="row">
                      	<div class="col-md-3 col-md-offset-1">
                      		<h1 class="">修改</h1>
                      	</div>
                      </div>
                  </div>
                  <div class="modal-body">
                  	<div class="container">
                      <form class="form-group" action="">
                              <div class="form-group row">
                                  <div class="col-md-4">
                                  	<label for="">用户名</label>
                                  	<input type="hidden" name="id">
                                  	<input class="form-control" type="text" name="name" placeholder="6-15位字母或数字">
                                  </div>
                              </div>
                              
                              <div class="form-group row">
                              		<div class="col-md-4">
                              			<label for="">性别</label><br/>
                              			<label class="radio-inline">
  											<input type="radio" name="gender"  checked="checked" value="1"> 男
										</label>
										<label class="radio-inline">
  											<input type="radio" name="gender"  value="0"> 女
										</label>
                              		</div>
                              </div>
                              
                             <div class="form-group row">
                              	  <div class="col-md-4">
                              	  	<label for="">年龄</label>
                                    <input class="form-control" name="age" type="text" placeholder="例如:18">
                              	  </div>
                              </div> 
                              
                              <div  class="form-group row">
                              		<div class="col-md-4">
                              			<label for="">生日</label><br/>
                              			 <div class='input-group date' id='datetimepicker1'>  
               								 <input type='text' class="form-control" name="date" placeholder="点击右边图标填写时间"/>  
              								  <span class="input-group-addon">  
                   								 <span class="glyphicon glyphicon-calendar"></span>  
               								 </span>  
          					 			 </div>  
                              		</div>
                              </div>
                              
						<div class="form-group row">
							<div class="col-md-4">
								<label for="inputEmail" >教室</label>
								<select class="form-control" name="classes.cid">
									
								</select>
							</div>
						</div>
                              
                              <div class="text-right row">
                              		<div class="col-md-4">
                              			 <button class="btn btn-primary" id="updateStu" type="button">提交</button>
                                  		 <button class="btn btn-danger" data-dismiss="modal" >取消</button>
                              		</div>
                              </div>
                             
                      </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      
   
   <!-- 删除 -->
	<div  id="deleteEmpModal"  class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="deleteModalLabel">确定要删除员工?</h4>
				<input type="hidden" name="id" id="sid"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button id="deleteId" type="button" class="btn btn-danger">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
   
   <div class="container">
		<div class="row">
			<div class="col-md-3">
				<h1>学生信息管理</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1 col-md-offset-8">
				<button class="btn btn-success" id="add"><span class="glyphicon glyphicon-user"></span>
				新增学生信息
				</button>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-11 ">
				<table class="table table-hover">
					<tr>
						<td>序号</td>
   						<td>姓名</td>
   						<td>年龄</td>
   						<td>生日</td>
   						<td>性别</td>
   						<td>教室</td>
   						<td>操作</td>
					</tr>
					 <c:forEach items="${pageInfo.list }" var="s" varStatus="aa">
					<tr>
						<td style="display: none">${s.id }</td>
						<td >${aa.count }</td>
   						<td>${s.name }</td>
   						<td>${s.age }</td>
   						<td><f:formatDate value="${s.birthday }" pattern="yyyy-MM-dd" /></td>
   						<td><c:if test="${s.gender==1 }">男</c:if><c:if test="${s.gender==0 }">女</c:if></td>
   						<td style="display: none">${s.classes.cid}</td>
   						<td>${s.classes.cname }</td>
		    			<td>
		    				<button class="btn btn-primary editEmpBtn" >
		    					<span class="glyphicon glyphicon-pencil"></span>
		    						修改
		    				</button>
		    			    <button class="btn btn-danger delEmpBtn">
		    			    	<span class="glyphicon glyphicon-trash"></span>
		    			          删除
		    			    </button>
		    		   </td>
					</c:forEach> 
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table >
					<tr>
						<td><h4>共有${pageInfo.total }数据,共有${pageInfo.pages }页</h4></td>
						<td><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								  </span></td>
						<td align="right" >
							<nav aria-label="Page navigation">
							  <ul class="pagination pagination-lg">
							   <c:if test="${pageInfo.pageNum==1 }">
							    	<li><a href="javascript:void(null)">首页</a></li>
							    </c:if>
							    <c:if test="${pageInfo.pageNum!=1 }">
							    	<li><a href="student/selectAll?pageno=1">首页</a></li>
							    </c:if>
							     <c:if test="${pageInfo.pageNum==1 }">
							    	<li>
								      <a href="javascript:void(null)"  aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
							   	    </li>
							    </c:if>
							    <c:if test="${pageInfo.pageNum!=1 }">
							    	<li>
								      <a href="student/selectAll?pageno=${pageInfo.pageNum-1 }" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
							    	</li>
							    </c:if>
							    
							    <c:forEach items="${pageInfo.navigatepageNums }" var="page">
							    	<c:if test="${page==pageInfo.pageNum }">
							    		<li class="active"><a href="student/selectAll?pageno=${page }">${page }</a></li>
							    	</c:if>
							    	<c:if test="${page!=pageInfo.pageNum }">
							    		<li><a href="student/selectAll?pageno=${page }">${page }</a></li>
							    	</c:if>
							    </c:forEach>
							    <c:if test="${pageInfo.pageNum==pageInfo.lastPage }">
							    	<li>
								      <a href="javascript:void(null)"  aria-label="Previous">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
							   	    </li>
							    </c:if>
							    <c:if test="${pageInfo.pageNum!=pageInfo.lastPage }">
							    	<li>
								      <a href="student/selectAll?pageno=${pageInfo.pageNum+1 }" aria-label="Previous">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
							    	</li>
							    </c:if>
							   
							    <c:if test="${pageInfo.pageNum==pageInfo.lastPage }">
							    	<li><a href="javascript:void(null)">尾页</a></li>
							    </c:if>
							    <c:if test="${pageInfo.pageNum!=pageInfo.lastPage }">
							    	<li><a href="student/selectAll?pageno=${pageInfo.lastPage }">尾页</a></li>
							    </c:if>
							  </ul>
							</nav>
						</td>
					</tr>
				</table>			
			</div>
		</div>
	</div>
  </body>
</html>
