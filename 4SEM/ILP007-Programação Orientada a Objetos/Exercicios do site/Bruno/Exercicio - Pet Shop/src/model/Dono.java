package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class Dono {

	private int id;
	private String nome;
	private String telefone;
	private String email;
	private List<Animal> animais;
	
	public Dono(String nome, String telefone, String email) {
		this.id = new Random().nextInt();
		this.nome = nome;
		this.telefone = telefone;
		this.email = email;
		this.animais = new ArrayList<Animal>();
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Animal> getAnimais() {
		return animais;
	}

	public void setAnimais(List<Animal> animais) {
		this.animais = animais;
	}

	public void cadastrarPet(String nome, double idade, double peso) {
		Animal a = new Animal(nome, idade, peso);
		this.animais.add(a);
	}
	
	public boolean marcarConsulta(Animal animal, Veterinario veterinario, Date agendamento) {
		System.out.println("Consulta marcada.");
		return true;
	}

	@Override
	public String toString() {
		return "Dono\n"
				+ "Id: " + id
				+ "\nNome: " + nome
				+ "\nTelefone: " + telefone
				+ "\nEmail: " + email
				+ "\nAnimais:\n" + animais;
	}
	
	
}
