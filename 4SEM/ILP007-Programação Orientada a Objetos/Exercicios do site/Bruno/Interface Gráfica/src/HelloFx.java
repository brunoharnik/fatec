import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

public class HelloFx extends Application {

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		Pane pane = new Pane();
		Scene scn = new Scene(pane, 600, 400);
		
		Button btnOk = new Button("Ok");
		
		Label lblWelcome = new Label("Bem vindo ao java FX");
		pane.getChildren().add(lblWelcome);
		pane.getChildren().add(btnOk);
		
		btnOk.relocate(300, 50);
				
		primaryStage.setScene(scn);
		primaryStage.show();
	}
	
	public static void main(String[] args) {
		Application.launch(HelloFx.class, args);
	}
}