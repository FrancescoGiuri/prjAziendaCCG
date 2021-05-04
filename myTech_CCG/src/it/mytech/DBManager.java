package it.mytech;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class DBManager {

	private Connection connessione;
	private Statement query;
	private ResultSet rs;
	private String urlDB;
	private String userDB;
	private String pwDB;

	public DBManager() throws Exception {

		urlDB = "jdbc:mysql://localhost:3306/mytech?serverTimezone=UTC";
		userDB = "root";
		pwDB = "";

		// creazione della connessione
		// registrazione dei driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// instauro connessione al db
		connessione = DriverManager.getConnection(urlDB, userDB, pwDB);

		// creo la query
		query = connessione.createStatement();
	}

	// data una determinata query, raccolgo le corrispondenze in un array
	public boolean verificaCredenziali(String email, String password, String tipo) throws Exception {
		String q = "SELECT * FROM " + tipo + " WHERE EMAIL='" + email + "' AND PASSWORD='" + password + "';";
		rs = query.executeQuery(q);
		return rs.next();
	}

	public Amministratore getAmministratore(String email) throws Exception {
		Amministratore a = new Amministratore();
		String sqlSelect = "SELECT * FROM AMMINISTRATORE WHERE EMAIL='" + email + "';";
		rs = query.executeQuery(sqlSelect);
		if (rs.next())
			a = new Amministratore(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getFloat(7), rs.getBoolean(8));
		return a;
	}

	public Amministratore getAmministratore2(int id) throws Exception {
		Amministratore a = new Amministratore();
		String sqlSelect = "SELECT * FROM AMMINISTRATORE WHERE ID=" + id + ";";
		rs = query.executeQuery(sqlSelect);
		if (rs.next())
			a = new Amministratore(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getFloat(7), rs.getBoolean(8));
		return a;
	}

	public Cliente getCliente(String email) throws Exception {
		Cliente c = new Cliente();
		String sqlSelect = "SELECT * FROM CLIENTE WHERE EMAIL='" + email + "';";
		rs = query.executeQuery(sqlSelect);
		if (rs.next())
			c = new Cliente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
		return c;
	}

	public boolean checkEmail(String email) throws Exception {
		String q = "SELECT * FROM AMMINISTRATORE,CLIENTE WHERE AMMINISTRATORE.email='" + email + "' OR CLIENTE.email='"
				+ email + "';";
		rs = query.executeQuery(q);
		return rs.next();
	}

	public String getPassword(String email) throws Exception {
		String q = "SELECT * FROM AMMINISTRATORE,CLIENTE WHERE AMMINISTRATORE.email='" + email + "' OR CLIENTE.email='"
				+ email + "';";
		rs = query.executeQuery(q);
		String s = "Email non registrata sul nostro sito";
		if (rs.next()) {
			String password = rs.getString("password");
			s = "La tua password è: " + password;
		}
		return s;
	}

	public int getNumDipendenti() throws Exception {
		int num;
		String cntQuery = "SELECT COUNT(id) AS Totale FROM AMMINISTRATORE WHERE MANAGER=0;";
		rs = query.executeQuery(cntQuery);
		rs.next();
		num = rs.getInt("Totale");
		return num;
	}

	public int getNumClienti() throws Exception {
		int num;
		String cntQuery = "SELECT COUNT(idCliente) AS Totale FROM CLIENTE;";
		rs = query.executeQuery(cntQuery);
		rs.next();
		num = rs.getInt("Totale");
		return num;
	}

	public int getNumOrdini() throws Exception {
		int num;
		String cntQuery = "SELECT COUNT(idOrdine) AS Totale FROM ORDINE;";
		rs = query.executeQuery(cntQuery);
		rs.next();
		num = rs.getInt("Totale");
		return num;
	}

	public int getNewId(String tabella) throws Exception {
		String sqlSelect = "SELECT * FROM " + tabella + ";";
		rs = query.executeQuery(sqlSelect);
		int id = 1;
		while (rs.next()) {
			if (id != rs.getInt(1))
				return id;
			else
				id++;
		}
		return id;
	}

	public void insertRegistration(String email, String password, String nome, String indirizzo) throws Exception {
		int idCliente = getNewId("CLIENTE");
		Statement statement = connessione.createStatement();
		String sql = "INSERT INTO CLIENTE VALUES (" + idCliente + ",'" + email + "','" + password + "','" + nome + "','"
				+ indirizzo + "');";
		statement.executeUpdate(sql);
	}

	public ArrayList<Prodotto> getProdotti() throws Exception {
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		Prodotto p;
		String sqlSelect = "SELECT * FROM PRODOTTO";
		rs = query.executeQuery(sqlSelect);
		while (rs.next()) {
			p = new Prodotto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
					rs.getFloat(6), rs.getInt(7), rs.getString(8));
			elenco.add(p);
		}
		return elenco;
	}

	public Prodotto getProdotto(int idProdotto) throws Exception {
		String q = "SELECT * FROM PRODOTTO WHERE IDPRODOTTO=" + idProdotto + ";";
		rs = query.executeQuery(q);
		Prodotto p = null;
		if (rs.next()) {
			p = new Prodotto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
					rs.getFloat(6), rs.getInt(7), rs.getString(8));
		}
		return p;
	}

	public ArrayList<Prodotto> getHardware() throws Exception {
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		Prodotto p;
		String sqlSelect = "SELECT * FROM PRODOTTO WHERE TIPO=1";
		rs = query.executeQuery(sqlSelect);
		while (rs.next()) {
			p = new Prodotto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
					rs.getFloat(6), rs.getInt(7), rs.getString(8));
			elenco.add(p);
		}
		return elenco;
	}

	public ArrayList<Prodotto> getSoftware() throws Exception {
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		Prodotto p;
		String sqlSelect = "SELECT * FROM PRODOTTO WHERE TIPO=2";
		rs = query.executeQuery(sqlSelect);
		while (rs.next()) {
			p = new Prodotto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
					rs.getFloat(6), rs.getInt(7), rs.getString(8));
			elenco.add(p);
		}
		return elenco;
	}

	public ArrayList<Prodotto> getProdottibyOrdine(int idOrdine) throws Exception {
		ArrayList<Prodotto> elenco = new ArrayList<Prodotto>();
		Prodotto p;
		String sqlSelect = "SELECT PRODOTTO.* FROM PRODOTTO,DETTAGLIO,CLIENTE WHERE PRODOTTO.IDPRODOTTO=DETTAGLIO.IDPRODOTTO AND DETTAGLIO.IDORDINE="
				+ idOrdine + ";";
		rs = query.executeQuery(sqlSelect);
		while (rs.next()) {
			p = new Prodotto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
					rs.getFloat(6), rs.getInt(7), rs.getString(8));
			elenco.add(p);
		}
		return elenco;
	}

	public int createOrdine(int idOrdine, int idCliente, ArrayList<Prodotto> elenco, ArrayList<Integer> quantita)
			throws Exception {
		int righe;
		GregorianCalendar gc = new GregorianCalendar();
		int giorno = gc.get(Calendar.DAY_OF_MONTH);
		int mese = gc.get(Calendar.MONTH);
		int anno = gc.get(Calendar.YEAR);
		String data = anno + "-" + mese + "-" + giorno;
		// String q = "SET FOREIGN_KEY_CHECKS=0";
		// query.executeQuery(q);
		PreparedStatement pstm;

		String sql = "INSERT INTO ORDINE VALUES (?,?,?,?);";
		pstm = connessione.prepareStatement(sql);
		pstm.setInt(1, idOrdine);
		pstm.setString(2, data);
		pstm.setBoolean(3, false);
		pstm.setInt(4, idCliente);
		righe = pstm.executeUpdate();
		createDettaglio(idOrdine, elenco, quantita);
		return righe;
	}

	private void createDettaglio(int idOrdine, ArrayList<Prodotto> elenco, ArrayList<Integer> quantita)
			throws Exception {
		PreparedStatement pstm;
		for (int i = 0; i < elenco.size(); i++) {
			String sql = "INSERT INTO DETTAGLIO VALUES (?,?,?);";
			pstm = connessione.prepareStatement(sql);
			pstm.setInt(1, idOrdine);
			pstm.setInt(2, elenco.get(i).getIdProdotto());
			pstm.setInt(3, quantita.get(i));
			pstm.executeUpdate();
		}
	}

	public String getEmail(int idCliente) throws Exception {
		String q = "SELECT * FROM CLIENTE WHERE idCliente=" + idCliente + ";";
		rs = query.executeQuery(q);
		String email = "";
		if (rs.next()) {
			email = rs.getString("email");
		}
		return email;
	}

	public boolean addPrenotazione(String data, String ora, String messaggio, int idCliente) throws Exception {
		boolean check = false;
		PreparedStatement pstm;
		String q = "SELECT * FROM PRENOTAZIONE WHERE DATA='" + data + "' AND ORA='" + ora + "';";
		System.out.println(q);
		rs = query.executeQuery(q);
		if (!rs.next()) {
			String sql = "INSERT INTO PRENOTAZIONE VALUES (?,?,?,?,?);";
			pstm = connessione.prepareStatement(sql);
			pstm.setInt(1, getNewId("PRENOTAZIONE"));
			pstm.setString(2, data);
			pstm.setString(3, ora);
			pstm.setString(4, messaggio);
			pstm.setInt(5, idCliente);
			pstm.executeUpdate();
			check = true;
		}
		return check;
	}

	public void addProdotto(Prodotto p) throws Exception {
		PreparedStatement pstm;
		String sql = "INSERT INTO PRODOTTO VALUES (?,?,?,?,?,?,?,?);";
		pstm = connessione.prepareStatement(sql);
		pstm.setInt(1, p.getIdProdotto());
		pstm.setString(2, p.getNome());
		pstm.setString(3, p.getDescrizione());
		pstm.setInt(4, p.getTipo());
		pstm.setString(5, p.getMarca());
		pstm.setFloat(6, p.getPrezzo());
		pstm.setInt(7, p.getDisponibilità());
		pstm.setString(8, p.getImmagine());
		pstm.executeUpdate();
	}

	public void updateProdotto(Prodotto p) throws Exception {
		PreparedStatement pstm;
		/*
		 * String q = "SET FOREIGN_KEY_CHECKS=0"; query.executeQuery(q);
		 */
		String sql = "UPDATE PRODOTTO SET nome= ?, descrizione= ?, tipo=?, marca=?, prezzo=?,"
				+ "disponibilità= ? WHERE idProdotto= ?;";
		pstm = connessione.prepareStatement(sql);

		pstm.setString(1, p.getNome());
		pstm.setString(2, p.getDescrizione());
		pstm.setInt(3, p.getTipo());
		pstm.setString(4, p.getMarca());
		pstm.setFloat(5, p.getPrezzo());
		pstm.setInt(6, p.getDisponibilità());
		pstm.setInt(7, p.getIdProdotto());

		pstm.executeUpdate();
	}

	public void addDipendente(Amministratore a) throws Exception {
		PreparedStatement pstm;
		String sql = "INSERT INTO AMMINISTRATORE VALUES (?,?,?,?,?,?,?,?);";
		pstm = connessione.prepareStatement(sql);
		pstm.setInt(1, a.getId());
		pstm.setString(2, a.getEmail());
		pstm.setString(3, a.getPassword());
		pstm.setString(4, a.getNome());
		pstm.setString(5, a.getCognome());
		pstm.setString(6, a.getRuolo());
		pstm.setFloat(7, a.getStipendio());
		pstm.setBoolean(8, a.isManager());
		pstm.executeUpdate();
	}

	public void updateDipendente(Amministratore a) throws Exception {
		PreparedStatement pstm;
		String sql = "UPDATE AMMINISTRATORE SET cognome=?, nome= ?, email= ?, ruolo=?, stipendio=? WHERE id= ?;";
		pstm = connessione.prepareStatement(sql);

		pstm.setString(1, a.getCognome());
		pstm.setString(2, a.getNome());
		pstm.setString(3, a.getEmail());
		pstm.setString(4, a.getRuolo());
		pstm.setFloat(5, a.getStipendio());
		pstm.setInt(6, a.getId());

		pstm.executeUpdate();
	}

	public void deleteProduct(int id) throws Exception {
		/*
		 * String q = "SET FOREIGN_KEY_CHECKS=0"; query.executeQuery(q);
		 */
		String sql = "DELETE FROM PRODOTTO WHERE idProdotto=" + id + ";";
		query.executeUpdate(sql);
	}

	public void deleteDipendente(int id) throws Exception {
		String sql = "DELETE FROM AMMINISTRATORE WHERE id=" + id + ";";
		query.executeUpdate(sql);
	}

	public String getNomeCliente(int id) throws Exception {
		String q = "SELECT * FROM CLIENTE WHERE idCliente=" + id + ";";
		rs = query.executeQuery(q);
		String nome = "";
		if (rs.next()) {
			nome = rs.getString("nome");
		}
		return nome;
	}

	public void elaboraOrdine(int idOrdine) throws Exception {
		PreparedStatement pstm;
		String sql = "UPDATE ORDINE SET elaborato=1 WHERE idOrdine=" + idOrdine + ";";
		pstm = connessione.prepareStatement(sql);
		pstm.executeUpdate();
	}

	public ArrayList<Integer> clientiOrdini() throws Exception {
		String q = "SELECT * FROM ORDINE;";
		rs = query.executeQuery(q);
		ArrayList<Integer> clienti = new ArrayList<Integer>();
		while (rs.next()) {
			clienti.add(rs.getInt("idCliente"));
		}
		return clienti;
	}

	public ArrayList<Integer> clientiPrenotazioni() throws Exception {
		String q = "SELECT * FROM PRENOTAZIONE;";
		rs = query.executeQuery(q);
		ArrayList<Integer> clienti = new ArrayList<Integer>();
		while (rs.next()) {
			clienti.add(rs.getInt("idCliente"));
		}
		return clienti;
	}

	public void deleteCliente(int id) throws Exception {
		String q = "SET FOREIGN_KEY_CHECKS=0";
		query.executeQuery(q);
		String sql = "DELETE FROM CLIENTE WHERE idCliente=" + id + ";";
		query.executeUpdate(sql);
	}

	public void deletePrenotazione(int id) throws Exception {
		String q = "SET FOREIGN_KEY_CHECKS=0";
		query.executeQuery(q);
		String sql = "DELETE FROM PRENOTAZIONE WHERE idPrenotazione=" + id + ";";
		query.executeUpdate(sql);
	}

	public int getIdClienteDaPrenotazione(int id) throws Exception {
		String q = "SELECT * FROM PRENOTAZIONE WHERE idPrenotazione=" + id + ";";
		rs = query.executeQuery(q);
		int idCliente = 0;
		if (rs.next()) {
			idCliente = rs.getInt("idCliente");
		}
		return idCliente;
	}

	public int getIdClienteDaOrdine(int id) throws Exception {
		String q = "SELECT * FROM ORDINE WHERE idOrdine=" + id + ";";
		rs = query.executeQuery(q);
		int idCliente = 0;
		if (rs.next()) {
			idCliente = rs.getInt("idCliente");
		}
		return idCliente;
	}

	public Prenotazione getPrenotazione(int idPrenotazione) throws Exception {
		String q = "SELECT * FROM PRENOTAZIONE WHERE IDPRENOTAZIONE=" + idPrenotazione + ";";
		rs = query.executeQuery(q);
		Prenotazione p = null;
		if (rs.next()) {
			p = new Prenotazione(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
		}
		return p;
	}

	public void close() throws Exception {
		query.close();
		connessione.close();
	}
}
