package it.mytech;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Logger;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ProdottiServlet
 */
@WebServlet("/prodotti")
@MultipartConfig
public class ProdottiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getLogger(ProdottiServlet.class.getCanonicalName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProdottiServlet() {
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
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		if (comando.equals("elimina")) {
			id = Integer.parseInt(request.getParameter("id"));
			try {
				DBManager db = new DBManager();
				db.deleteProduct(id);
				elenco = db.getProdotti();
				db.close();

				// ELENCO PRODOTTI IN SESSIONE
				request.getSession().removeAttribute("ELENCO_PRODOTTI");
				request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
				response.sendRedirect("prodotti.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (comando.equals("elabora")) {
			id = Integer.parseInt(request.getParameter("id"));
			try {
				DBManager db = new DBManager();
				db.elaboraOrdine(id);
				ConfigMailManager cmm = new ConfigMailManager();
				cmm.sendOrdineCompletato(db.getEmail(db.getIdClienteDaOrdine(id)));
				db.close();
				response.sendRedirect("ordini.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			id = Integer.parseInt(request.getParameter("id"));
			try {
				DBManager db = new DBManager();
				Prodotto p = db.getProdotto(id);
				request.getSession().setAttribute("MODIFICA_PRODOTTO", p);
				response.sendRedirect("modificaProdotto.jsp");
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
		Prodotto p = new Prodotto();
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		String cmd = request.getParameter("cmd");
		p.setIdProdotto(Integer.parseInt(request.getParameter("id")));
		p.setNome(request.getParameter("nome"));
		p.setDescrizione(request.getParameter("descrizione"));
		p.setMarca(request.getParameter("marca"));
		p.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
		p.setTipo(Integer.parseInt(request.getParameter("tipo")));
		p.setDisponibilità(Integer.parseInt(request.getParameter("disponibilita")));
		if (cmd.equals("add")) {
			if (request.getPart("immagine") != null) {
				try {
					Part filePart = (Part) request.getPart("immagine");
					response.setContentType("text/html;charset=UTF-8");
					InputStream is = filePart.getInputStream();
					String fileName = filePart.getSubmittedFileName();
					String path = getServletContext().getRealPath("/img/prodotti" + File.separator + fileName);
					System.out.println(path);
					byte[] bytes = new byte[is.available()];
					is.read(bytes);
					FileOutputStream fops = new FileOutputStream(path);
					fops.write(bytes);
					fops.flush();
					fops.close();
					// p.setImmagine(fileName);
					p.setImmagine("default.png");

				} catch (Exception e) {
					e.printStackTrace();
				}
			} else
				p.setImmagine("default.png");
			try {
				db = new DBManager();
				db.addProdotto(p);
				elenco = db.getProdotti();
				db.close();
				// ELENCO PRODOTTI IN SESSIONE
				request.getSession().removeAttribute("ELENCO_PRODOTTI");
				request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
				response.sendRedirect("prodotti.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			try {
				db = new DBManager();
				db.updateProdotto(p);
				elenco = db.getProdotti();
				db.close();

				// ELENCO PRODOTTI IN SESSIONE
				request.getSession().removeAttribute("ELENCO_PRODOTTI");
				request.getSession().setAttribute("ELENCO_PRODOTTI", elenco);
				response.sendRedirect("prodotti.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
