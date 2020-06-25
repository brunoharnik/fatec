package view;

import controller.TelaCadastroController;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class TelaCadastro extends Stage{

	private VBox vbox;
	private Scene cena;
	private Label lblPalavra;
	private TextField txtDefinicao;
	private FlowPane painelBotoes;
	private Button btnCancelar, btnCadastrar;
	
	TelaCadastroController tcc;
	
	public TelaCadastro(String palavra) {
		
		tcc = new TelaCadastroController();
		
		lblPalavra = new Label(palavra + ":");
		txtDefinicao = new TextField();
		txtDefinicao.setPromptText("Definição");
		
		btnCancelar = new Button("Cancelar");
		btnCadastrar = new Button("Cadastrar");
		painelBotoes = new FlowPane(btnCancelar, btnCadastrar);
		painelBotoes.setHgap(10);
		
		vbox = new VBox(lblPalavra, txtDefinicao, painelBotoes);
		vbox.setPadding(new Insets(20));
		
		cena = new Scene(vbox);
		this.setScene(cena);
		this.setTitle("Cadastrar palavra no dicionário");
		this.show();
		
		btnCancelar.setOnAction((e) -> {
			this.close();
			e.consume();
		});
		
		btnCadastrar.setOnAction((e) -> {
			if (tcc.cadastraPalavra(palavra, txtDefinicao.getText())) {
				Alert alertSucesso = new Alert(AlertType.INFORMATION);
				alertSucesso.setTitle("Sucesso!");
				alertSucesso.setContentText("Palavra registrada com sucesso no dicionário.");
				alertSucesso.showAndWait();
				this.close();
				e.consume();
			}else {
				Alert alertErro = new Alert(AlertType.ERROR);
				alertErro.setTitle("Erro!");
				alertErro.setContentText("Não foi possível registrar '" + palavra + "'.");
				alertErro.showAndWait();
				e.consume();
			}
		});
		
		
	}
}