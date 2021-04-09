package it.mytech;

public class Prodotto {
	private int idProdotto;
	private String nome;
	private String descrizione;
	private String marca;
	private float prezzo;
	private int disponibilità;
	private String immagine;
	private int tipo;

	public Prodotto() {

	}

	public Prodotto(int idProdotto, String nome, String descrizione, int tipo, String marca, float prezzo,
			int disponibilità, String immagine) {
		this.idProdotto = idProdotto;
		this.nome = nome;
		this.descrizione = descrizione;
		this.marca = marca;
		this.prezzo = prezzo;
		this.disponibilità = disponibilità;
		this.immagine = immagine;
		this.tipo = tipo;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	public int getDisponibilità() {
		return disponibilità;
	}

	public void setDisponibilità(int disponibilità) {
		this.disponibilità = disponibilità;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	@Override
	public String toString() {
		return "Prodotto [idProdotto=" + idProdotto + ", nome=" + nome + ", descrizione=" + descrizione + ", marca="
				+ marca + ", prezzo=" + prezzo + ", disponibilità=" + disponibilità + ", immagine=" + immagine + "]";
	}

}
