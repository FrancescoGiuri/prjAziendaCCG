package it.mytech;

public class Prenotazione {
	private int idPrenotazione;
	private String data;
	private String ora;
	private String motivo;
	private int idCliente;

	public Prenotazione() {
	}

	public Prenotazione(int idPrenotazione, String data, String ora, String motivo, int idCliente) {
		this.idPrenotazione = idPrenotazione;
		this.data = data;
		this.ora = ora;
		this.motivo = motivo;
		this.idCliente = idCliente;
	}

	public int getIdPrenotazione() {
		return idPrenotazione;
	}

	public void setIdPrenotazione(int idPrenotazione) {
		this.idPrenotazione = idPrenotazione;
	}

	public String getOra() {
		return ora;
	}

	public void setOra(String ora) {
		this.ora = ora;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

}
