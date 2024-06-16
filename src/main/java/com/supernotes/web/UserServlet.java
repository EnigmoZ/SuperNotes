package com.supernotes.web;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.supernotes.model.UserDetails;
import com.supernotes.dao.UserDAO;
/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		String fullname= request.getParameter("fullname");
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		
		UserDetails user= new UserDetails();
		user.setFullname(fullname);
		user.setUsername(username);
		user.setPassword(password);
		
		int status= UserDAO.addUser(user);
		HttpSession session=null;
		if(status>0)
		{
			session=request.getSession();
			session.setAttribute("reg-success", "Registraion Successful!!");
			response.sendRedirect("register.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("failed-msg", "The Email is Already registered! Use another");
			response.sendRedirect("register.jsp");
		}
	}

}
