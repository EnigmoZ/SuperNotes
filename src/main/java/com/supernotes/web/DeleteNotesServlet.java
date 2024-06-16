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
 * Servlet implementation class DeleteNotesServlet
 */
public class DeleteNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNotesServlet() {
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
		int noteid=Integer.parseInt(request.getParameter("note_id"));
		System.out.println("Note id"+noteid);
		int status=UserDAO.deleteNotes(noteid);
		HttpSession session=null;
		if(status>0)
		{
			session=request.getSession();
			session.setAttribute("delete-msg", "Notes Deleted Successfully");
			response.sendRedirect("shownotes.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("wrong-msg", "Something went wrong on server");
			response.sendRedirect("shownotes.jsp");
		}
	}

}
