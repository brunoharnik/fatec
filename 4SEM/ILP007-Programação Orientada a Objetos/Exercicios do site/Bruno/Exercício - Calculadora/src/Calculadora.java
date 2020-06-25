import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.RowConstraints;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class Calculadora extends Application {

	class Interceptador implements EventHandler<ActionEvent>{
		
		public TextField txtResultado;

		
		public Interceptador(TextField txtResultado) {
			this.txtResultado = txtResultado;
		}
		

		@Override
		public void handle(ActionEvent e) {
			
			Button botaoClicado = (Button) e.getTarget();
			txtResultado.appendText(botaoClicado.getText());
			
		}
	}
	
	public static void main(String[] args) {
		Application.launch(Calculadora.class, args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		
		VBox vbox = new VBox();
		vbox.setPadding(new Insets(10));
		
		FlowPane flowPane = new FlowPane();
		TextField txtResultado = new TextField();
		Button btnCe = new Button("CE");
		
		flowPane.getChildren().addAll(txtResultado, btnCe);
		flowPane.setHgap(10);
		flowPane.setAlignment(Pos.CENTER);
		
		GridPane gridPane = new GridPane();
		ColumnConstraints ccGridPane = new ColumnConstraints();
		RowConstraints rcGridPane = new RowConstraints();
		ccGridPane.setPercentWidth(25);
		rcGridPane.setPercentHeight(25);
		gridPane.getColumnConstraints().add(ccGridPane);
		gridPane.getRowConstraints().add(rcGridPane);
		gridPane.setPadding(new Insets(10));
		
		Button [] btnNum = new Button[10];
		for (int i = 0; i < btnNum.length; i++) {
			btnNum[i] = new Button(Integer.toString(i));
			estilizaBotao(btnNum[i]);
		}
		
		Button btnAdicao = new Button("+");
		Button btnSubtracao = new Button("-");
		Button btnDivisao = new Button("/");
		Button btnMultiplicacao = new Button("*");
		Button btnVirgula = new Button(",");
		Button btnIgual = new Button("=");
		
		estilizaBotao(btnAdicao, btnSubtracao, btnDivisao, btnMultiplicacao, btnVirgula, btnIgual);
		
		gridPane.add(btnNum[1], 0, 0);
		gridPane.add(btnNum[2], 1, 0);
		gridPane.add(btnNum[3], 2, 0);
		gridPane.add(btnAdicao, 3, 0);
		gridPane.add(btnNum[4], 0, 1);
		gridPane.add(btnNum[5], 1, 1);
		gridPane.add(btnNum[6], 2, 1);
		gridPane.add(btnSubtracao, 3, 1);
		gridPane.add(btnNum[7], 0, 2);
		gridPane.add(btnNum[8], 1, 2);
		gridPane.add(btnNum[9], 2, 2);
		gridPane.add(btnMultiplicacao, 3, 2);
		gridPane.add(btnVirgula, 0, 3);
		gridPane.add(btnNum[0], 1, 3);
		gridPane.add(btnIgual, 2, 3);
		gridPane.add(btnDivisao, 3, 3);
		
		vbox.getChildren().addAll(flowPane, gridPane);
		
		
		Interceptador interceptador = new Interceptador(txtResultado);
		
		btnNum[0].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[1].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[2].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[3].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[4].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[5].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[6].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[7].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[8].addEventFilter(ActionEvent.ACTION, interceptador);
		btnNum[9].addEventFilter(ActionEvent.ACTION, interceptador);
		btnVirgula.addEventFilter(ActionEvent.ACTION, interceptador);
		
		Scene cena = new Scene(vbox, 360, 420);
		primaryStage.setTitle("Calculadora Moderna");
		primaryStage.setScene(cena);
		primaryStage.show();	
	}
	
	public void estilizaBotao(Button...buttons) {
		for (Button button : buttons) {
			button.setPrefWidth(80);
			button.setPrefHeight(120);
			button.setStyle("-fx-font-size: 30;"
					+ "		 -fx-font-color: rgb(255, 255, 255);"
					+ "		 -fx-color: rgb(0, 0, 0);");
		}
	}
}
