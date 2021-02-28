package com.notifier2.bean;

import java.util.Date;

public class NotesBean {
	private int id,notebook_id,user_id;
	private String title,description,tags;
	private Date start_date,end_date;
	
	public NotesBean() {
		
	}
	
	public NotesBean(int id) {
		this.id = id;
	}
	public NotesBean(int notebook_id,int user_id, String title, String description, String tags, Date start_date, Date end_date) {
		this.notebook_id = notebook_id;
		this.user_id = user_id;
		this.title = title;
		this.description = description;
		this.tags = tags;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	public NotesBean(int id, int user_id,int notebook_id, String title, String description, String tags, Date start_date,
			Date end_date) {
		
		this.id = id;
		this.user_id = user_id;
		this.notebook_id = notebook_id;
		this.title = title;
		this.description = description;
		this.tags = tags;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNotebook_id() {
		return notebook_id;
	}
	public void setNotebook_id(int notebook_id) {
		this.notebook_id = notebook_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
}
