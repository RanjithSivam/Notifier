package com.notifier2.bean;

public class NotebookBean {
	private String title,username;
	private int id;
	public NotebookBean(int id) {
		this.id = id;
	}
	public NotebookBean(String title, String username, int id) {
		this.title = title;
		this.username = username;
		this.id = id;
	}
	public NotebookBean(String title, String username) {
		this.title = title;
		this.username = username;
	}
	public NotebookBean(int id,String title) {
		this.title = title;
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
