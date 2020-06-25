package model;

public class FormaDePagamentoCartaoCredito extends FormaDePagamento {

	@Override
	public String imprimePagamento(Double pagamento) {
		return "R$" + pagamento + " foram pagos no cartão de crédito.";
	}
}
