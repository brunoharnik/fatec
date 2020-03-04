import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class GestaoAlunos {
	
	int indice;
	Aluno[] alunos = new Aluno[50];
	
	void criar() {
		alunos[indice] = new Aluno();
		
		alunos[indice].id = new Random().nextLong();
		
		System.out.println("Digite o nome do aluno: ");
		Scanner scan = new Scanner(System.in);
		String entrada = scan.nextLine();
		alunos[indice].nome = entrada;
		
		System.out.println("Digite o RA: ");
		scan = new Scanner(System.in);
		entrada = scan.nextLine();
		alunos[indice].ra = entrada;
		
		System.out.println("Digite a data de nascimento: dd/MM/yyyy");
		scan = new Scanner(System.in);
		entrada = scan.nextLine();
		try {
			Date dn = new SimpleDateFormat("dd/MM/yyyy").parse(entrada);
			alunos[indice].nascimento = dn;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		indice++;
	}

	void atualizar() {
		
	}
	
	void excluir() {
		System.out.println("Digite o RA que deve ser excluido: ");
		Scanner scan = new Scanner(System.in);
		String entrada = scan.nextLine();
		for (int i = 0; i < alunos.length; i++) {
			if (alunos[i] != null && entrada.equals(alunos[i].ra)) {
				alunos[i] = null;
				while(i < alunos.length - 1) {
					alunos[i] = alunos[i + 1];
					i++;
				}
				System.out.println("RA excluido com sucesso!");
				return;
			}
		}
		System.out.println("O RA digitado não existe.");
	}
	
	void exibir() {
		System.out.println("Digite o RA que você deseja exibir os dados: ");
		Scanner scan = new Scanner(System.in);
		String entrada = scan.nextLine();
		for (int i = 0; i < alunos.length; i++) {
			if (alunos[i] != null && entrada.equals(alunos[i].ra)) {
				alunos[i].exibir();
				return;
			}
		}
		System.out.println("O RA digitado não existe.");
	}
	
	void menu() {
		while(true) {
			System.out.println("Gestão de Alunos"
							  +"\n\nEscolha uma das opções a seguir:"
							  +"\n(C)riar"
							  +"\n(E)xibir"
							  +"\n(R)emover"
							  +"\n(A)tualizar"
							  +"\n(S)air");
			
			Scanner scan = new Scanner(System.in);
			String textoMaiusculo = scan.nextLine().toUpperCase();
			char letra = textoMaiusculo.charAt(0);
			
			switch (letra) {
			case 'C':
				criar();
				break;
			case 'E':
				exibir();
				break;
			case 'R':
				excluir();
				break;
			case 'A':
				atualizar();
				break;
			case 'S':
				System.exit(0);
				break;
			default:
				System.out.println("Opção inválida.");
				break;
			}
		}
	}
	
	public static void main(String[] args) {
		
		GestaoAlunos g = new GestaoAlunos();
		g.menu();
	}
}
