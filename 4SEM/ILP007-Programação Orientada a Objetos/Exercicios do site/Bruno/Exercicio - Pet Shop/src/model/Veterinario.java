package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Veterinario {

	private int id;
	private String nome;
	private String crmv;
	private String telefone;
	private List<String> especializacao;
	
	public Veterinario(String nome, String crmv, String telefone, String ... especializacoes) {
		id = new Random().nextInt();
		this.nome = nome;
		this.crmv = crmv;
		this.telefone = telefone;
		this.especializacao = new ArrayList<String>();
		for (String especializacao : especializacoes) {
			this.especializacao.add(especializacao);
		}
	}

	public int getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCrmv() {
		return crmv;
	}

	public void setCrmv(String crmv) {
		this.crmv = crmv;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public List<String> getEspecializacao() {
		return especializacao;
	}

	public void setEspecializacao(List<String> especializacao) {
		this.especializacao = especializacao;
	}

	public void gerarDiagnostico(Animal animal, Doenca ... doencas) {
		for (Doenca doenca : doencas) {
			animal.registrarDoenca(doenca);
		}
	}

	@Override
	public String toString() {
		return "Veterinario"
				+ "\nId: " + id
				+ "\nNome: " + nome
				+ "\nCRMV: " + crmv
				+ "\nTelefone: " + telefone
				+ "\nEspecialização: " + especializacao;
	}
}
