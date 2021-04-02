package it.mytech;

public class Prenotazione {
	private int idPrenotazione;
	private String data;
	private String motivo;
	private int idCliente;
	public int getIdPrenotazione() {
		return idPrenotazione;
	}
	public void setIdPrenotazione(int idPrenotazione) {
		this.idPrenotazione = idPrenotazione;
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
	@Override
	public String toString() {
		return "Prenotazione [idPrenotazione=" + idPrenotazione + ", data=" + data + ", motivo=" + motivo
				+ ", idCliente=" + idCliente + "]";
	}
	
	
	
}
