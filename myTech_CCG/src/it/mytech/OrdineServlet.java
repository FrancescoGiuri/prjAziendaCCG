package it.mytech;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.ByteArrayOutputStream;

/**
 * Servlet implementation class OrdineServlet
 */
@WebServlet("/ordine")
public class OrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrdineServlet() {
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
		ArrayList<Prodotto> elenco = (ArrayList<Prodotto>) request.getSession()
				.getAttribute("SESSION_PRODOTTI_CARRELLO");
		ArrayList<Integer> q = (ArrayList<Integer>) request.getSession().getAttribute("SESSION_QUANTITA_CARRELLO");
		Logger logger = LogManager.getLogger(OrdineServlet.class);
		try {
			ConfigMailManager cmm = new ConfigMailManager();
			DBManager db = new DBManager();
			int idOrdine = db.getNewId("ORDINE");
			db.createOrdine(idOrdine, (Integer) request.getSession().getAttribute("SESSION_IDCLIENTE"), elenco, q);
			String email = db.getEmail((Integer) request.getSession().getAttribute("SESSION_IDCLIENTE"));
			cmm.sendConfermaOrdine(email);
			PDFPrint pdf = new PDFPrint();
			ByteArrayOutputStream output = pdf.printOrdineRecap(idOrdine);
			response.addHeader("Content-Type", "application/force-download");
			response.addHeader("Content-Disposition", "attachment; filename=\"RecapOrdine.pdf\"");
			response.getOutputStream().write(output.toByteArray());
			request.getSession().removeAttribute("SESSION_PRODOTTI_CARRELLO");
			request.getSession().removeAttribute("SESSION_QUANTITA_CARRELLO");
			response.sendRedirect("servizi?cmd=viewall&locale=" + request.getParameter("locale"));
			logger.debug("Ordine effettuato");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Errore nell'ordine");
		}
	}

}
