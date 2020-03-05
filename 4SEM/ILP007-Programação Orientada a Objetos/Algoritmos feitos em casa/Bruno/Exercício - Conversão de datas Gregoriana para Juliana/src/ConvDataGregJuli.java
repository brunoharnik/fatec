import java.util.Scanner;

public class ConvDataGregJuli {

	public static void main(String[] args) {

		System.out.println("Conversão de data Gregoriana para Juliana");

		System.out.println("Digite o dia:");
		Scanner scan = new Scanner(System.in);
		int dia = scan.nextInt();

		System.out.println("Digite o mês:");
		scan = new Scanner(System.in);
		int mes = scan.nextInt();

		System.out.println("Digite o ano:");
		scan = new Scanner(System.in);
		int ano = scan.nextInt();

		System.out.println(DataJuliana(dia, mes, ano));
	}

	public static int DataJuliana(int dia, int mes, int ano) {
		
		int data = dia + mes + ano;
		int base = 15 + 10 + 1582;
		
		if (mes < 3) {
			ano -= 1;
			mes += 12;
		}
		
		if (data >= base) {
			double a = ano / 100;
			double b = a / 4;
			double c = 2 - a + b;
			double d = 365.25 * (ano + 4716);
			double e = 30.6001 * mes + 1;
			
		    int dataju = (int) ((d + e + dia + 0.5 + c - 1524.5) + 30);
		    return dataju;
		}
		

		return 0;
	}
}

/*
 * Nosso calendário atual é Gregoriano.
 * 
 * Faça uma função que receba como argumento o dia, mês e ano do nosso
 * calendário gregoriano, e retorne o número do dia correspondente no calendário
 * Juliana
 * 
 * Fórmula :
 * 
 * data = dia + mes + ano base = 15 + 10 + 1582 se mês < 3 então: ano -= 1 mes
 * += 12
 * 
 * se data >= base então: a = ano / 100 b = a / 4 c = 2 - a + b d = 365.25 *
 * (ano + 4716) e = 30.6001 * mes + 1 dataju = (d + e + dia + 0.5 + c - 1524.5)
 * + 30 se dataju for numero inteiro então: dataju -= 1 resposta = parte inteira
 * de dataju
 * 
 * Para testar informe para a função a data de inicio das olimpíadas do Brasil
 * 05 de Agosto de 2016. O resultado deverá ser : 2457606
 * 
 * Algoritmo adaptado do site http://ghiorzi.org/diasjuli.htm agradecimentos ao
 * William Nascimento pela interpretação do algoritmo
 * 
 */