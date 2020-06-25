package dicionario.controller;

import java.io.IOException;
import java.util.Collection;

import dicionario.model.Word;
import javafx.event.ActionEvent;
import javafx.scene.control.Button;

public class SearchScreenController extends FileManager {

	private Collection<Word> dictionary;
	
	public Word searchSubmit(String word) {
		
		try {
			dictionary = this.readFile();
			
			for (Word w : dictionary) {
				if (w.getName().equalsIgnoreCase(word)) {
					return w;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
