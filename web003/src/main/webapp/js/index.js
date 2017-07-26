	$(function(){	
		
				$("#datetimepicker2").datetimepicker({  
	       			 format: "YYYY-MM-DD",  
	        		 locale: moment.locale("zh-cn")  
	   			 }); 
	   			 
	   			 $("#datetimepicker1").datetimepicker({  
	       			 format: "YYYY-MM-DD",  
	        		 locale: moment.locale("zh-cn")  
	   			 }); 
	   			 	 
	   			$("#add").click(function(){
	  				$.post("student/classes",function(data){
	  					//清空下拉框中数据
						$("#register select").empty();
						//data表示要遍历的集合或数组
						//index表示下标
						//obj表示各个元素
						var option1=$("<option selected='selected'>请选择教室<option/>");
						$("#register select").append(option1);
						$.each(data,function(index,obj){
							//创建option标签
							var option=$("<option value='"+obj.cid+"'>"+obj.cname+"<option/>");
							$("#register select").append(option);
						});
	  				},"json");
	  				$("div").removeClass("has-error has-success"); 
	  				$("#register input[name='id']").val(null);
					$("#register input[name='name']").val(null);
	  				$("#register input[name='age']").val(null);
	  				$("#register input[name='date']").val(null);
					$("#register").modal("show");		
					
				});
	   			$("#addName").blur(function(){
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
	   			 
	   		//对保存按钮绑定事件
	 			$("#saveStu").click(function(){	
	 				var form = $("#register form").serialize();	
	 				$.post("student/add",form,function(data){
	 					if(data=="ok"){
	 						window.location.reload();
	 					}else{
	 						alert("添加失败");
	 						window.location.reload();
	 					}
	 				},"json");
	 			});
	 		
	
				$(".editEmpBtn").click(function(){
	  				
	  				$.ajax({
	  					url:"student/classes",
	  					async:false,//同步
	  					dataType:"json",
	  					success:function(data){
	  						//清空下拉框中数据
							$("#update select").empty();
							//data表示要遍历的集合或数组
							//index表示下标
							//obj表示各个元素
							$.each(data,function(index,obj){
								//创建option标签
								var option=$("<option value='"+obj.cid+"'>"+obj.cname+"<option/>");
								$("#update select").append(option);
							});
	  					}
	  				
	  				});
	  				$("#update input[type='radio']").attr("checked",false);
					$("#update select option").attr("selected",false);
					
					
					var tr=$(this).parent().parent();
					var sid=$(tr).find("td:eq(0)").text();
					var sname=$(tr).find("td:eq(2)").text();
	  				var age=$(tr).find("td:eq(3)").text();
	  				var birthday=$(tr).find("td:eq(4)").text();
	  				var gender=$(tr).find("td:eq(5)").text();
	  				var genderNum = gender == "男"?1:0;
	  				var cid=$(tr).find("td:eq(6)").text();
	  			
	  				
	  				$("#update input[name='id']").val(sid);
	  				$("#update input[name='name']").val(sname);
	  				$("#update input[name='age']").val(age);
	  				$("#update input[name='date']").val(birthday);
	  				$("#update input[name='gender'][value="+genderNum+"]").attr("checked",true);
	  				//$("#update input[name='gender']").val([genderNum]);
	  				$("#update select[name='classes.cid'] option[value='"+cid+"']").attr("selected",true);
	  				/* $.each($("#update select option"),function(index,obj){
	  					alert(cid == $(obj).val());
	  					if(cid == $(obj).val()){
	  						$(obj).attr("selected",true);
	  					}
	  				}); */
					$("#update").modal("show");
				});
				
	   			 
	   		//对修改按钮绑定事件
	 			$("#updateStu").click(function(){
	 				var form = $("#update form").serialize();
	 				$.post("student/updateStu",form,function(data){
	 					if(data=="ok"){
	 						window.location.reload();
	 					}else{
	 						alert("添加失败");
	 						window.location.reload();
	 					}
	 				},"json");
	 			});
	 			
	   			$(".delEmpBtn").click(function(){
	   					var tr=$(this).parent().parent();
	   					id=$(tr).find("td:eq(0)").text();
	   					$("#deleteEmpModal input[name='id']").val(id);
	   					$("#deleteEmpModal").modal("show");
	   			});
	   			$("#deleteId").click(function(){
	   					
	   					$.post("student/delete","id="+id,function(d){
	   						if(d=="ok"){	
	   							window.location.reload();
	   						}else{
	   							window.location.reload();
	   						}
	   					},"json");
	   			});
		});	