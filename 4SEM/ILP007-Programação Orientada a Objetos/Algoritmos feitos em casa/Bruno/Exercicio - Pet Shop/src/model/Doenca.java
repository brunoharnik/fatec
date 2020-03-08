package model;

import java.util.Random;

public class Doenca {

	private int id;
	private String nomeComum;
	private String nomeCientifico;
	private String sintomas;
	private String tratamentos;
	
	public Doenca(String nomeComum, String nomeCientifico, String sintomas, String tratamentos) {
		this.id = new Random().nextInt();
		this.nomeComum = nomeComum;
		this.nomeCientifico = nomeCientifico;
		this.sintomas = sintomas;
		this.tratamentos = tratamentos;
	}

	public String getNomeComum() {
		return nomeComum;
	}

	public void setNomeComum(String nomeComum) {
		this.nomeComum = nomeComum;
	}

	public String getNomeCientifico() {
		return nomeCientifico;
	}

	public void setNomeCientifico(String nomeCientifico) {
		this.nomeCientifico = nomeCientifico;
	}

	public String getSintomas() {
		return sintomas;
	}

	public void setSintomas(String sintomas) {
		this.sintomas = sintomas;
	}

	public String getTratamentos() {
		return tratamentos;
	}

	public void setTratamentos(String tratamentos) {
		this.tratamentos = tratamentos;
	}

	public int getId() {
		return id;
	}

	public boolean temCura() {
		return true;
	}

	@Override
	public String toString() {
		return "Doenca"
				+ "\nId: " + id
				+ "\nNome comum: " + nomeComum
				+ "\nNome científico: " + nomeCientifico
				+ "\nSintomas:"	+ sintomas
				+ "\nTratamentos: " + tratamentos;
	}
}
