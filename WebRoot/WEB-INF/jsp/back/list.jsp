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
						<a href="<%= basePath %>List.action" >
							<i class="icon-th-list"></i>
							指令列表		
						</a>
					</li>
					
					<li>
						<a href="<%= basePath %>ToAddCommand.action" >
							<i class="icon-pushpin"></i>
							新增指令
						</a>
					</li>
					
				</ul>	
				
				
				
				
				
		
			</div> <!-- /span3 -->
			<div class="span9">
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					指令列表				
				</h1>
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">指令列表</a> </div>
							</div> <!-- /widget-header -->
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<form action="<%= basePath %>List.action" id="mainForm" method="post">
			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>
			
			<div class="right">
				
				<div class="rightCont">
					<p class="g_title fix"> <a class="btn03" href="${basePath}ToAddCommand.action">新 增指令</a></p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">指令名称：</td>
								<td>
									<input name="name" type="text" class="allInput" value="${name}"/>
								</td>
								<td width="90" align="right">描述：</td>
								<td>
									<input name="description" type="text" class="allInput" value="${description}"/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="btn btn-primary" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th><input type="checkbox" id="all" onclick=""/></th>
								    <th>序号</th>
								    <th>指令名称</th>
								    <th>描述</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${commandList}" var="command" varStatus="status">
									<tr  <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
										<td><input type="checkbox"  name="id" value="${command.id}"/></td>
										<td>${status.index + 1}</td>
										<td>${command.name}</td>
										<td>${command.description}</td>
										<td>
											<a href="${basePath}ContentList.action?id=${command.id}">查看</a>
											<a href="${basePath}DeleteOneCommandServlet.action?id=${command.id}">删除</a>
											<a href="${basePath}ToAddContent.action?id=${command.id}">新增内容</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class='page fix'>
							共 <b>${page.totalNumber}</b> 条
							<c:if test="${page.currentPage != 1}">
								<a href="javascript:changeCurrentPage('1')" class='first'>首页</a>
								<a href="javascript:changeCurrentPage('${page.currentPage-1}')" class='pre'>上一页</a>
							</c:if>
							当前第<span>${page.currentPage}/${page.totalPage}</span>页
							<c:if test="${page.currentPage != page.totalPage}">
								<a href="javascript:changeCurrentPage('${page.currentPage+1}')" class='next'>下一页</a>
								<a href="javascript:changeCurrentPage('${page.totalPage}')" class='last'>末页</a>
							</c:if>
							跳至&nbsp;<input id="currentPageText" type='text' value='${page.currentPage}' class='allInput w28' />&nbsp;页&nbsp;
							<a href="javascript:changeCurrentPage($('#currentPageText').val())" class='go'>GO</a>
						</div>
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