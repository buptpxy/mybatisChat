package com.pxy.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.faces.validator.RequiredValidator;
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
public class CommandListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码
		req.setCharacterEncoding("UTF-8");
		// 接受页面的值
		String id = req.getParameter("id");
		QueryService listService = new QueryService();
		// 查询消息列表并传给页面
		req.setAttribute("command", listService.queryById(id).get("command"));
		req.setAttribute("contentList", listService.queryById(id).get("contentList"));
		// 向页面跳转
		req.getRequestDispatcher("/WEB-INF/jsp/back/ContentList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}