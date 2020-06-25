
public class Piloto {
	
	public String nome;
	public String registroDePiloto;
	public String cidadeDoPiloto;
	public String estadoDoPiloto;
	public String paisDoPiloto;

	public void pilotarAeronave(Aeronave aeronave) {
		System.out.println(nome + " está pilotando a " + aeronave.modelo + " da companhia " + aeronave.companhia);
	}

}
