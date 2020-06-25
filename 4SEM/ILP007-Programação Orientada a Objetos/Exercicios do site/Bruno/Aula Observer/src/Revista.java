
import java.util.ArrayList;
import java.util.List;

public class Revista implements Publicador {
	private String nome;
	
	public Revista(String nome) { 
		this.nome = nome;
	}
	
	private List<Observador> lista = new ArrayList<>();
	@Override
	public void adicionar(Observador o) {
		lista.add(o);
	}

	@Override
	public void remover(Observador o) {
		lista.remove(o);
	}

	@Override
	public void distribuir(String msg) {
		for (Observador o : lista) { 
			o.recebeNoticia(msg + " na revista " + this.nome);
		}
	}

}