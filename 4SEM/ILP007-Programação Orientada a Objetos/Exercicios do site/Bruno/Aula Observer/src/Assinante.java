
public class Assinante implements Observador {
	private String nome;
	
	public Assinante(String nome) { 
		this.nome = nome;
	}
	
	@Override
	public void recebeNoticia(String noticia) {	
		System.out.println("O assinante " + this.nome + 
				" está lendo a noticia " + noticia);
	}
}