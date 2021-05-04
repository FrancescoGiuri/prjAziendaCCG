package it.mytech;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrenotazioneServlet
 */
@WebServlet("/prenotazione")
public class PrenotazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrenotazioneServlet() {
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
		if (comando.equals("rifiuta")) {
			id = Integer.parseInt(request.getParameter("id"));
			try {
				DBManager db = new DBManager();
				
				ConfigMailManager cmm = new ConfigMailManager();
				Prenotazione p = db.getPrenotazione(id);
				cmm.sendPrenotazioneRifiutata(db.getEmail(db.getIdClienteDaPrenotazione(id)), p.getData(), p.getOra());
				db.deletePrenotazione(id);
				db.close();
				response.sendRedirect("prenotazioni.jsp");
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
		String data = request.getParameter("data");
		String ora = request.getParameter("ora");
		String messaggio = request.getParameter("message");
		try {
			ConfigMailManager cmm = new ConfigMailManager();
			DBManager db = new DBManager();
			String email = db.getEmail((Integer) request.getSession().getAttribute("SESSION_IDCLIENTE"));
			if (db.addPrenotazione(data, ora, messaggio,
					(Integer) request.getSession().getAttribute("SESSION_IDCLIENTE"))) {
				cmm.sendPrenotazioneRicevuta(email, data, ora);
			} else {
				cmm.sendPrenotazioneRifiutata(email, data, ora);
			}
			response.sendRedirect("index.jsp");
			db.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
