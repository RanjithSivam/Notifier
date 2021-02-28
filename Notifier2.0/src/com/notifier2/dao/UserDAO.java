package com.notifier2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.notifier2.bean.UserBean;
import com.notifier2.database.DBUtil;

public class UserDAO {
	public UserBean getUser(UserBean bean) {
		UserBean user = null;
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("select * from user where username=? and password=?");
			stmt.setString(1,bean.getUsername());
			stmt.setString(2, bean.getPassword());
			ResultSet result = stmt.executeQuery();
			if(result.next()) {
				int id = result.getInt("id");
				String username = result.getString("username");
				String fullname = result.getString("fullname");
				String email = result.getString("email");
				String phone = result.getString("phone");
				String password = result.getString("password");
				user = new UserBean(id,email,fullname,username,password,phone);
			}
		}catch(Exception ex) {
			
		}
		
		return user;
	}
	
	public boolean addUser(UserBean bean) {
		boolean valid = false;
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("insert into user(fullname,username,email,password) values (?,?,?,?)");
			stmt.setString(1,bean.getName());
			stmt.setString(2, bean.getUsername());
			stmt.setString(3, bean.getEmail());
			stmt.setString(4, bean.getPassword());
			int result = stmt.executeUpdate();
			if(result > 0)
				valid = true;
		}catch(Exception ex) {
			
		}
		
		return valid;
	}

	public void editUser(UserBean bean) {
		try(Connection conn = DBUtil.getConnection();){
			PreparedStatement stmt = conn.prepareStatement("update user set fullname=?,username=?,email=?,password=?,phone=? where id=?");
			stmt.setString(1, bean.getName());
			stmt.setString(2, bean.getUsername());
			stmt.setString(3, bean.getEmail());
			stmt.setString(4, bean.getPassword());
			stmt.setString(5, bean.getPhone());
			stmt.setInt(6, bean.getId());
			if(stmt.executeUpdate() > 1) {
				
			}
		}catch(Exception ex) {
			
		}
	}
}
