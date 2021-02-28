package com.notifier2.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.notifier2.bean.UserBean;
import com.notifier2.dao.UserDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action==null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			if(request.getAttribute("success")!=null) {
				request.removeAttribute("success");
			}
			
			UserBean bean = new UserBean(username,password);
			UserDAO dao = new UserDAO();
			
			try {
				UserBean user = dao.getUser(bean);
				if(user!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					session.setMaxInactiveInterval(60*60);
					response.sendRedirect(request.getContextPath()+"/DashboardServlet?action=view");
				}else {
					request.setAttribute("fail", "Invalid user!!!");
					request.getRequestDispatcher("index.jsp").include(request, response);
				}
			}catch(Exception ex) {
				
			}
		}else {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String name = request.getParameter("name");
			int id = Integer.parseInt(request.getParameter("id"));
			UserBean bean = new UserBean(id,email,name,username,password,phone);
			UserDAO dao = new UserDAO();
			dao.editUser(bean);
			
			response.sendRedirect(request.getContextPath()+"/DashboardServlet?action=view");
		}
	}

}
