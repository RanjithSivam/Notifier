package com.notifier2.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notifier2.bean.NotebookBean;
import com.notifier2.bean.NotesBean;
import com.notifier2.bean.UserBean;
import com.notifier2.dao.NotebooDAO;
import com.notifier2.dao.NotesDAO;
import com.notifier2.dao.UserDAO;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if(action!=null && action.equals("logout")) {
			req.getSession(false).removeAttribute("user");
			req.getSession(false).invalidate();
			resp.sendRedirect("index.jsp");
		}else{
			doPost(req,resp);
		}
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action) {
		case "add":
			addNotebook(request,response);
			break;
		case "delete":
			deleteNotebook(request,response);
			break;
		case "edit":
			editNotebook(request,response);
			break;
		case "view":
			viewNotebook(request, response);
			break;
		default:
			noteServlet(request,response);
		}
	}

	private void noteServlet(HttpServletRequest request, HttpServletResponse response) {
		String function = request.getParameter("function");
		switch(function) {
		case "add":
			addNote(request,response);
			break;
		case "delete":
			deleteNote(request,response);
			break;
		case "edit":
			editNote(request,response);
			break;
		}
		
	}

	private void editNote(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String tags = request.getParameter("tags");
		int id = Integer.parseInt(request.getParameter("id"));
		Date start_date = null;
		Date end_date = null;
		
		NotesDAO dao = new NotesDAO();
		
		try {
			start_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start_date"));
			end_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end_date"));
			
			NotesBean bean =  new NotesBean();
			bean.setId(id);
			bean.setTitle(title);
			bean.setDescription(description);
			bean.setEnd_date(end_date);
			bean.setStart_date(start_date);
			bean.setTags(tags);
			
			dao.editNote(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewNotebook(request, response);
		
	}

	private void deleteNote(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		NotesDAO dao = new NotesDAO();
		
		try {
			dao.deleteNote(new NotesBean(id));
		}catch(Exception ex) {
			
		}
		
		viewNotebook(request, response);
	}

	private void addNote(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String tags = request.getParameter("tags");
		int notebook_id = Integer.parseInt(request.getParameter("id"));
		Date start_date = null;
		Date end_date = null;
		int user_id = ((UserBean)request.getSession().getAttribute("user")).getId();
		try {
			start_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start_date"));
			end_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("end_date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		NotesBean note = new NotesBean(notebook_id,user_id,title,description,tags,start_date,end_date);
		NotesDAO dao = new NotesDAO();
		try {
			dao.addNote(note);
		}catch(Exception ex) {
			
		}
		
		viewNotebook(request, response);
		
	}

	private void editNotebook(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		int id = Integer.parseInt(request.getParameter("id"));
		
		NotebooDAO dao = new NotebooDAO();
		NotebookBean bean = new NotebookBean(id,title);
		try {
			dao.editNotebook(bean);
		}catch(Exception ex) {
			
		}
		
		viewNotebook(request,response);
	}

	private void deleteNotebook(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		NotebooDAO dao = new NotebooDAO();
		NotebookBean bean = new NotebookBean(id);
		try {
			dao.deleteNotebook(bean);
		}catch(Exception ex) {
			
		}
		
		viewNotebook(request,response);
	}

	private void addNotebook(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		
		NotebookBean bean = new NotebookBean(title,((UserBean) request.getSession().getAttribute("user")).getUsername());
		NotebooDAO dao = new NotebooDAO();
		try {
			dao.addNotebook(bean);
		}catch(Exception ex) {
			
		}
		
		viewNotebook(request,response);
	}

	private void viewNotebook(HttpServletRequest request, HttpServletResponse response) {
		NotebooDAO dao = new NotebooDAO();
		NotesDAO dao1 = new NotesDAO();
		UserDAO dao2 = new UserDAO();
		List<NotebookBean> list = dao.getAll((UserBean)request.getSession().getAttribute("user"));
		List<NotesBean> list1 = dao1.getAll((UserBean)request.getSession().getAttribute("user"));
		
		  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		  String now = dtf.format(LocalDateTime.now()).toString();
		  List<NotesBean> todayList = new ArrayList<>();
		  for(NotesBean x:list1) {
			  if(x.getEnd_date().toString().equals(now)) {
				  todayList.add(x);
			  }
		  }
		  
		  request.setAttribute("badge", todayList);
		request.setAttribute("list", list);
		request.setAttribute("notes", list1);
		request.setAttribute("user", dao2.getUser((UserBean)request.getSession(false).getAttribute("user")));
		try {
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		} catch (Exception e) {
			
		}
	}

}
