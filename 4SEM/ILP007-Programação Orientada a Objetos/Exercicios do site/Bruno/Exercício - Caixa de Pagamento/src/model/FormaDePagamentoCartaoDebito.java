package model;

public class FormaDePagamentoCartaoDebito extends FormaDePagamento{

	@Override
	public String imprimePagamento(Double pagamento) {
		return "R$" + pagamento + " foram pagos no cartão de débito.";
	}

}
