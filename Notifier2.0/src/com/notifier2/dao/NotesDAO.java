package com.notifier2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.notifier2.bean.NotesBean;
import com.notifier2.bean.UserBean;
import com.notifier2.database.DBUtil;

public class NotesDAO {
	
	public List<NotesBean> getAll(UserBean bean){
		List<NotesBean> output = new ArrayList<>();
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("select * from notes where user_id=?");
			stmt.setInt(1, bean.getId());
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				String description = rs.getString("description");
				String tags = rs.getString("tags");
				int id = rs.getInt("id");
				int user_id = rs.getInt("user_id");
				int notebook_id = rs.getInt("notebook_id");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				output.add(new NotesBean(id,user_id,notebook_id,title,description,tags,start_date,end_date));
			}
		}catch(Exception ex) {
			
		}
		return output;
	}
	
	public void addNote(NotesBean bean) {
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("insert into notes(title,description,start_date,end_date,tags,notebook_id,user_id) values (?,?,?,?,?,?,?)");
			stmt.setString(1, bean.getTitle());
			stmt.setString(2, bean.getDescription());
			stmt.setDate(3, new java.sql.Date(bean.getStart_date().getTime()));
			stmt.setDate(4, new java.sql.Date(bean.getEnd_date().getTime()));
			stmt.setString(5, bean.getTags());
			stmt.setInt(6, bean.getNotebook_id());
			stmt.setInt(7, bean.getUser_id());
			if(stmt.executeUpdate() > 1) {
				
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public void deleteNote(NotesBean bean) {
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("delete from notes where id=?");
			stmt.setInt(1, bean.getId());
			if(stmt.executeUpdate() > 1) {
				
			}
		}catch(Exception ex) {
			
		}
	}

	public void editNote(NotesBean bean) {
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("update notes set title=?,description=?,tags=?,start_date=?,end_date=? where id=?");
			stmt.setString(1, bean.getTitle());
			stmt.setString(2, bean.getDescription());
			stmt.setString(3, bean.getTags());
			stmt.setDate(4, new java.sql.Date(bean.getStart_date().getTime()));
			stmt.setDate(5, new java.sql.Date(bean.getEnd_date().getTime()));
			stmt.setInt(6, bean.getId());
			
			if(stmt.executeUpdate() > 1) {
				
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
