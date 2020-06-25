import java.util.Scanner;

import controller.RH;
import model.Funcionario;

public class Empresa {
	
	private static RH rh;
	private static Scanner s = new Scanner(System.in);
	private static Long contaId = 1L;
	
	
	public Empresa() {
		rh = new RH();
	}
	
	public static Funcionario contratarFuncionario() {
		
		Funcionario f = new Funcionario();
		
		System.out.println("Digite o nome:");
		f.setNome(s.next());
		System.out.println("Digite a matrícula:");
		f.setMatricula(s.next());
		System.out.println("Digite a quantidade de faltas no ano:");
		f.setFaltasNoAno(s.nextInt());
		System.out.println("Digite a última nota de avaliação:");
		f.setUltimaNotaAvaliacao(s.nextFloat());
		System.out.println("Digite o salário:");
		f.setSalario(s.nextDouble());
		f.setId(contaId++);
		
		return f;
	}
	
	public static void main(String[] args) {
		new Empresa();
		
		System.out.println("Exercício do bônus dos funcionários");
		
		for (int i = 0; i < 2; i++) {
			Funcionario f = contratarFuncionario();
			rh.adicionarFuncionario(f);
		}
		
		rh.mostrarTodosOsFuncionarios();
		
		s.close();

	}

}
