<%@page import="com.danlu.versiontool.vo.UserInfo"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>需求版本管理系统</title>
		<link href="<%=basePath%>js/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
		<script src="<%=basePath%>js/common.js"></script>
		<script src="<%=basePath%>js/bootstrap/js/bootstrap.js"></script>
		<script src="<%=basePath%>/js/bootstrap-datetimepicker.min.js"></script>
		<script src="<%=basePath%>/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<style>
			.badge{
				background-color: #337ab7;
			}
		</style>
	</head>
	<body>
		<!-- 主容器-->
		<div class="main-content" style="width: 1950px;">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="background-color:#337ab7;color: #ffffff;">
					<h1>需求版本管理系统</h1>
					<%
						UserInfo userInfo = (UserInfo)session.getAttribute("usersession");
					%>
					<span style="float:right;">用户名：<%=userInfo.getUserName() %>&nbsp;&nbsp;<a style="color:red;" href="/dlversionmanage/login/loginin">退出</a></span>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row" style="margin-top: 20px">
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked" role="tablist">
						<li role="presentation" class="active"><a href="<%=basePath%>index/index">需求管理</a></li>
						<%if(userInfo.getUserLevel() == 2 || userInfo.getUserLevel() == 3){ %>
						<li role="presentation"><a href="<%=basePath%>index/requirementAudit">需求审批管理</a></li>
						<%} %>
						<li role="presentation"><a href="<%=basePath%>index/versions">版本管理</a></li>
						<%if(userInfo.getUserLevel() == 3){ %>
							<li role="presentation"><a href="<%=basePath%>index/users">用户管理</a></li>
						<%} %>
						<li role="presentation"><a href="<%=basePath%>index/setting">个人设置</a></li>
					</ul>				
				</div>
				<div class="col-md-6" >
					<div class="row">
						<button type="button" id="createRequirement" class="btn btn-warning">创建需求</button>
					</div><br>
					<div class="row">
						<table id="requirementInfos" class="table table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>需求名称</th>
									<th>版本号</th>
									<th>状态</th>
									<th>审批说明</th>
									<th>需求链接</th>
									<th>更新人</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
					<div class="row">
					  <ul class="pagination">
					  	<li><a href="javascript:void(0)">当前第<font id="pageNow">1</font>页</a></li>
					    <li><a href="javascript:void(0)" id="pageFirst">&lt;&lt;</a></li>
					    <li><a href="javascript:void(0)" id="pageLeft">&lt;</a></li>
					    <li><a href="javascript:void(0)" id="pageRight">&gt;</a></li>
					    <li><a href="javascript:void(0)" id="pageLast">&gt;&gt;</a></li>
					    <li><a href="javascript:void(0)">共<font id="pageTotal">1</font>页</a></li>
					  </ul>
					</div>
					<div class="alert alert-danger" role="alert">
						小版本<br> 
						&nbsp;&nbsp;- 每周四发版<br>
						&nbsp;&nbsp;-  丹露项目负责人如果确定要在第n个周四发版，需要将过qa的时间最迟提前两个工作日<br>
						&nbsp;&nbsp;- 华信项目负责人如果确定要在第n个周四发版，需要将验收的时间最迟提前八个工作日<br>
						&nbsp;&nbsp;- 小版本采取第三位自增的方式进行
						<br>
						<br>
						大版本<br>
						&nbsp;&nbsp;-发版时间由当期的重大项目决定（版本号以及时间由版本经理 和各部门经理以及CTO商量决定）<br>    
						&nbsp;&nbsp;- 如果有延期需求，版本分支跟延期需求走
         			</div>
				</div>
        	</div>
        	<div class="modal fade" id="createRequirementInfo">
		  		<div class="modal-dialog" style="width: 700px;margin-top:200px">
		    		<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title">创建需求</h4>
				      </div>
				      <div class="modal-body" style="max-height: 800px;overflow-y: auto;">
					      	<div class="col-md-3"></div>
					      	<div class="col-md-6 input-group">
								<span class="input-group-addon" id="sizing-addon1">需求名称</span>
								<input id="requirementName" type="text" class="form-control" placeholder="需求名称" aria-describedby="sizing-addon1">
							</div>
							<br>
							<div class="col-md-3"></div>
					      	<div class="col-md-6 input-group">
								<span class="input-group-addon" id="sizing-addon1">需求链接</span>
								<input id="requirementUrl" type="text" class="form-control" placeholder="需求链接" aria-describedby="sizing-addon1">
							</div>
							<br>
							<div class="col-md-3"></div>
							<div class="col-md-6 input-group">
								<span class="input-group-addon" id="sizing-addon1">版本名称</span>
								<select style="width: 150px;height:30px" id="versionName" name="branch"></select>
							</div>
				      </div>
				      <div class="modal-footer">
						<button type="button" id="saveRequirement" class="btn btn-default">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      </div>
		    		</div><!-- /.modal-content -->
		  		</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
			<div class="modal fade" id="editRequirementInfo">
		  		<div class="modal-dialog" style="width: 700px;margin-top:200px">
		    		<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title">编辑需求</h4>
				      </div>
				      <div class="modal-body" style="max-height: 800px;overflow-y: auto;">
					      	<div class="col-md-3"></div>
					      	<div class="col-md-6 input-group">
								<span class="input-group-addon" id="sizing-addon1">需求名称</span>
								<input id="requirementNameForEdit" type="text" class="form-control" placeholder="需求名称" aria-describedby="sizing-addon1">
							</div>
							<br>
							<div class="col-md-3"></div>
					      	<div class="col-md-6 input-group">
								<span class="input-group-addon" id="sizing-addon1">需求链接</span>
								<input id="requirementUrlForEdit" type="text" class="form-control" placeholder="需求链接" aria-describedby="sizing-addon1">
							</div>
							<br>
							<div class="col-md-3"></div>
							<div class="col-md-6 input-group">
								<span class="input-group-addon" id="sizing-addon1">版本名称</span>
								<select style="width: 150px;height:30px" id="versionNameForEdit" name="branch"></select>
							</div>
				      </div>
				      <div class="modal-footer">
						<button type="button" id="saveRequirementForEdit" class="btn btn-default">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      </div>
		    		</div><!-- /.modal-content -->
		  		</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
         </div>
         
	</body>
	<script>
		$("#pageFirst").click(function(){
			if ($("#pageNow").html() == 1) {
				alert("已经在第1页");
				return;
			}
			$("#pageNow").html(1);
			viewRequirements();
		});
		
		$("#pageLeft").click(function(){
			if ($("#pageNow").html() == 1) {
				alert("已经在第1页");
				return;
			}
			$("#pageNow").html(parseInt($("#pageNow").html()) - 1);
			viewRequirements();
		});
		
		$("#pageLast").click(function(){
			if ($("#pageNow").html() == $("#pageTotal").html()) {
				alert("已经在最后一页");
				return;
			}
			$("#pageNow").html($("#pageTotal").html());
			viewRequirements();
		});
		
		$("#pageRight").click(function(){
			if ($("#pageNow").html() == $("#pageTotal").html()) {
				alert("已经在最后一页");
				return;
			}
			$("#pageNow").html(parseInt($("#pageNow").html()) + 1);
			viewRequirements();
		});
		
		function viewRequirements(){
			$.ajax({
				url : '/dlversionmanage/requirement/getRequirementInfos/'+$("#pageNow").html(),//获取所有版本
				type : 'get',
				dataType : 'json',
				contentType: "application/json",
				success : function(data) {
					if (data.code == "success") {
						$("#pageNow").html(data.data.curPage);
						$("#pageTotal").html(data.data.amount);
						$("#requirementInfos tbody").empty()
						for (var i=0; i<data.data.data.length; i++) {
							var item = data.data.data[i];
							var statusColor = "";
							if (item.requirementStatus == 3) {
								statusColor = "color:red;";
							} else if (item.requirementStatus == 2) {
								statusColor = "color:blue;";
							}
							var updateUserName = item.updateUserName==null?item.userName:item.updateUserName;
							$("#requirementInfos tbody").append('<tr>'
									+'<td>'+item.id+'</td>'
									+'<td>'+item.requirementName+'</td>'
									+'<td>'+item.versionName+'</td>'
									+'<td style="'+statusColor+'width:80px;">'+item.requirementStatusStr+'</td>'
									+'<td style="width:80px;">'+(item.comment == null ? "" : item.comment)+'</td>'
									+'<td><a target="_blank" href="'+item.requirementUrl+'">'+item.requirementUrl+'</a></td>'
									+'<td style="width:60px;">'+updateUserName+'</td>'
									+'<td style="width:100px;">'+item.updateTimeStr+'</td>'
									+'<td style="width:50px;"><a href=javascript:void(0) onclick=editRequirementInfo("' + item.id + '")>编辑</a></td>'
								+'</tr>');
						}
					} else {
						alert("获取需求信息出错，请稍候重试！");
					}
				},
				error : function(data) {
					alert("获取需求信息异常，请稍候重试！");
				}
			});
		}
	
		$(function(){
			viewRequirements();
		})
		
		$("#createRequirement").click(function(){
			$("#createRequirementInfo").modal("show");
		})
		
		$(function() {
	     $.ajax({
	         type: 'get',
	         url: '/dlversionmanage/version/getValidVersionInfos',
	         dataType: 'json',
	         contentType: "application/json",
	         success: function(data) {
	        	 if (data.code == "success") {
	        		 if (data.data.length > 0) {
	        			 for (i = 0; i < data.data.length; i++) {
	        				 var item = data.data[i];
	    	                 $("#versionName").append("<option value="+item.id+ ">" + item.versionName + "</option>").attr("value", item.id);
	    	                 $("#versionNameForEdit").append("<option value=" + item.id + ">" + item.versionName + "</option>").attr("value", item.id);
	    	             }
	        		 }
	        	 }else {
					alert("获取版本名称出错，请稍候重试！");
				}
	         },
			error : function(data) {
				alert("获取版本名称异常，请稍候重试！");
			}
	     });
	 })
		
		$("#saveRequirement").click(function(){
			var requirementName = $("#requirementName").val()
			if(requirementName == ""){
				alert("需求名称不能为空！");
				return;
			}
			$.ajax({
				type : 'post',
				url : '/dlversionmanage/requirement/saveRequirement',
				data : {
					requirementName: $("#requirementName").val(),
					requirementUrl: $("#requirementUrl").val(),
					versionName: $("#versionName").find("option:selected").text(),
					versionId:$("#versionName").val()
				},
				dataType : 'json',
				success : function(data) {
					if (data.code == "success") {
						$("#createVersionInfo").modal("hide");
						window.location.href=window.location.href;
					} else {
						alert("创建需求出错，请稍候重试！");
					}
				},
				error : function(data) {
					alert("创建需求异常，请稍候重试！");
				}
			});
		})
		
		function editRequirementInfo(requirementId){
			$.ajax({
				type : 'get',
				url : '/dlversionmanage/requirement/getRequirementInfoById/'+requirementId,	
				dataType : 'json',
				contentType: "application/json",
				success : function(data) {
					if (data.code == "success") {
						if (data.data != null) {
							var item = data.data;
							$("#requirementNameForEdit").val(item.requirementName);
							$("#requirementUrlForEdit").val(item.requirementUrl);
							$("#versionNameForEdit").val(item.versionId);
							}
						$("#editRequirementInfo").modal("show");
					} else {
						alert("编辑需求出错，请稍候重试！");
					}
				},
				error : function(data) {
					alert("编辑需求异常，请稍候重试！");
				}
			});
			
			$("#saveRequirementForEdit").click(function(){
				var requirementName = $("#requirementNameForEdit").val()
				if(requirementName == ""){
					alert("需求名称不能为空！");
					return;
				}
				$.ajax({
					type : 'post',
					url : '/dlversionmanage/requirement/updateRequirementInfo',
					data : {
						requirementId:requirementId,
						requirementName: $("#requirementNameForEdit").val(),
						requirementUrl: $("#requirementUrlForEdit").val(),
						versionId: $("#versionNameForEdit").val(),
						versionName: $("#versionNameForEdit").find("option:selected").text()
					},
					dataType : 'json',
					success : function(data) {
						if (data.code == "success") {
							$("#editRequirementInfo").modal("hide");
							window.location.href=window.location.href;
						} else {
							alert("编辑需求出错，请稍候重试！");
						}
					},
					error : function(data) {
						alert("编辑需求异常，请稍候重试！");
					}
				});
			})
		}
		
	</script>
</html>