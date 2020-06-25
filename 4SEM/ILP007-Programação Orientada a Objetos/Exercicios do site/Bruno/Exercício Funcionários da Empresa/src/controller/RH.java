package controller;

import java.util.ArrayList;
import java.util.List;

import model.Funcionario;

public class RH {

	private List<Funcionario> funcionarios = new ArrayList<Funcionario>();
	
	public Double valorBonus(Funcionario funcionario) {
		
		Double bonus;
		
		if (funcionario.getFaltasNoAno() < 2) bonus = funcionario.getSalario() * 0.3;
		else if (funcionario.getFaltasNoAno() < 5) bonus = funcionario.getSalario() * 0.15;
		else bonus = funcionario.getSalario() * 0.05;
		
		if (funcionario.getUltimaNotaAvaliacao() > 7) bonus += funcionario.getSalario() * 0.3;
		else if (funcionario.getUltimaNotaAvaliacao() <= 7 && funcionario.getUltimaNotaAvaliacao() >= 5) bonus += funcionario.getSalario() * 0.15;
		else bonus += funcionario.getSalario() * 0.05;
		
		return bonus;
	}
	
	public void mostrarTodosOsFuncionarios() {
		for (Funcionario f : funcionarios) {
			System.out.println("\n\nID: " + f.getId()
							 + "\nNome: " + f.getNome()
							 + "\nMatrícula: " + f.getMatricula()
							 + "\nSalario: R$" + f.getSalario()
							 + "\nFaltas no ano: " + f.getFaltasNoAno()
							 + "\nÚltima nota de avaliação: " + f.getUltimaNotaAvaliacao()
							 + "\nQuantidade de prêmios recebidos no ano: " + f.getQtdPremiosRecebidosAno()
							 + "\nGraduado: " + f.isGraduado()
							 + "\nNome da Faculdade: " + f.getNomeFaculdade()
							 + "\nNome do curso: " + f.getNomeCurso()
							 + "\nBônus: R$" + valorBonus(f));
		}
	}
	
	public void adicionarFuncionario(Funcionario f) {
		funcionarios.add(f);
	}
	
	public void removerFuncionari(Funcionario f) {
		funcionarios.remove(f);
	}	
}