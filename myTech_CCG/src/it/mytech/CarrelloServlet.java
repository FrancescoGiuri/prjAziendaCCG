package it.mytech;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CarrelloServlet
 */
@WebServlet("/carrelloservlet")
public class CarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CarrelloServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		if (comando.equals("removeprodotto")) {
			ArrayList<Prodotto> elenco = (ArrayList<Prodotto>) request.getSession()
					.getAttribute("SESSION_PRODOTTI_CARRELLO");
			ArrayList<Integer> q = (ArrayList<Integer>) request.getSession().getAttribute("SESSION_QUANTITA_CARRELLO");
			for (int i = 0; i < elenco.size(); i++)
				if (elenco.get(i).getIdProdotto() == id) {
					elenco.remove(i);
					q.remove(i);
				}
			if (elenco.size() == 0) {
				elenco = null;
				q = null;
			}
			request.getSession().removeAttribute("SESSION_PRODOTTI_CARRELLO");
			request.getSession().setAttribute("SESSION_PRODOTTI_CARRELLO", elenco);
			request.getSession().removeAttribute("SESSION_QUANTITA_CARRELLO");
			request.getSession().setAttribute("SESSION_QUANTITA_CARRELLO", q);
			response.sendRedirect("carrello.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String comando = request.getParameter("cmd");
		int id = Integer.parseInt(request.getParameter("id"));
		if (comando.equals("addprodotto")) {
			int quantita = Integer.parseInt(request.getParameter("quantita"));
			try {
				DBManager db = new DBManager();
				Prodotto p = db.getProdotto(id);
				ArrayList<Prodotto> elenco = (ArrayList<Prodotto>) request.getSession()
						.getAttribute("SESSION_PRODOTTI_CARRELLO");
				ArrayList<Integer> q = (ArrayList<Integer>) request.getSession()
						.getAttribute("SESSION_QUANTITA_CARRELLO");
				if (elenco == null) {
					elenco = new ArrayList<Prodotto>();
					q = new ArrayList<Integer>();
				}
				elenco.add(p);
				q.add(quantita);
				request.getSession().removeAttribute("SESSION_PRODOTTI_CARRELLO");
				request.getSession().setAttribute("SESSION_PRODOTTI_CARRELLO", elenco);
				request.getSession().removeAttribute("SESSION_QUANTITA_CARRELLO");
				request.getSession().setAttribute("SESSION_QUANTITA_CARRELLO", q);
				response.sendRedirect("servizi?cmd=viewall");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
