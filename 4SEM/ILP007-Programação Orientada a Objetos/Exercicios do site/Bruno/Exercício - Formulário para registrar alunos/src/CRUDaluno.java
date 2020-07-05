import boundary.AlunoBoundary;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class CRUDaluno extends Application {

	public static void main(String[] args) {
		Application.launch(CRUDaluno.class, args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		AlunoBoundary alunoBoundary = new AlunoBoundary();
		
		Scene cena = new Scene(alunoBoundary, 800, 600);
		
		primaryStage.setScene(cena);
		primaryStage.setTitle("CRUD Alunos");
		primaryStage.show();
	}
}
