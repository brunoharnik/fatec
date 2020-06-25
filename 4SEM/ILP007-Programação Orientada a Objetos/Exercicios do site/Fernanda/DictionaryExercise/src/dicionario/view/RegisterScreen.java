package dicionario.view;

import dicionario.controller.RegisterScreenController;
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

public class RegisterScreen extends Stage {

	private Label textName;
	private TextField textDefinition;
	private Button buttonRegister, buttonCancel;
	private VBox vbox;
	private FlowPane buttonPanel;
	private Scene scene;
	RegisterScreenController rsc;
	
	public RegisterScreen(String word) {
		
		this.textName = new Label(word);
		this.textDefinition = new TextField();
		this.textDefinition.setPromptText("definition");
		
		buttonRegister = new Button("Register");
		buttonCancel = new Button("Cancel");
		buttonPanel = new FlowPane(buttonCancel, buttonRegister);
		buttonPanel.setHgap(10);
		
		
		rsc = new RegisterScreenController();
		
		
		buttonCancel.setOnAction((e) -> {
			this.close();
			e.consume();
		});
		
		buttonRegister.setOnAction((e) -> {
			
			if (rsc.registerWord(word, textDefinition.getText()) ) {
				Alert alertSuccess = new Alert(AlertType.INFORMATION);
				alertSuccess.setContentText("Success! Your word is now on dictionary.");
				alertSuccess.showAndWait();
				this.close();
				e.consume();
			} else {
			
			Alert alertError = new Alert(AlertType.ERROR);
			alertError.setContentText("bad gateway");
			alertError.showAndWait();
			e.consume();
			}
		});
		
		
		
		vbox = new VBox(textName, textDefinition, buttonPanel);
		vbox.setPadding(new Insets(20));
		
		scene = new Scene(vbox);
		this.setScene(scene);
		this.show();
	}
}
