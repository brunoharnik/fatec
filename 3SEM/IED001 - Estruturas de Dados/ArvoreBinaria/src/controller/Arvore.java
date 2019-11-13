package controller;

public class Arvore {
	public static No raiz;
	
	//Inserir novo valor a um novo n�
	public void inserir(int valor) {
		inserir(raiz, valor);
	}
	
	//Inserir n� com regra de arvore
	public void inserir( No node, int valor) {
		//Se a raiz for nula, inserimos na raiz
		if(node ==null) {
			System.out.println("Valor " +valor+ " inserido na raiz da arvore!");
			raiz = new No(valor);
			
		//Caso contrario:
		//Se for menor, inserimos no n� a esquerda
		}else {
			//Caso o valor seja menor que o n� raiz
			if (valor < node.getValor()) {
				//Verificando se o n� a esquerda � nulo
				if(node.getNoEsquerda() != null) {
					//Caso nao seja, chamanos a fun��o inserir, passando o n� a esquerda como raiz
					inserir(node.getNoEsquerda(), valor);
				}
				//Se for nulo, inserimos o valor diretamente ao n�
				else {
					System.out.println("Valor " + valor + " inserido a esquerda de "+ node.getValor());
					node.setNoEsquerda(new No(valor));
				}
			}
			//Caso o valor seja maior que o n� raiz
			else {
				//Se no a direita nao for nulo, chamaos a funcao inserir passando
				//Passamos no a direita como raiz 
				if(node.getNoDireita() != null) {
					inserir(node.getNoDireita(), valor);
				}
				else {
					//Se for nulo, inserimos o valor no n� a direita
					System.out.println("Valor " + valor + " inserido a direita de "+ node.getValor());
					node.setNoDireita(new No(valor));
				}
			}
		}
	}
	
}
