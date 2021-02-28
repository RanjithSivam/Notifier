package com.notifier2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.notifier2.bean.NotebookBean;
import com.notifier2.bean.UserBean;
import com.notifier2.database.DBUtil;

public class NotebooDAO {
	
	public List<NotebookBean> getAll(UserBean bean){
		List<NotebookBean> list = new ArrayList<>();
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("select * from notebook where username=?");
			stmt.setString(1, bean.getUsername());
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				String title = set.getString("title");
				String username = set.getString("username");
				int id = set.getInt("id");
				list.add(new NotebookBean(title,username,id));
			}
		}catch(Exception ex) {
			
		}
		
		return list;
	}

	public void addNotebook(NotebookBean bean) {
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("insert into notebook(title,username) values (?,?)");
			stmt.setString(1, bean.getTitle());
			stmt.setString(2, bean.getUsername());
			if(stmt.executeUpdate()> 1) {
				
			}
		}catch(Exception ex) {
			
		}
		
	}

	public boolean deleteNotebook(NotebookBean bean) {
		boolean valid = false;
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("delete from notebook where id=?");
			stmt.setInt(1, bean.getId());
			if(stmt.executeUpdate() > 1) {
				valid = true;
			}
		}catch(Exception ex) {
			
		}
		
		return valid;
	}

	public void editNotebook(NotebookBean bean) {
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("update notebook set title=? where id=?");
			stmt.setString(1, bean.getTitle());
			stmt.setInt(2, bean.getId());
			if(stmt.executeUpdate() > 1) {
				
			}
		}catch(Exception ex) {
			
		}
	}
}
