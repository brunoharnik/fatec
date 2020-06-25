package model;

public class FormaDePagamentoDinheiro extends FormaDePagamento {

	@Override
	public String imprimePagamento(Double pagamento) {
		return "R$" + pagamento + " foram pagos em dinheiro.";
	}
}
