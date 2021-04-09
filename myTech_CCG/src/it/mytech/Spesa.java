package it.mytech;

public class Spesa {
	private int idSpesa;
	private String motivo;
	private float costo;
	private int idManager;

	public Spesa() {

	}

	public Spesa(int idSpesa, String motivo, float costo, int idManager) {
		this.idSpesa = idSpesa;
		this.motivo = motivo;
		this.costo = costo;
		this.idManager = idManager;
	}

	public int getIdSpesa() {
		return idSpesa;
	}

	public void setIdSpesa(int idSpesa) {
		this.idSpesa = idSpesa;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(float costo) {
		this.costo = costo;
	}

	public int getIdManager() {
		return idManager;
	}

	public void setIdManager(int idManager) {
		this.idManager = idManager;
	}

	@Override
	public String toString() {
		return "Spesa [idSpesa=" + idSpesa + ", motivo=" + motivo + ", costo=" + costo + ", idManager=" + idManager
				+ "]";
	}

}
