package com.pxy.service;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import com.pxy.bean.Command;
import com.pxy.bean.CommandContent;
import com.pxy.dao.CommandContentDao;
import com.pxy.dao.CommandDao;



/**
 * 维护相关的业务功能
 */
public class MaintainService {
	/**
	 * 单条删除内容
	 */
	public void deleteOneContent(String id) {
		if(id != null && !"".equals(id.trim())) {
			Object[] options = { "是", "取消" }; 
			int res = JOptionPane.showOptionDialog(null, "确定删除此内容？", "警告", 
			JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, 
			null, options, options[0]);
			if(res==0){
				CommandContentDao commandContentDao = new CommandContentDao();
				commandContentDao.deleteOne(Integer.valueOf(id));
			}
			
		}
	}
	
	/**
	 * 单条删除指令
	 */
	public void deleteOneCommand(String id) {
		if(id != null && !"".equals(id.trim())) {
			CommandDao commandDao = new CommandDao();
			List<Command> commandList = commandDao.queryContentList(id);
			List<CommandContent> commandContentList = commandList.get(0).getContentList();
			if (commandContentList.size()>0) {
				JOptionPane.showMessageDialog(null, "请先删除指令下的所有内容,再删除指令!", "警告",JOptionPane.WARNING_MESSAGE);
				}else {
					Object[] options = { "是", "取消" }; 
					int res = JOptionPane.showOptionDialog(null, "确定删除此条指令？", "警告", 
					JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, 
					null, options, options[0]);
					if(res==0){
						commandDao.deleteOne(Integer.valueOf(id));
					}
			}
		}
	}
	
	/**
	 * 批量删除内容
	 */
	public void deleteBatchContent(String[] ids) {
		CommandContentDao commandContentDao = new CommandContentDao();
		List<Integer> idList = new ArrayList<Integer>();
		for(String id : ids) {
			idList.add(Integer.valueOf(id));
		}
		Object[] options = { "是", "取消" }; 
		int res = JOptionPane.showOptionDialog(null, "确定删除这些内容？", "警告", 
		JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, 
		null, options, options[0]);
		if(res==0){
			commandContentDao.deleteBatch(idList);
		}
	}
	
	
	
	/**
	 * 单条增加指令
	 */
	public void insertOneCommand(String name,String description,String content) {
		Command command = new Command();
		CommandContent commandContent = new CommandContent();
		command.setName(name);
		command.setDescription(description);
		if(name != null && !"".equals(name.trim())) {
			CommandDao commandDao = new CommandDao();
			commandDao.insertOne(command);	
		}
		String commandId = command.getId();
		commandContent.setCommandId(commandId);
		commandContent.setContent(content);
		if(commandId != null && !"".equals(commandId.trim())) {
			CommandContentDao commandContentDao = new CommandContentDao();
			commandContentDao.insertOne(commandContent);
		}
	}
	
	/**
	 * 单条增加内容
	 */
	public void insertOneContent(String content,String commandId) {
		
		CommandContent commandContent = new CommandContent();
		commandContent.setCommandId(commandId);
		commandContent.setContent(content);
		if(commandId != null && !"".equals(commandId.trim())) {
			CommandContentDao commandContentDao = new CommandContentDao();
			commandContentDao.insertOne(commandContent);
		}
	}
	
}
