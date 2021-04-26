package it.mytech;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProdottiServlet
 */
@WebServlet("/dipendenti")
public class DipendentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DipendentiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String comando = request.getParameter("cmd");
		int id;
		if (comando.equals("elimina")) {
			id = Integer.parseInt(request.getParameter("id"));
			try {
				DBManager db = new DBManager();
				db.deleteDipendente(id);
				db.close();
				response.sendRedirect("dipendenti.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DBManager db;
		Amministratore a = new Amministratore();
		String cmd = request.getParameter("cmd");
		a.setId(Integer.parseInt(request.getParameter("id")));
		a.setCognome(request.getParameter("cognome"));
		a.setNome(request.getParameter("nome"));
		a.setEmail(request.getParameter("email"));
		a.setPassword(request.getParameter("password"));
		a.setRuolo(request.getParameter("ruolo"));
		a.setStipendio(Float.parseFloat(request.getParameter("stipendio")));
		a.setManager(false);
		if (cmd.equals("add")) {
			try {
				db = new DBManager();
				db.addDipendente(a);
				db.close();
				response.sendRedirect("dipendenti.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (cmd.equals("modifica")) {
			try {
				db = new DBManager();
				db.updateDipendente(a);
				db.close();
				response.sendRedirect("dipendenti.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
