package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Date;



import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.entities.Note;
import com.helper.FactoryProvider;



/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		
		PrintWriter writer=response.getWriter();
		
		//title, content, fetch
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Note note=new Note(title, content, new Date());
		Session session = FactoryProvider.getFactory().openSession();
		Transaction transaction=session.beginTransaction();
		session.save(note);
		transaction.commit();
		writer.print("<h1 style='text-align:center;'> Note is added Successfully</h1>");
		writer.print("<h1 style='text-align:center;'> <a href='all_notes.jsp'>View all Notes</a></h1>");
		session.close();
		
		
	}

}
