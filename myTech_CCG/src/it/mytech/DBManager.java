package it.mytech;

import java.sql.*;
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
		String sqlSelect = "SELECT * FROM DIPENDENTE WHERE EMAIL='" + email + "';";
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
		String q = "SELECT * FROM MANAGER,DIPENDENTE,CLIENTE WHERE email='" + email + "';";
		rs = query.executeQuery(q);
		return rs.next();
	}

	public String getPassword(String email) throws Exception {
		String q = "SELECT * FROM MANAGER,DIPENDENTE,CLIENTE WHERE EMAIL='" + email + "';";
		rs = query.executeQuery(q);
		String s = "";
		if (rs.next()) {
			String password = rs.getString("password");
			s = "La tua password è: " + password;
		}
		return s;
	}

	public int getNumDipendenti() throws Exception {
		int num;
		String cntQuery = "SELECT COUNT(idDipendente) AS Totale FROM DIPENDENTE;";
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
		String sqlSelect = "SELECT PRODOTTO.* FROM PRODOTTO,DETTAGLIO,CLIENTE WHERE PRODOTTO.IDPRODOTTO=DETTAGLIO.IDPRODOTTO AND DETTAGLIO.IDORDINE=ORDINE.IDORDINE ";
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
			pstm.setInt(2, quantita.get(i));
			pstm.executeUpdate();
		}
	}

	public String getEmail(int idCliente) throws Exception {
		String q = "SELECT * FROM CLIENTE WHERE idCliente=" + idCliente + ";";
		rs = query.executeQuery(q);
		String password = "";
		if (rs.next()) {
			password = rs.getString("email");
		}
		return password;
	}

	public void close() throws Exception {
		query.close();
		connessione.close();
	}
}
