package it.mytech;

public class Dipendente {
	private int idDipendente;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String ruolo;
	private float stipendio;
	private int idManager;

	public Dipendente() {

	}

	public Dipendente(int idDipendente, String email, String password, String nome, String cognome, String ruolo,
			float stipendio, int idManager) {
		this.idDipendente = idDipendente;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.ruolo = ruolo;
		this.stipendio = stipendio;
		this.idManager = idManager;
	}

	public int getIdDipendente() {
		return idDipendente;
	}

	public void setIdDipendente(int idDipendente) {
		this.idDipendente = idDipendente;
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

	public int getIdManager() {
		return idManager;
	}

	public void setIdManager(int idManager) {
		this.idManager = idManager;
	}

	@Override
	public String toString() {
		return "Dipendente [idDipendente=" + idDipendente + ", email=" + email + ", password=" + password + ", nome="
				+ nome + ", cognome=" + cognome + ", ruolo=" + ruolo + ", stipendio=" + stipendio + ", idManager="
				+ idManager + "]";
	}

}
