package com.pxy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.pxy.bean.Command;
import com.pxy.bean.CommandContent;
import com.pxy.dao.CommandDao;
import com.pxy.entity.Page;
import com.pxy.util.Iconst;

/**
 * 查询相关的业务功能
 */
public class QueryService {
	/*public List<Command> queryCommandList(String name,String description) {
		// 组织消息对象
		Command command = new Command();
		command.setName(name);
		command.setDescription(description);
		CommandDao commandDao = new CommandDao();
		// 根据条件查询条数
		int totalNumber = commandDao.count(command);
		// 组织分页查询参数
		page.setTotalNumber(totalNumber);
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("command", command);
		parameter.put("page", page);
		// 分页查询并返回结果
		return commandDao.queryCommandList(parameter);
	}*/
	
	/**
	 * 根据查询条件分页查询消息列表
	 */
	public List<Command> queryCommandListByPage(String name,String description,Page page) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		// 组织消息对象
		Command command = new Command();
		command.setName(name);
		command.setDescription(description);
		parameter.put("command", command);
		parameter.put("page", page);
		CommandDao commandDao = new CommandDao();
		// 分页查询并返回结果
		return commandDao.queryCommandListByPage(parameter);
	}
	
	
	/**
	 * 通过指令查询自动回复的内容
	 * @param command 指令
	 * @return 自动回复的内容
	 */
	public String queryByCommand(String command) {
		CommandDao commandDao = new CommandDao();
		List<Command> commandList;
		if(Iconst.HELP_COMMAND.equals(command)) {
			commandList = commandDao.queryCommandList(null, null);
			StringBuilder result = new StringBuilder();
			for(int i = 0; i < commandList.size(); i++) {
				if(i != 0) {
					result.append("<br/>");
				}
				result.append("回复[" + commandList.get(i).getName() + "]可以查看" + commandList.get(i).getDescription());
			}
			return result.toString();
		}
		commandList = commandDao.queryCommandList(command,null);
		if(commandList.size() > 0) {
			List<CommandContent> contentList = commandList.get(0).getContentList();
			int i = new Random().nextInt(contentList.size());
			return contentList.get(i).getContent();
		}
		return Iconst.NO_MATCHING_CONTENT;
	}
	
	/**
	 * 通过指令id查询内容
	 * @param id
	 * @return 指令的内容
	 */
	public Map<String, Object> queryById(String id) {
		Map<String, Object> parameter = new HashMap<>();
		CommandDao commandDao = new CommandDao();
		List<Command> commandList;
		commandList = commandDao.queryContentList(id);
		if(commandList.size() > 0) {
			Command command = commandList.get(0);
			List<CommandContent> contentList = command.getContentList();
			parameter.put("command", command);
			parameter.put("contentList", contentList);
		}
		return parameter;
	}
}
