package dicionario.view;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Dictionary extends Application {
	
	SearchScreen searchScreen;
	
	@Override
	public void start(Stage stage) throws Exception {
		
		searchScreen = new SearchScreen();
		Scene scene = new Scene(searchScreen);
				
		stage.setScene(scene);
		stage.setTitle("Dictionary");
		stage.show();
	}
	
	public static void main(String[] args) {
		Application.launch(Dictionary.class, args);
	}
}
