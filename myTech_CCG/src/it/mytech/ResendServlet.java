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
 * Servlet implementation class ResendServlet
 */
@WebServlet("/resend")
public class ResendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResendServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		Logger logger = LogManager.getLogger(ResendServlet.class);
		try {
			ConfigMailManager cmm = new ConfigMailManager();
			if (cmm.sendCredenziali(email)) {
				response.sendRedirect("login.jsp?from=login.jsp&locale=" + request.getParameter("locale"));
			} else
				response.sendRedirect("registrazione.jsp");
			cmm.close();
			logger.debug("Mail con password inviata");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errore nel resend password");//log
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}