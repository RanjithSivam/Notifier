package com.notifier2.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notifier2.bean.UserBean;
import com.notifier2.dao.UserDAO;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/SignupController")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(request.getAttribute("fail")!=null) {
			request.removeAttribute("fail");
		}
		
		UserBean bean = new UserBean(email,fullname,username,password);
		UserDAO dao = new UserDAO();
		try {
			if(dao.addUser(bean)) {
				request.setAttribute("success", "Register successfull");
			}else {
				request.setAttribute("fail", "Register failed!!!");
			}
			
			request.getRequestDispatcher("index.jsp").include(request, response);
		}catch(Exception ex) {
			
		}
	}

}
