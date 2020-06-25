package controller;

import java.io.FileNotFoundException;
import java.io.IOException;

public class TelaCadastroController extends ManipulacaoArquivo {
	
	public Boolean cadastraPalavra(String palavra, String descricao) {
		
		if (!palavra.isEmpty() && !descricao.isEmpty()) {
			
			try {
				escreverNoArquivo(palavra, descricao);
				return true;
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return false;
	}
}
