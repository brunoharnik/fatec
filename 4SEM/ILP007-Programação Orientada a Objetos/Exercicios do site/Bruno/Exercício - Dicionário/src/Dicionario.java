import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;
import view.TelaBusca;

public class Dicionario extends Application {

	public TelaBusca telaBusca;
	
	public static void main(String[] args) {
		Application.launch(Dicionario.class, args);
	}

	@Override
	public void start(Stage stage) throws Exception {
		
		telaBusca = new TelaBusca();
		Scene cena = new Scene(telaBusca);
		 
		stage.setScene(cena);
		stage.setTitle("Dicionário");
		stage.show();
	}
}
