

import java.util.Date;

public class Aluno {
	
	long id;
	String nome;
	String ra;
	Date nascimento;
	
	void exibir() {
		System.out.println("Id: " + id
						  +"\nNome: " + nome
						  +"\nR.A.: " + ra
						  +"\nNascimento: " + nascimento);
	}
}
