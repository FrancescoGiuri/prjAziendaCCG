package it.mytech;

public class Ordine {
	private int idOrdine;
	private String data;
	private int idCliente;
	private int idDipendente;
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
	public int getIdDipendente() {
		return idDipendente;
	}
	public void setIdDipendente(int idDipendente) {
		this.idDipendente = idDipendente;
	}
	@Override
	public String toString() {
		return "Ordine [idOrdine=" + idOrdine + ", data=" + data + ", idCliente=" + idCliente + ", idDipendente="
				+ idDipendente + "]";
	}
	
	
}
