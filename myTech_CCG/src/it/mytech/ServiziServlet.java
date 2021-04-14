package it.mytech;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServiziServlet
 */
@WebServlet("/servizi")
public class ServiziServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServiziServlet() {
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

		if (comando != null) {
			if (comando.equals("viewall")) {
				// System.out.println("ciao");
				try {
					ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
					DBManager db = new DBManager();
					elenco = db.getProdotti();
					db.close();

					request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
					response.sendRedirect("servizi.jsp");

				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (comando.equals("viewproduct")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					DBManager db = new DBManager();
					Prodotto p = db.getProdotto(id);
					db.close();

					request.getSession().removeAttribute("SESSION_PRODOTTO");
					request.getSession().setAttribute("SESSION_PRODOTTO", p);
					response.sendRedirect("prodotto.jsp");

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else {
			String value = request.getParameter("slct");
			request.getSession().removeAttribute("CATEGORIA");
			request.getSession().setAttribute("CATEGORIA", value);
			if (value.equals("1")) {
				try {
					// System.out.println(value);
					ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
					DBManager db = new DBManager();
					elenco = db.getHardware();
					db.close();

					request.getSession().removeAttribute("ELENCO_PRODOTTI");
					request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
					response.sendRedirect("servizi.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (value.equals("2")) {
				try {
					ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
					DBManager db = new DBManager();
					elenco = db.getSoftware();
					db.close();

					request.getSession().removeAttribute("ELENCO_PRODOTTI");
					request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
					response.sendRedirect("servizi.jsp");

				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				try {
					ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
					DBManager db = new DBManager();
					elenco = db.getProdotti();
					db.close();

					request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
					response.sendRedirect("servizi.jsp");

				} catch (Exception e) {
					e.printStackTrace();
				}
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
