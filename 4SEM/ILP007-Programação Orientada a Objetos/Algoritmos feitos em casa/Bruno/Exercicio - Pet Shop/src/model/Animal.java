package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Animal {

	private int id;
	private String nome;
	private double idade;
	private double peso;
	private List<Doenca> historicoDoencas;
	
	public Animal(String nome, double idade, double peso) {
		this.id = new Random().nextInt();
		this.nome = nome;
		this.idade = idade;
		this.peso = peso;
		this.historicoDoencas = new ArrayList<Doenca>();
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getIdade() {
		return idade;
	}

	public void setIdade(double idade) {
		this.idade = idade;
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public int getId() {
		return id;
	}

	public List<Doenca> getHistoricoDoencas() {
		return historicoDoencas;
	}

	public void registrarDoenca(Doenca doenca) {
		if (historicoDoencas.contains(doenca)) return;
		historicoDoencas.add(doenca);
	}

	@Override
	public String toString() {
		return "Animal"
				+ "\nId: " + id
				+ "\nNome: " + nome
				+ "\nIdade:" + idade
				+ "\nPeso:" + peso
				+ "\nHistórico de doenças:\n" + historicoDoencas;
	}

}
