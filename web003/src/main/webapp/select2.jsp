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
	
  <%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script> --%>
  	<script type="text/javascript" src="js/angular.min.js"></script>
  	<script type="text/javascript">
  		//创建模块
  		var select=angular.module("select",[]);
  		var pages;
  		//创建控制器
  		select.controller("SelectController",["$scope","$http",function($scope,$http){
  			//跳转到指定页
  			$scope.toPage=function(num){
  				//发送http请求
			    $http({
			        url:"student/selectPageJson?pageno="+num,
			        method:"GET"
			    }).then(function successCallback(response) {
			            
			          // console.log(response.data);
			          $scope.pageInfo = response.data.data.pageInfo;
			          //定义员工数据列表模型
			          $scope.studentList = $scope.pageInfo.list;
			          //总页数赋值
			          pages=$scope.pageInfo.pages;
			    }, function errorCallback(response) {
			            // 请求失败执行代码
			    });
  			};
  			
  			//默认跳转到第一页
  			$scope.toPage(1);
  			//加载部门列表
  			$scope.loadDepts=function(){
  				$http({
			        url:"student/classes",
			        method:"GET"
			    }).then(function successCallback(response) {
			    	$scope.deptList = response.data;
			    	//console.log($scope.deptList);
			    });
  			};
  			//打开添加模态框
  			$scope.showAdd=function(){
  				
  				//重置表单
  				$scope.loadDepts();
  				angular.element("#register").modal("show");
  				$("div").removeClass("has-error has-success"); 
	  			$("#register input[name='id']").val(null);
				$("#register input[name='name']").val(null);
	  			$("#register input[name='age']").val(null);
	  			$("#register input[name='date']").val(null);
  			};
  			angular.element("#addName").blur(function(){
  				var addName=$("#addName").val();
   				if(addName==null||addName==""){
   					$("#addName").parent().parent().removeClass(); 
   					$("#addName").parent().parent().addClass("form-group row has-error");
   					$("#addS1").text("用户名不能为空！！");	
   				}else{
   					$("#addName").parent().parent().removeClass(); 
   					$("#addName").parent().parent().addClass("form-group row has-success");
   					$("#addS1").empty();
   				}	   				
  			});
  			$scope.saveStu=function(){
  				var data=angular.element("#register form").serialize();
  				$http({
			        url:"student/add",
			        method:"POST",
			        data:data,
			        headers:{"Content-Type":"application/x-www-form-urlencoded"}
			    }).then(function successCallback(response) {	    	
			    	//alert("处理成功！");
			    	angular.element("#register").modal("hide");        
			        $scope.toPage(pages+1);
			    });
  			};
  			//删除模态框
  			$scope.del=function(index){
  				
  				id=$scope.studentList[index].id;
  				angular.element("#deleteEmpModal").modal("show");
  			};
  			
  			//删除用户
  			$scope.delStu=function(){
  				$http({
			        url:"student/delete?id="+id,
			        method:"POST",  
			    }).then(function successCallback(response) {
			    	//alert("处理成功！");
			    	/* angular.element("#deleteEmpModal").modal("hide");
			    	$scope.reloadRoute();  */
			    	angular.element("#deleteEmpModal").modal("hide");
			    	$scope.toPage($scope.pageInfo.pageNum);      
			    });
  			};
  			//修改模态框
  			$scope.update=function(index){
  				
  				$scope.loadDepts();		
  				//重置表单
  				angular.element("#update input[type='radio']").attr("checked",false);
  				angular.element("#update select option").attr("selected",false);
  		
  				$scope.cid=$scope.studentList[index].classes.cid;
  				$scope.date=$scope.studentList[index].birthday;
  				//进行返现
  				$("#update input[name='id']").val($scope.studentList[index].id);
  				$("#update input[name='name']").val($scope.studentList[index].name);
  				$("#update input[name='age']").val($scope.studentList[index].age);	
  				$("#update input[name='gender'][value="+$scope.studentList[index].gender+"]").attr("checked",true);
  				//$("#update select[name='classes.cid'] option[value='"+$scope.studentList[index].classes.cid+"']").attr("selected",true);
				
  				angular.element("#update").modal("show");
  			};
  			//修改
  			$scope.updateStu=function(){
  				var data=angular.element("#update form").serialize();
  				$http({
			        url:"student/updateStu",
			        method:"POST",
			        data:data,
			        headers:{"Content-Type":"application/x-www-form-urlencoded"}
			    }).then(function successCallback(response) {	    	
			    	
			    	angular.element("#update").modal("hide");        
			        $scope.toPage($scope.pageInfo.pageNum);
			    });
  			};
  				$scope.flag=false;
  			//点击全选
  			$scope.clickAll=function(){			
  				$scope.flag=!$scope.flag;
  				angular.element(".common").prop("checked",$scope.flag);
  			};
  			//检验全选状态
  			$scope.dan=function(){
  				var num=angular.element(".common").length; 				
  				checkenum=angular.element(".common:checked").length;
  				$scope.flag=(num==checkenum);	
  			};
  			//批量删除
  			$scope.delAll=function(){
  				ids=angular.element(".common:checked");
  				if(ids.length==0){
  					alert("请勾选");
  				}else{	
  					angular.element("#deleteAllEmpModal").modal("show");
  				}
  			};
  			//确定批量删除
  			$scope.delStuAll=function(){
  				ids.each(function(){
					var id=$(this).val();
					$http({
				        url:"student/delete?id="+id,
				        method:"POST",  
				    }).then(function successCallback(response) {
				    	//alert("处理成功！");
				    	/* angular.element("#deleteEmpModal").modal("hide");
				    	$scope.reloadRoute();  */
				    	angular.element("#deleteAllEmpModal").modal("hide");
				    	$scope.toPage($scope.pageInfo.pageNum);      
				    });
				});
  			};
  		}]);
  	</script>
	<script type="text/javascript">
		$(function(){
			$("#datetimepicker2").datetimepicker({  
	  		format: "YYYY-MM-DD",  
	   		 locale: moment.locale("zh-cn")  
		 }); 
		 
		 $("#datetimepicker1").datetimepicker({  
	  		format: "YYYY-MM-DD",  
	   		 locale: moment.locale("zh-cn")  
		 });
		}); 
	</script>
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
									<option ng-repeat="c in deptList" value="{{c.cid}}">{{c.cname}}</option>
								</select>
							</div>
						</div>
                              
                              <div class="text-right row">
                              		<div class="col-md-4">
                              			 <button class="btn btn-primary" ng-click="saveStu()" id="saveStu" type="button">提交</button>
                                  		 <button class="btn btn-danger" data-dismiss="modal" >取消</button>
                              		</div>
                              </div>
                              <!-- <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a> -->
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
               								 <input type='text' value="{{date | date:'yyyy-MM-dd'}}" class="form-control" name="date" placeholder="点击右边图标填写时间"/>  
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
									<option ng-repeat="c in deptList" ng-selected="c.cid ==cid" value="{{c.cid}}">{{c.cname}}</option>
								</select>
							</div>
						</div>
                              
                              <div class="text-right row">
                              		<div class="col-md-4">
                              			 <button class="btn btn-primary" id="updateStu" ng-click="updateStu()" type="button">提交</button>
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
	        <h4 class="modal-title" id="deleteModalLabel">是否确定删除?</h4>
				<input type="hidden" name="id" id="sid"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button id="deleteId" type="button" ng-click="delStu()" class="btn btn-danger">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 <!-- 批量删除 -->
	<div  id="deleteAllEmpModal"  class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="deleteModalLabel">确定要删除这些数据</h4>
				<input type="hidden" name="id" id="sid"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button id="deleteId" type="button" ng-click="delStuAll()" class="btn btn-danger">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
   
   <div class="container">
		<div class="row">
			<div class="col-md-3 ">
				<h1>学生信息管理</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 col-md-offset-7">
				<button class="btn btn-default" ng-click="delAll()" ><span class="glyphicon glyphicon-remove"></span>
				批量删除
				</button>
				<button class="btn btn-default" ng-click="showAdd()" id="add"><span class="glyphicon glyphicon-user"></span>
				新增学生信息
				</button>
			</div>
			
		</div>
		<br/>								
		<div class="row">
			<div class="col-md-11 ">				
				<table class="table table-hover">
					<tr>
						<td><input  type="checkbox" ng-checked="flag" ng-click="clickAll()"></td>
						<td>序号</td>
 						<td>姓名</td>
 						<td>年龄</td>
 						<td>生日</td>
 						<td>性别</td>
 						<td>教室</td>
 						<td>操作</td>
					</tr>
					<tr ng-repeat="stu in studentList">
						<td><input type="checkbox" class="common" value="{{stu.id}}" ng-click="dan()"></td>
						<td><font ng-bind="{{stu.id}}"></font> </td>
						<td>{{stu.name}}</td>
						<td>{{stu.age}}</td>
						<td>{{stu.birthday | date:'yyyy-MM-dd'}}</td>
						<td>{{stu.gender==1?'男':'女'}}</td>
						<td style="display: none">{{stu.classes.cid}}</td>
						<td>{{stu.classes.cname}}</td>
						<td>
							<button class="btn btn-primary editEmpBtn" ng-click="update($index)" >
		    					<span class="glyphicon glyphicon-pencil"></span>
		    						修改
		    				</button>
		    			    <button class="btn btn-danger" ng-click="del($index)">
		    			    	<span class="glyphicon glyphicon-trash"></span>
		    			        	  删除
		    			    </button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 分页 -->	
		<div class="row">
			<div class="col-md-10">
				<table>
					<tr>
						<td><h4><small>共有{{pageInfo.total}}数据,共有{{pageInfo.pages}}页</small></h4></td>
						<td><span>&nbsp&nbsp
							</span>
						</td>
						<td >
							<nav aria-label="Page navigation">
							  <ul class="pagination pagination-lg">
							   	<li ng-show="pageInfo.hasPreviousPage"><a href="javascript:void(null)" ng-click="toPage(1)">首页</a></li>							    
							    <li ng-hide="pageInfo.hasPreviousPage"  class="disabled"><a href="javascript:void(null)">首页</a></li>	
							     
						    	<li ng-show="pageInfo.hasPreviousPage">
							      <a href="javascript:void(null)" ng-click="toPage(pageInfo.pageNum-1)" aria-label="Previous">
							        <span aria-hidden="true">上一页</span>
							      </a>
						   	    </li>
						   	    
						   	    <li ng-hide="pageInfo.hasPreviousPage" class="disabled">
							      <a href="javascript:void(null)"  aria-label="Previous">
							        <span aria-hidden="true">上一页</span>
							      </a>
						   	    </li>
							     <li ng-repeat="num in pageInfo.navigatepageNums" 
							     ng-class="num==pageInfo.pageNum?'active':''">
							     	<a href="javascript:void(null)" ng-click="toPage(num)" ng-bind="num"></a>
							     </li>
							   
							   <li ng-show="pageInfo.hasNextPage">
							      <a href="javascript:void(null)" ng-click="toPage(pageInfo.pageNum+1)" aria-label="Previous">
							        <span aria-hidden="true">下一页</span>
							      </a>
						   	    </li>
						   	    
						   	    <li ng-hide="pageInfo.hasNextPage" class="disabled">
							      <a href="javascript:void(null)"  aria-label="Previous">
							        <span aria-hidden="true">下一页</span>
							      </a>
						   	    </li>
							   						
							   <li ng-show="pageInfo.hasNextPage"><a href="javascript:void(null)" ng-click="toPage(pageInfo.pages)">尾页</a></li>							    
							    <li ng-hide="pageInfo.hasNextPage"  class="disabled"><a href="javascript:void(null)">尾页</a></li>	
					
							  </ul>
							</nav>
					</tr>
				</table>
			</div>
		</div>			
	</div>
  </body>
</html>
