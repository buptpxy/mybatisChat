package com.pxy.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pxy.bean.Command;
import com.pxy.bean.CommandContent;
import com.pxy.db.DBAccess;

/**
 * 与指令表对应的数据库操作类
 */
public class CommandDao {
	/**
	 * 根据查询条件查询指令列表
	 */
	public List<Command> queryCommandList(String name,String description) {
		DBAccess dbAccess = new DBAccess();
		List<Command> commandList = new ArrayList<Command>();
		SqlSession sqlSession = null;
		try {
			sqlSession = dbAccess.getSqlSession();
			Command command = new Command();
			command.setName(name);
			command.setDescription(description);
			// 通过sqlSession执行SQL语句
			commandList = sqlSession.selectList("Command.queryCommandList", command);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		return commandList;
	}
	
	
	/**
	 * 根据指令id查询指令列表
	 */
	public List<Command> queryContentList(String id) {
		DBAccess dbAccess = new DBAccess();
		List<Command> commandList = new ArrayList<Command>();
		SqlSession sqlSession = null;
		try {
			sqlSession = dbAccess.getSqlSession();
			Command command = new Command();
			command.setId(id);
			// 通过sqlSession执行SQL语句
			commandList = sqlSession.selectList("Command.queryContentList",command);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		return commandList;
	}
	
	/**
	 * 根据查询条件查询消息列表的条数
	 */
	public int count(Command command) {
		DBAccess dbAccess = new DBAccess();
		SqlSession sqlSession = null;
		int result = 0;
		try {
			sqlSession = dbAccess.getSqlSession();
			// 通过sqlSession执行SQL语句
			
			
			result = sqlSession.selectOne("Command.count", command);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		return result;
	}
	
	/**
	 * 根据查询条件分页查询消息列表
	 */
	public List<Command> queryCommandListByPage(Map<String,Object> parameter) {
		DBAccess dbAccess = new DBAccess();
		List<Command> commandList = new ArrayList<Command>();
		SqlSession sqlSession = null;
		try {
			sqlSession = dbAccess.getSqlSession();
			// 通过sqlSession执行SQL语句
			
			commandList = sqlSession.selectList("Command.queryCommandListByPage", parameter);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		return commandList;
	}
	
	/**
	 * 单条新增
	 */
	public void insertOne(Command command){
		DBAccess dbAccess = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = dbAccess.getSqlSession();
			// 通过sqlSession执行SQL语句
			sqlSession.insert("Command.insertOne", command);
			sqlSession.commit();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
	}
	
	/**
	 * 单条删除
	 */
	public void deleteOne(int id){
		DBAccess dbAccess = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = dbAccess.getSqlSession();
			// 通过sqlSession执行SQL语句
			sqlSession.delete("Command.deleteOne", id);
			sqlSession.commit();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
	}
}
