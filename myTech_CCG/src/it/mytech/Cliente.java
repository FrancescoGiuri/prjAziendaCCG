package it.mytech;

public class Cliente {
	private int idCliente;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String azienda;
	private String indirizzo;
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
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
	public String getAzienda() {
		return azienda;
	}
	public void setAzienda(String azienda) {
		this.azienda = azienda;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", email=" + email + ", password=" + password + ", nome=" + nome
				+ ", cognome=" + cognome + ", azienda=" + azienda + ", indirizzo=" + indirizzo + "]";
	}
	
	
}
