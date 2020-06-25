package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import model.Palavra;
import services.ManipulacaoArquivoI;

public class ManipulacaoArquivo implements ManipulacaoArquivoI {

	@Override
	public Collection<Palavra> lerArquivo() throws FileNotFoundException, IOException {
		
		Collection<Palavra> dicionario = new ArrayList<Palavra>(); 
		
		File arquivo = new File("dicionario.txt");
		if(arquivo.createNewFile()) {
			System.out.println("Arquivo sendo criado...");
		} else {
			System.out.println("Arquivo 'dicionario.txt' já existe. Buscando...");
		}
		FileReader fr;

		fr = new FileReader(arquivo);
		BufferedReader br = new BufferedReader(fr);

		String s;
		
		while ((s = br.readLine()) != null) {
			Palavra palavra = new Palavra(s, null);
			s = br.readLine();
			palavra.setDefinicao(s);
			dicionario.add(palavra);
		}
		br.close();

		return dicionario;
	}

	@Override
	public void escreverNoArquivo(String palavra, String descricao) throws FileNotFoundException, IOException {

		File arquivo = new File("dicionario.txt");
		FileWriter fw = new FileWriter(arquivo, true);
		BufferedWriter bw = new BufferedWriter(fw);
		
		bw.write(palavra);
		bw.newLine();
		bw.write(descricao);
		bw.newLine();
		
		bw.close();
	}

}
















