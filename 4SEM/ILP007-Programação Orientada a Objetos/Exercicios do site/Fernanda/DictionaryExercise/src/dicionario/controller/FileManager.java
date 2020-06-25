package dicionario.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import dicionario.model.Word;
import dicionario.services.FileManagerI;

public class FileManager implements FileManagerI {
	


	@Override
	public Collection<Word> readFile() throws FileNotFoundException, IOException {
		
		Collection<Word> dictionary = new ArrayList<Word>();
		
		File file = new File("dictionary.txt");
		if (file.createNewFile()) {
			System.out.println("file was created");
		} else {
			System.out.println("file 'dictionary' already exists.");
		}
		FileReader fr = new FileReader(file);
		
		BufferedReader br = new BufferedReader(fr);
		
		String s;
		
			while ((s = br.readLine()) != null) {
				Word word = new Word(s, null);
				s = br.readLine();
				word.setDefinition(s);
				dictionary.add(word);
			}
			br.close();
	
		return dictionary;
	}

	@Override
	public void writeOnFile(String name, String definition) throws IOException {
		File file = new File("dictionary.txt");
		FileWriter fw = new FileWriter(file, true);
		BufferedWriter bw = new BufferedWriter(fw);
		
		
		bw.write(name);
		bw.newLine();
		bw.write(definition);
		bw.newLine();
		bw.close();
	}

}
