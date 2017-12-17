<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE" />
		<title>内容列表页面</title>
		<link href="<%= basePath %>resources/css/all.css" rel="stylesheet" type="text/css" />
		<link href="<%= basePath %>resources/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/font-awesome.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/adminia.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/adminia-responsive.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/pages/plans.css" rel="stylesheet" />
		<script src="<%=basePath%>resources/js/common/jquery-1.8.0.min.js"></script>
		<script src="<%= basePath %>resources/js/back/list.js"></script>
		<script src="<%= basePath %>resources/js/common/bootstrap.js"></script>
	</head>
	<body>
		<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			
			<a class="brand" href="./">后台管理系统</a>
			
			<div class="nav-collapse">
			
				<p class="nav pull-right">
					<span class="badge badge-warning">Pxy</span>	
				</p>
				
			</div> <!-- /nav-collapse -->
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->




<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<div class="span3">
				
				<div class="account-container">
				
					<div class="account-avatar">
						<img src="<%= basePath %>resources/images/18.jpg" alt="" class="thumbnail" />
					</div> <!-- /account-avatar -->
				
					<div class="account-details">
					
						<span class="account-name">Pxy</span>
						
						<span class="account-role">管理员</span>
						
						
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="width:100%">
					
					
					<li>
						<a href="<%= basePath %>List.action">
							<i class="icon-th-list"></i>
							指令列表		
						</a>
					</li>
					
					<li>
						<a href="<%= basePath %>ToAddCommand.action">
							<i class="icon-pushpin"></i>
							新增指令
						</a>
					</li>
					
				</ul>	
				
				
				
				
		
			</div> <!-- /span3 -->
			
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					新增指令				
				</h1>
				
				
				<div class="row">
					
					<div class="span9">
				
						<div class="widget">
							
							<div class="widget-header">
								<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">新增指令</a> </div>
							</div> <!-- /widget-header -->
									
							<div class="widget-content">
								
								
								
								<div class="tabbable">
						
						
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								<form  class="form-horizontal" action="<%= basePath %>AddCommand.action" id="mainForm" method="post"/>
									<fieldset>
										
										<div class="control-group">											
											<label class="control-label" for="name">指令名称</label>
											<div class="controls">
												
												<input name="name" type="text" id="name" class="input-medium" value="${name}"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" for="description">描述</label>
											<div class="controls">
												<input name="description" type="text" id="description" class="input-medium" value="${description}"/>
												
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->

										<div class="control-group">											
											<label class="control-label" >内容</label>
											<div class="controls">
												
											<textarea name="content" class="input-medium" id="text" style="width:100%" rows="5" value="${content}"></textarea>
							
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->


											<div class="form-actions">
												
												<input type="submit" class="btn btn-primary" value="提交" />
												<input type="reset" class="btn" value="重置" />
											</div>
										</fieldset>
									</form>
								</div>
								
							</div>
						  
						  
						</div>
								
								
								
								
								
								
								
								
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
				
				
				
				
				
				
				
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	
</div> <!-- /footer -->
	</body>
</html>