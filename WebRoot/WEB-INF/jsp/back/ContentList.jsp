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
		<title>指令列表页面</title>
		<link href="<%= basePath %>resources/css/all.css" rel="stylesheet" type="text/css" />
		<link href="<%= basePath %>resources/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/font-awesome.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/adminia.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/adminia-responsive.css" rel="stylesheet" />
		<link href="<%= basePath %>resources/css/pages/plans.css" rel="stylesheet" />
		<script src="<%=basePath%>resources/js/common/jquery-1.8.0.min.js"></script>
		<script src="<%= basePath %>resources/js/back/list.js"></script>

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
				<hr />
				
				
				
				<br />
		
			</div> <!-- /span3 -->
			<div class="span9">
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					内容列表				
				</h1>
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">指令列表</a>&gt; 内容列表 </div>
							</div> <!-- /widget-header -->
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<form action="<%= basePath %>ContentList.action" id="mainForm" method="post">
			<input type="hidden" name="id" id="id" value="${command.id}"/>
			
			<div class="right">
				
				<div class="rightCont">
					<p class="g_title fix">内容列表 <a class="btn11" href="javascript:deleteBatch('<%=basePath%>');">删 除</a></p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">指令名称：</td>
								<td>
									${command.name}
								</td>
								<td width="90" align="right">描述：</td>
								<td>
									${command.description}
								</td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th width="50px"><input type="checkbox" id="all" onclick=""/></th>
								    <th width="50px">序号</th>
								    <th>指令内容</th>
								    <th width="100px">操作</th>
								</tr>
								<c:forEach items="${contentList}" var="content" varStatus="status">
									<tr  <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
										<td><input type="checkbox"  name="id" value="${content.id}"/></td>
										<td>${status.index + 1}</td>
										<td>${content.content}</td>
										<td>
											
											<a href="${basePath}DeleteOneServlet.action?id=${content.id}">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
				</div>
			</div>
	    </form>
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