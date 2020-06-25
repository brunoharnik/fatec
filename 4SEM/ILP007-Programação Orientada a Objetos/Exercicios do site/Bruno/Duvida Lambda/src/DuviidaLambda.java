
public class DuviidaLambda {

	
	public interface EscreveA {
		void escreve(String texto);
	}
	
	public interface EscreveB {
		void escreve(String texto);
	}
	

		
		public static void teste(EscreveA a) {
			
		}
		
		public static void teste(EscreveB b) {
			
		}
		
		
	
	public static void main(String[] args) {
		
		teste((EscreveA) (e) -> {
			System.out.println("Erro de ambiguidade");
		});
		
		
		
	}

}
