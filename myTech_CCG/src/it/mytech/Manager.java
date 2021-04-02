package it.mytech;

public class Manager {
	private int idManager;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	public int getIdManager() {
		return idManager;
	}
	public void setIdManager(int idManager) {
		this.idManager = idManager;
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
	@Override
	public String toString() {
		return "Manager [idManager=" + idManager + ", email=" + email + ", password=" + password + ", nome=" + nome
				+ ", cognome=" + cognome + "]";
	}
	
	
}
