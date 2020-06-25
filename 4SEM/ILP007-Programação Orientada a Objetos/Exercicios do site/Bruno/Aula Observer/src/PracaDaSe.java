
public class PracaDaSe {

	public static void main(String[] args) {
		Revista info = new Revista("Info");
		Revista stones = new Revista("Rolling Stones");
		Revista galileu = new Revista("Galileu");
		
		Assinante a1 = new Assinante("João");
		Assinante a2 = new Assinante("Maria");
		Assinante a3 = new Assinante("José");
		Assinante a4 = new Assinante("Sara");
		Assinante a5 = new Assinante("Vitor");
		Assinante a6 = new Assinante("Suzano");
		
		info.adicionar(a1);
		info.adicionar(a4);
		
		stones.adicionar(a3);
		stones.adicionar(a1);
		stones.adicionar(a2);
		
		galileu.adicionar(a6);
		galileu.adicionar(a5);
		galileu.adicionar(a2);
		
		info.distribuir("Bolsonaro renuncia do cargo");
		stones.distribuir("Show com parceria entre Chimbinha e Metallica");
		galileu.distribuir("Venezuela lança vacina para a cura do COVID");
		
	}
}