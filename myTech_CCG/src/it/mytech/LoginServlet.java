package it.mytech;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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
			t = "amministratore";
		} else {
			t = "cliente";
		}
		Logger logger = LogManager.getLogger(LoginServlet.class);
		try {
			DBManager db = new DBManager();
			if (db.verificaCredenziali(email, password, t)) {
				if (tipo == 1) {
					Amministratore a = db.getAmministratore(email);
					request.getSession().setAttribute("SESSION_USERNAME", a.getNome());
					if (a.isManager())
						request.getSession().setAttribute("SESSION_USER_TYPE", 1);
					else
						request.getSession().setAttribute("SESSION_USER_TYPE", 2);
				} else {
					Cliente c = db.getCliente(email);
					request.getSession().setAttribute("SESSION_USERNAME", c.getNome());
					request.getSession().setAttribute("SESSION_IDCLIENTE", c.getIdCliente());
					request.getSession().setAttribute("SESSION_USER_TYPE", 3);
				}

				logger.debug("Login effettuato");

				if (tipo == 3)
					response.sendRedirect(request.getParameter("from") + "?locale=" + request.getParameter("locale"));
				else
					response.sendRedirect("admin.jsp");
			} else {
				request.getSession().setAttribute("SESSION_USERNAME", "");
				response.sendRedirect("login.jsp?locale=" + request.getParameter("locale"));
			}

			db.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errore nel login");
		}
	}

}
