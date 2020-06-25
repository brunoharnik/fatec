import java.util.Date;

import model.*;

public class PetShop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Doenca doenca1 = new Doenca("Sarna", "Sarnus", "Coceira, vermelhidão e feridas na pele",
				"Violeta Ginsana, pomadinha e carinho");
		Doenca doenca2 = new Doenca("Febre do Rato", "Ratiferus-febris", "Febre de 40 graus.", "Dipirona");

		Veterinario vet1 = new Veterinario("Doutor Afonso", "6546546DADS5", "+5511987789987", "Cardiologista",
				"Urologista", "Pediatra canino");
		Veterinario vet2 = new Veterinario("Doutora Paula", "623432452134", "+5511954343554", "Fuçologista",
				"Orelhologista", "Pediatra canino");
		
		Dono dono1 = new Dono("Lucas", "+5511987498987", "lucassssss@gmail.com");
		Dono dono2 = new Dono("Jairrô", "4323424323442", "vergonhadaprofisson@uol.com.br");
		
		dono1.cadastrarPet("Rex", 4.2, 78.53);
		dono1.cadastrarPet("Genoveva", 36.4, 288.13);
		dono2.cadastrarPet("Almôndega", 1, 0.89);
		
		Animal a1 = new Animal(null, 0, 0), a2 = new Animal(null, 0, 0);
		
		for (Animal animal : dono1.getAnimais()) {
			if (animal.getNome().equals("Rex")) a1 = animal;
			
			if (animal.getNome().equals("Genoveva")) a2 = animal;
		}
		
		dono1.marcarConsulta(a1, vet1, new Date());
		
		vet1.gerarDiagnostico(a1, doenca1, doenca2);
		
		System.out.println(dono1);
		
	}
}
