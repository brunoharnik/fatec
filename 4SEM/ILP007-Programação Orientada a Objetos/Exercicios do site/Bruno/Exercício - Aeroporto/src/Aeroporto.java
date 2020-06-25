import java.util.ArrayList;
import java.util.List;

public class Aeroporto {
	
	public String nomeAeroporto;
	public String siglaAeroporto;
	public String cidadeAeroporto;
	public List<Aeronave> aeronavesParadas = new ArrayList<Aeronave>();
	public boolean aberto;
	
	public void liberarVoo(Aeronave aeronave) {
		
		if (aeronavesParadas.contains(aeronave)) {
			for (Passageiro p : aeronave.passageiros) {
				p.embarcar(aeronave);
			}
			System.out.println("\n\nA aeronave " + aeronave.modelo + " da companhia " + aeronave.companhia + " está liberada para sair voando do aeroporto " + nomeAeroporto);
			aeronave.voar(aeronave.piloto);
			aeronave.piloto.pilotarAeronave(aeronave);
			aeronavesParadas.remove(aeronave);
		}else {
			System.out.println("não está no aeroporto.");
		}
	}
	
	public static void main(String[] args) {
		
		Aeroporto aeroporto = new Aeroporto();
		aeroporto.nomeAeroporto = "Clandestino do Zé Pequeno";
		
		Piloto pi1 = new Piloto();
		pi1.nome = "João Silva";
		pi1.registroDePiloto = "1234";
		
		Piloto pi2 = new Piloto();
		pi2.nome = "Maria Voadora";
		pi2.registroDePiloto = "5343";
		
		Aeronave an1 = new Aeronave();
		an1.modelo = "Teco-teco";
		an1.companhia = "Varig";
		
		Aeronave an2 = new Aeronave();
		an2.modelo = "Ultraleve";
		an2.companhia = "Traficantes da América do Sul";
		
		
		Passageiro pa1 = new Passageiro();
		pa1.nome = "Felizberto Pereira";

		Passageiro pa2 = new Passageiro();
		pa2.nome = "Amanda Fonseca";
		
		Passageiro pa3 = new Passageiro();
		pa3.nome = "Reginaldo Avalicatino";
		
		
		an1.piloto = pi1;
		an2.piloto = pi2;
		
		an1.passageiros.add(pa1);
		an1.passageiros.add(pa2);
		an1.passageiros.add(pa3);
		
		aeroporto.aeronavesParadas.add(an1);
		aeroporto.aeronavesParadas.add(an2);
		
		aeroporto.liberarVoo(an1);
		aeroporto.liberarVoo(an2);

	}
}
