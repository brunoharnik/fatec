package bonus_funcionario;

import java.util.ArrayList;
import java.util.List;


public class RH {

	List<Funcionario> funcionarios = new ArrayList<>();
	
	private int id;
	
	
    public int gerarid() {
    	this.id ++;
        return this.id;
    }  
	
    
	public void valorBonus(Funcionario func) {
		
		double sal = func.getSalario();
		double bonus = 0;
		if(func.getFaltasNoAno() < 2) {
			bonus = sal + (sal * 0.30);
			System.out.println("ID: " + func.getId()
					+ " FUNCIONARIO: " + func.getNome()
					+ " SALARIO: " + func.getSalario()
					+ " VALOR COM BONUS DE 30%: " + bonus);
		}
		else if(func.getFaltasNoAno() > 1 && func.getFaltasNoAno() <= 4){
			bonus = sal + (sal * 0.15);
			System.out.println("ID: " + func.getId()
			+ " FUNCIONARIO: " + func.getNome()
			+ " SALARIO: " + func.getSalario()
			+ " VALOR COM BONUS DE 15%: " + bonus);
		}
		else {
			bonus = sal + (sal * 0.05);
			System.out.println("ID: " + func.getId()
			+ " FUNCIONARIO: " + func.getNome()
			+ " SALARIO: " + func.getSalario()
			+ " VALOR COM BONUS DE 5%: " + bonus);
		}
	}
	
	public void mostrarBonusTodosFuncionarios() {
		for (Funcionario func : funcionarios){
			valorBonus(func);
		}
	}
	
	public void adicionarFuncionario(Funcionario func) {
		func.setId(gerarid());
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
