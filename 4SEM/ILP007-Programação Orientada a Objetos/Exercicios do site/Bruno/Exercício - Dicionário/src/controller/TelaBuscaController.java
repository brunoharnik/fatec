package controller;

import java.io.IOException;
import java.util.Collection;

import model.Palavra;

public class TelaBuscaController extends ManipulacaoArquivo{
	
	private Collection<Palavra> dicionario;
	
	public Palavra submeteBusca(String palavra) {
		
		try {
			dicionario = this.lerArquivo();			
			for (Palavra p : dicionario) {
				if (p.getPalavra().equalsIgnoreCase(palavra)) return p;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
