import java.util.ArrayList;
import java.util.List;

public class Aeronave {
	
	public String modelo;
	public Piloto piloto;
	public String companhia;
	public List<Passageiro> passageiros = new ArrayList<Passageiro>();
	public boolean voando;
	
	public void voar(Piloto piloto) {
		System.out.println("A aeronave modelo " + modelo + " da companhia " + companhia + " está voando com o piloto " + piloto.nome);
		System.out.println("\nLista de passageiros:\n");
		for (Passageiro p : passageiros) {
			System.out.println(p.nome);
		}
	}
}
