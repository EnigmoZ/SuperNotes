package com.supernotes.web;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.supernotes.dao.UserDAO;
import com.supernotes.model.UserDetails;

/**
 * Servlet implementation class UserLoginServlet
 */
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		UserDetails userlogin= new UserDetails();
		userlogin.setUsername(username);
		userlogin.setPassword(password);
		
		UserDetails user=(UserDetails)UserDAO.userLoginValidate(userlogin);
		HttpSession session=null;
		if(user!=null)
		{
			session=request.getSession();
			session.setAttribute("userlogin", user);
			response.sendRedirect("userhome.jsp");
		}
		else 
		{
			session=request.getSession();
			session.setAttribute("login-failed", "Invalid Username or Password");
			response.sendRedirect("login.jsp");
		}
	}
}
