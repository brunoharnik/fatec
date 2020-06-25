
public interface Publicador {
	void adicionar(Observador o);
	void remover(Observador o);
	void distribuir(String msg);
}