import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class TelaCadastroContato extends Application{

	public static void main(String[] args) {
		Application.launch(TelaCadastroContato.class, args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		GridPane gridPane = new GridPane();
		gridPane.setPadding(new Insets(25));
		gridPane.setVgap(10);
		gridPane.setHgap(10);
		
		Label lblId = new Label("Id: ");
		TextField txtId = new TextField();
		txtId.setPromptText("Digite seu id aqui...");
		
		Label lblNome = new Label("Nome: ");
		TextField txtNome = new TextField();
		txtNome.setPromptText("Digite seu nome aqui...");
		
		Label lblTelefone = new Label("Telefone: ");
		TextField txtTelefone = new TextField();
		txtTelefone.setPromptText("Digite seu telefone aqui...");
		
		FlowPane flowPane = new FlowPane();
		flowPane.setHgap(10);
		
		Button btnSalvar = new Button("Salvar");
		Button btnPesquisar = new Button("Pesquisar");
		
		flowPane.getChildren().add(btnSalvar);
		flowPane.getChildren().add(btnPesquisar);

		gridPane.add(lblId, 0, 0);
		gridPane.add(txtId, 1, 0);
		gridPane.add(lblNome, 0, 1);
		gridPane.add(txtNome, 1, 1);
		gridPane.add(lblTelefone, 0, 2);
		gridPane.add(txtTelefone, 1, 2);
		gridPane.add(flowPane, 1, 3);
		
		Scene cena = new Scene(gridPane, 540, 200);
		primaryStage.setScene(cena);
		primaryStage.setTitle("Tela de Cadastro Contato");
		primaryStage.show();
		
	}
}
