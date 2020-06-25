package dicionario.services;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;

import dicionario.model.Word;

public interface FileManagerI {

	Collection<Word> readFile() throws FileNotFoundException, IOException;
	
	void writeOnFile(String name, String definition) throws FileNotFoundException, IOException;
	
}
