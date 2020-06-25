package model;

public class FormaDePagamentoCheque extends FormaDePagamento {

	@Override
	public String imprimePagamento(Double pagamento) {
		return "R$" + pagamento + " foram pagos em cheque.";
	}

}
