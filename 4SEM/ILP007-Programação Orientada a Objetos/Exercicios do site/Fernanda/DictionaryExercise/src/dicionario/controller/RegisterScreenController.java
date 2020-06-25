package dicionario.controller;

import java.io.IOException;

import dicionario.model.Word;

public class RegisterScreenController extends FileManager {

	public boolean registerWord (String name, String definition) {
		
		if ((!name.isEmpty()) && (!definition.isEmpty())) {
			try {
				writeOnFile(name, definition);
				return true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
