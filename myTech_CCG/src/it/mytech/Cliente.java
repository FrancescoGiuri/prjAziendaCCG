package it.mytech;

public class Cliente {
	private int idCliente;
	private String email;
	private String password;
	private String nome;
	private String indirizzo;

	public Cliente() {

	}

	public Cliente(int idCliente, String email, String password, String nome, String indirizzo) {
		this.idCliente = idCliente;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.indirizzo = indirizzo;
	}

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

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

}
