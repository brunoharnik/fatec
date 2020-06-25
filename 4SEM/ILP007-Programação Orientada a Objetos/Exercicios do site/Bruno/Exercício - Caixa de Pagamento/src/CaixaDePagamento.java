import java.util.HashMap;
import java.util.Scanner;

import model.*;

public class CaixaDePagamento{

	public static void main(String[] args) {
		
		HashMap<Character, FormaDePagamento> formasDePagamento = new HashMap<Character, FormaDePagamento>();
		
		formasDePagamento.put('A', new FormaDePagamentoCartaoCredito());
		formasDePagamento.put('B', new FormaDePagamentoCartaoDebito());
		formasDePagamento.put('C', new FormaDePagamentoCheque());
		formasDePagamento.put('D', new FormaDePagamentoDeposito());
		formasDePagamento.put('E', new FormaDePagamentoDinheiro());
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Digite o valor pago: ");
		
		Double pagamento = scanner.nextDouble();
		
		System.out.println("Digite a forma de pagamento:\n"
				+ "A: Cartão de Crédito\n"
				+ "B: Cartão de débito\n"
				+ "C: Cheque\n"
				+ "D: Depósito\n"
				+ "E: Dinheiro");
		
		Character opcao = Character.toUpperCase(scanner.next().charAt(0));
		
		scanner.close();
		
		System.out.println(formasDePagamento.get(opcao).imprimePagamento(pagamento));
		
		
	}

}
