package com.pxy.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pxy.entity.Page;
import com.pxy.service.QueryService;

/**
 * 列表页面初始化和查询控制
 */
@SuppressWarnings("serial")
public class ListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码
		req.setCharacterEncoding("UTF-8");
		// 接受页面的值
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		String currentPage = req.getParameter("currentPage");
		// 创建分页对象
		Page page = new Page();
		Pattern pattern = Pattern.compile("[0-9]{1,9}");
		if(currentPage == null ||  !pattern.matcher(currentPage).matches()) {
			page.setCurrentPage(1);
		} else {
			page.setCurrentPage(Integer.valueOf(currentPage));
		}
		QueryService listService = new QueryService();
		// 查询消息列表并传给页面
		req.setAttribute("commandList", listService.queryCommandListByPage(name, description,page));
		// 向页面传值
		req.setAttribute("name", name);
		req.setAttribute("description", description);
		req.setAttribute("page", page);
		// 向页面跳转
		req.getRequestDispatcher("/WEB-INF/jsp/back/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}