package view;

import java.util.ArrayList;
import java.util.List;

import controller.FuncionarioController;
import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import model.Funcionario;

public class TelaMenuFuncionario extends BorderPane {
	
	HBox hbox;
	FlowPane flowPane;
	VBox vbox;
	
	FuncionarioController fc;
	Funcionario f;
	TelaCadastraFuncionario tcf;
	
	public TelaMenuFuncionario() {
		this.setMinSize(400, 400);
		
		Button buttonCadastrar 	= new Button("Cadastrar");
		buttonCadastrar.setMinWidth(100);
		
		Button buttonAtualizar 	= new Button("Atualizar");
		buttonAtualizar.setMinWidth(100);
		
		Button buttonExcluir 	= new Button("Excluir");
		buttonExcluir.setMinWidth(100);
		
		Button buttonExibir 	= new Button("Exibir");
		buttonExibir.setMinWidth(100);
		
		TableView<Funcionario> tabelaFuncionario = new TableView<>();
		tabelaFuncionario.setMinSize(400, 400);
		
		List<Funcionario> funcionarios = new ArrayList<>();
		
		flowPane = new FlowPane();
		flowPane.setPadding(new Insets(20));
		
		hbox = new HBox(buttonCadastrar, buttonAtualizar, buttonExcluir, buttonExibir);
		//hbox.getChildren().addAll(buttonAtualizar, buttonCadastrar, buttonExcluir, buttonExibir);
		
		vbox = new VBox(hbox, tabelaFuncionario);
		
		this.getChildren().addAll(vbox);
	
		buttonCadastrar.setOnAction((e) -> {
			tcf = new TelaCadastraFuncionario();
		});

		buttonCadastrar.setOnAction((e) -> {

		});

		buttonCadastrar.setOnAction((e) -> {

		});

		buttonCadastrar.setOnAction((e) -> {

		});
	
		
		
	
	}
	
}
