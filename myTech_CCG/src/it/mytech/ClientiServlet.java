package it.mytech;

import java.io.IOException;
import java.io.ObjectInputFilter.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientiServlet
 */
@WebServlet("/clienti")
public class ClientiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClientiServlet() {
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

				ConfigMailManager cmm = new ConfigMailManager();
				cmm.sendProfiloCancellato(db.getEmail(id));
				db.deleteCliente(id);
				db.close();
				response.sendRedirect("clienti.jsp");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
