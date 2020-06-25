import java.util.Date;

public class Conta {
	
	private double saldo;
	private String numero;
	private String senha;
	private Transacao[] historico;
	
	public boolean efetuarSaque(double valor) {
		return true;
	}
	
	public boolean efetuarDeposito(double valor) {
		return true;
	}
	
	public boolean efetuarPagamento(String boleto, double valor) {
		return true;
	}
	
	public Transacao[] extrato(Date dInicio, Date dFinal) {
		return null;
	}
}
