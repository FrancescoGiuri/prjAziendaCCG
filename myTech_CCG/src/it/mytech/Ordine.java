package it.mytech;

public class Ordine {
	private int idOrdine;
	private String data;
	private boolean elaborato;
	private int idCliente;

	public Ordine() {
	}

	public Ordine(int idOrdine, String data, boolean elaborato, int idCliente) {
		this.idOrdine = idOrdine;
		this.data = data;
		this.elaborato = elaborato;
		this.idCliente = idCliente;
	}

	public int getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public boolean isElaborato() {
		return elaborato;
	}

	public void setElaborato(boolean elaborato) {
		this.elaborato = elaborato;
	}

}
