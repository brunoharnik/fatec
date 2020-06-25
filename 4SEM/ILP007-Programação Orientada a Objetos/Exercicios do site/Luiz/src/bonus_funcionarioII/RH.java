package bonus_funcionarioII;

import java.util.ArrayList;
import java.util.List;


public class RH {

	List<Funcionario> funcionarios = new ArrayList<>();
	
    
	public void valorBonus(Funcionario func) {
		
		double sal = func.getSalario();
		double bonus = 0;
		
		//Calculo de bonus mediante criterio de faltas
		if(func.getFaltasNoAno() < 2) {
			bonus += sal * 0.30;
		}
		else if(func.getFaltasNoAno() > 1 && func.getFaltasNoAno() <= 4){
			bonus += sal * 0.15;
		}
		else {
			bonus += sal + sal * 0.05;
		}
		
		//Calculo de bonus mediante avaliacao
		if(func.getUltimaNotaAvaliacao() > 7) {
			bonus += sal * 0.30;
		}
		else if (func.getUltimaNotaAvaliacao() > 4 && func.getUltimaNotaAvaliacao() < 8) {
			bonus+= sal * 0.15;
		}
		else {
			bonus += sal + sal * 0.05;
		}
		
		double total = sal + bonus;
		
		System.out.println(" FUNCIONARIO: " + func.getNome()
				+ " ID: " + func.getId()
				+ " MATRICULA: " + func.getMatricula() 
				+ " SALARIO: " + func.getSalario()
				+ " BONUS: " + bonus
				+ " TOTAL: " + total
				);
		
	}
	
	public void mostrarBonusTodosFuncionarios() {
		for (Funcionario func : funcionarios){
			valorBonus(func);
		}
	}
	
	public void adicionarFuncionario(Funcionario func) {
		if(funcionarios.add(func) == true) {
			System.out.println("Funcionario adicionado com sucesso!");
		}
		else {
			System.out.println("Erro aoadicionar funcionario, dados inválidos ou inconsistentes.");
		}
	}
	
	public void removerFuncio(int id) {
		if(funcionarios.remove((long)id) == true) {
			System.out.println("Funcionario com ID: " + id + " removido com sucesso!");
		}
		else {
			System.out.println("Erro ao excluir funcionario, com ID: " + id + " inválido ou inexistente.");
		}
		
	}
	
	
}




/*Long id, String nome, String matricula, double salario, int faltasNoAno, float ultimaNotaAvaliacao, int qtdPremiosRecebidosAno, 
boolean graduacao, String nomeFaculdade, String nomeCurso */
