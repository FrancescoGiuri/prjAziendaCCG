package it.mytech;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String indirizzo = request.getParameter("indirizzo");
		String password = request.getParameter("pass");
		Logger logger = LogManager.getLogger(RegistrationServlet.class);
		try {
			ConfigMailManager cmm = new ConfigMailManager();
			DBManager db = new DBManager();
			if (db.checkEmail(email) == false) {
				db.insertRegistration(email, password, nome, indirizzo);
				Cliente c = db.getCliente(email);
				request.getSession().setAttribute("SESSION_USERNAME", c.getNome());
				request.getSession().setAttribute("SESSION_IDCLIENTE", c.getIdCliente());
				cmm.sendRegistrazione(email,getServletContext().getRealPath("/pdf" + File.separator + "PrivacyPolicy.pdf"));
				int numClienti = db.getNumOrdini();
				request.getServletContext().setAttribute("SESSION_NUM_CLIENTI", numClienti);
				response.sendRedirect("login.jsp?from=index.jsp");
			} else
				response.sendRedirect("registrazione.jsp");
			db.close();
			logger.debug("Login effettuato");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errore nella registrazione");
		}
	}

}
