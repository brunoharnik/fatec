import java.util.Date;

public class Passageiro {
	
	public String nome;
	public String documento;
	public Date dataNascimento;
	public Boolean temBagagem;
	public Boolean suspeito;
	
	public void embarcar(Aeronave aeronave) {
		System.out.println(nome + " embarcou na aeronave " + aeronave.modelo + " da companhia " + aeronave.companhia);
	}
}
