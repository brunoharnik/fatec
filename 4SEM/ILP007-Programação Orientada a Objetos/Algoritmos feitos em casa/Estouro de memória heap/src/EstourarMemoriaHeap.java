public class EstourarMemoriaHeap {
	
	EstourarMemoriaHeap proximo;
	int vetorGrande[] = new int[50000];

	public static void main(String[] args) throws OutOfMemoryError {
		// TODO Auto-generated method stub
		
		EstourarMemoriaHeap raiz = new EstourarMemoriaHeap();
		EstourarMemoriaHeap ultimo = raiz;
				
		int i = 1;
		
		while (true) {
			ultimo.proximo = new EstourarMemoriaHeap();
			ultimo = ultimo.proximo;
			
			System.out.println("Tentativa de estourar a memória nº " + i);
			i++;
		}
		
	}

}
