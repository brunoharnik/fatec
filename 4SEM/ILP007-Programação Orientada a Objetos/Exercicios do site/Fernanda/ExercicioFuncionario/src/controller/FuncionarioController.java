package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import model.Funcionario;

public class FuncionarioController {
	
	int indice;
	List<Funcionario> funcionarios = new ArrayList<>();

	Scanner sc = new Scanner(System.in);

	public void criar(String nome, String matricula, Date admissao, Date demissao, Float salario, String horario) {
		Funcionario func = new Funcionario(nome, matricula, admissao, demissao, salario, horario); 
		funcionarios.add(func);	
		}

	public void atualizar(Integer indice, Funcionario funcionario) {
     // set é o método da collection que faz a atualização
		funcionarios.set(indice, funcionario);
	}

	public void excluir(Integer indice) {
		funcionarios.remove(indice);
	}

	public void exibir() {
		System.out.println("Digite um número de matrícula/registro: ");
		String input = sc.nextLine();
	//for (int i = 0; i < funcionarios.length; i++) {
			//if (input.equals()) {

		//	}
	}}
