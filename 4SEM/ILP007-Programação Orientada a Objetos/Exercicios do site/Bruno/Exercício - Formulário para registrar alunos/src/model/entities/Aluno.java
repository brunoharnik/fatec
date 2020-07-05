package model.entities;

import java.time.LocalDate;

public class Aluno {

	private Integer id;
	private String ra;
	private String nome;
	private LocalDate nascimento;

	public Aluno(Integer id, String ra, String nome, LocalDate nascimento) {
		this.id = id;
		this.ra = ra;
		this.nome = nome;
		this.nascimento = nascimento;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRa() {
		return ra;
	}

	public void setRa(String ra) {
		this.ra = ra;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public LocalDate getNascimento() {
		return nascimento;
	}

	public void setNascimento(LocalDate nascimento) {
		this.nascimento = nascimento;
	}

}
