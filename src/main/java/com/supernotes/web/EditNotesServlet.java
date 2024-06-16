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


/**
 * Servlet implementation class EditNotesServlet
 */
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNotesServlet() {
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
		int noteid=Integer.parseInt(request.getParameter("noteid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		int status=UserDAO.updateNotes(noteid, title, content);
		if(status>0)
		{
			System.out.println("record updated");
			HttpSession session=request.getSession();
			session.setAttribute("update-msg", "Notes Updated Successfully");
			response.sendRedirect("shownotes.jsp");
		}
		else
		{
			System.out.println("record not updated");
		}
	}

}
