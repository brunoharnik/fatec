package controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import model.dao.AlunoDao;
import model.dao.implementation.AlunoDaoImpl;
import model.entities.Aluno;

public class AlunoController {
	private AlunoDao alunoDao = new AlunoDaoImpl();
	private ObservableList<Aluno> alunosOList = FXCollections.observableArrayList();
	
	public Integer cadastrarAluno(Aluno aluno) {
		return alunoDao.inserir(aluno);
	}
	
	public Boolean excluirAluno(String ra) {
		return alunoDao.removerRa(ra);
	}
	
	public Boolean atualizarAluno(Aluno aluno) {
		return alunoDao.atualizar(aluno);
	}
	
	public Aluno exibirAluno (String ra) {
		return alunoDao.pesquisarPorRa(ra);
	}
	
	public ObservableList<Aluno> listarAlunos() {
		for (Aluno aluno : alunoDao.listarTodosOsAlunos()) {
			alunosOList.add(aluno);
		}
		return alunosOList;
	}
	
}
