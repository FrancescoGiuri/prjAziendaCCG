package it.mytech;

public class Amministratore {
	private int id;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String ruolo;
	private float stipendio;
	private boolean manager;

	public Amministratore() {

	}

	public Amministratore(int id, String email, String password, String nome, String cognome, String ruolo,
			float stipendio, boolean manager) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.ruolo = ruolo;
		this.stipendio = stipendio;
		this.manager = manager;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isManager() {
		return manager;
	}

	public void setManager(boolean manager) {
		this.manager = manager;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getRuolo() {
		return ruolo;
	}

	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}

	public float getStipendio() {
		return stipendio;
	}

	public void setStipendio(float stipendio) {
		this.stipendio = stipendio;
	}
	
	

}
