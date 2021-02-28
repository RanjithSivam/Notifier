package com.notifier2.bean;

public class UserBean {
	
	private int id;
	private String email,name,username,password,phone;

	public UserBean(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public UserBean(int id,String email, String name, String username, String phone) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.username = username;
		this.phone = phone;
	}

	public UserBean(int id, String email, String name, String username, String password, String phone) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.username = username;
		this.password = password;
		this.phone = phone;
	}

	public UserBean(String email, String name, String username, String password) {
		this.email = email;
		this.name = name;
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
