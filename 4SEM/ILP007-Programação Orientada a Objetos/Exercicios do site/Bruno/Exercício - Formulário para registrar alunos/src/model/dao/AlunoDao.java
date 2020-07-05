package model.dao;

import java.util.Set;

import model.entities.Aluno;

public interface AlunoDao {

	Integer inserir(Aluno aluno);
	Boolean atualizar(Aluno aluno);
	Boolean removerRa(String ra);
	Aluno pesquisarPorRa(String ra);
	Set<Aluno> listarTodosOsAlunos();
}
