package services;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;

import model.Palavra;

public interface ManipulacaoArquivoI {

	Collection<Palavra> lerArquivo() throws FileNotFoundException, IOException;
	
	void escreverNoArquivo(String palavra, String descricao) throws FileNotFoundException, IOException;
}
