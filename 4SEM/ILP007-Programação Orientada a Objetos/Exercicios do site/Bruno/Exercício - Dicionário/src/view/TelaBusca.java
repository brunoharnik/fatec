package view;

import controller.TelaBuscaController;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import model.Palavra;

public class TelaBusca extends Group{
	
	private FlowPane painelBusca;
	private TextField txtBusca;
	private Button btnBusca;

	private FlowPane painelResultado;
	private Label lblResultadoPalavra;
	private Label lblResultadoDefinicao;
	
	private VBox vbox;
	
	private TelaBuscaController tbc;
	
	public TelaBusca() {
		
		tbc =  new TelaBuscaController();
		
		painelBusca = new FlowPane();
		painelBusca.setMinWidth(400);
		painelBusca.setHgap(10);
		painelBusca.setPadding(new Insets(20));
		
		txtBusca = new TextField();
		txtBusca.setPromptText("Digite aqui para pesquisar...");
		txtBusca.setMinWidth(260);
		btnBusca = new Button("Buscar");
		
		painelResultado = new FlowPane();
		painelResultado.setMinSize(400, 400);
		painelResultado.setHgap(10);
		painelResultado.setPadding(new Insets(0, 20, 20, 20));
		
		lblResultadoPalavra = new Label();
		lblResultadoDefinicao = new Label();
		
		lblResultadoDefinicao.setWrapText(true);
		lblResultadoDefinicao.setPrefWidth(painelResultado.getMinWidth());

		painelBusca.getChildren().addAll(txtBusca, btnBusca);
		painelResultado.getChildren().addAll(lblResultadoPalavra, lblResultadoDefinicao);
		
		vbox = new VBox(painelBusca, painelResultado);
		
		this.getChildren().add(vbox);
		
		btnBusca.setOnAction((e) -> {
			
			if (!txtBusca.getText().isEmpty()) {
				Palavra pBusca = tbc.submeteBusca(txtBusca.getText());
				if (pBusca != null) {
					
					lblResultadoPalavra.setText(pBusca.getPalavra());
					lblResultadoDefinicao.setText(pBusca.getDefinicao());
				}else {
					new TelaCadastro(txtBusca.getText());
				}
			}
			e.consume();
		});
	}
}
