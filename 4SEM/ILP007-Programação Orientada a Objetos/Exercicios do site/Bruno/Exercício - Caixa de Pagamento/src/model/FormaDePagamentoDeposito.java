package model;

public class FormaDePagamentoDeposito extends FormaDePagamento{
	
	@Override
	public String imprimePagamento(Double pagamento) {
		return "R$" + pagamento + " foram pagos em depósito.";
	}
}
