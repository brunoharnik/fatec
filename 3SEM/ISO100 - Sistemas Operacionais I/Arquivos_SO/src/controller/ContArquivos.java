package controller;

import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.swing.JOptionPane;

public class ContArquivos implements IContArquivos {

	@Override
	public void leDir(String path) throws IOException {
		File diretorio = new File(path); // s� fez o open arquivo, n�o fez o read
		if (diretorio.exists() && diretorio.isDirectory()) { // se existir e for um 
			//diretorio
			File[] arquivos = diretorio.listFiles(); // vou ler e mostrar
					for (File arquivo : arquivos) {
						String nome = "";
						if (arquivo.isDirectory()) {
							nome = nome + "<DIR> ";
							
						}
						nome = nome + arquivo.getName();
						System.out.println(nome);
					
					}
			
		} else {
			throw new IOException ("Diretorio inv�lido");
			
		}
		
		
	}

	@Override
	public void leArquivo(String path, String nome) throws IOException {
		File arquivo = new File(path,nome);
		if (arquivo.exists() && arquivo.isFile()) {
			FileInputStream leFluxo = new FileInputStream(arquivo);
			InputStreamReader paraString = new InputStreamReader(leFluxo);
			BufferedReader buffer = new BufferedReader(paraString);
			String linha = buffer.readLine();
			while (linha != null) {
				System.out.println(linha);
				linha = buffer.readLine();
			}
			buffer.close();
			paraString.close();
			leFluxo.close();
		} else {
			throw new IOException ("Arquivo inv�lido");
		}
		
	}

	@Override
	public void criaArq(String path, String nome) throws IOException {
		File arquivo = new File(path, nome);
		File diretorio = new File(path);
		if (diretorio.exists()) {
			boolean arquivoExiste = false;
			if (arquivo.exists()) {
				arquivoExiste = true; // se o arquivo n�o existir, � um write, 
				//se j� existir � um append
				
			}
			String texto = geraTexto();
			FileWriter abreArquivo = new FileWriter(arquivo, arquivoExiste);
			PrintWriter escreve = new PrintWriter(arquivo);
			escreve.write(texto);
			escreve.flush();
			escreve.close();
			abreArquivo.close();
			
		} else {
			throw new IOException("Diret�rio inv�lido");
		}
	
		
	}

	private String geraTexto() {
		StringBuffer buffer = new StringBuffer();
		String linha = "";
		while (!linha.equalsIgnoreCase("fim")) {
			linha = JOptionPane.showInputDialog(null,"Digite uma Frase", 
					"Entrada", JOptionPane.PLAIN_MESSAGE);
			buffer.append(linha + "\r\n");
		}
		
		return buffer.toString();
	}

	@Override
	public void abreArq(String path, String nome) throws IOException {
		File arquivo = new File(path, nome);
		if (arquivo.exists() && arquivo.isFile()) {
			// Desktop // essa classe consegue verificar o meu SO e abrir arquivo
			Desktop desk = Desktop.getDesktop();
			// desk.print(file); // MANDa imprimir direto
			// desk.open(arg0); abre o arquivo por programa padr�o
			desk.open(arquivo); // vai pegar SEMPRE o programa padr�o. � isso
			/// que faz a classe Desktop! � uma classe EST�TICA, por isso eu n�o
			// posso dar um new nela
			} else {
				throw new IOException("Arquivo inv�lido");
			}
	
		
	}
	
	

}
