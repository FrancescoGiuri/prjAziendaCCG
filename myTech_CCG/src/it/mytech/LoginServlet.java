package it.mytech;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		int tipo = Integer.parseInt(request.getParameter("tipo"));
		String t = "";
		if (tipo == 1) {
			t = "manager";
		} else if (tipo == 2) {
			t = "dipendente";
		} else {
			t = "cliente";
		}
		try {
			DBManager db = new DBManager();
			if (db.verificaCredenziali(email, password, t)) {
				if (tipo == 1) {
					Manager m = db.getManager(email);
					request.getSession().setAttribute("SESSION_USERNAME", m.getNome());
				} else if (tipo == 2) {
					Dipendente d = db.getDipendente(email);
					request.getSession().setAttribute("SESSION_USERNAME", d.getNome());
				} else {
					Cliente c = db.getCliente(email);
					request.getSession().setAttribute("SESSION_USERNAME", c.getNome());
					request.getSession().setAttribute("SESSION_IDCLIENTE", c.getIdCliente());
				}
				request.getSession().setAttribute("SESSION_USER_TYPE", tipo);
				if (tipo == 3)
					response.sendRedirect(request.getParameter("from"));
				else
					response.sendRedirect("admin.html");
			} else {
				request.getSession().setAttribute("SESSION_USERNAME", "");
				response.sendRedirect("login.jsp");
			}

			db.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
