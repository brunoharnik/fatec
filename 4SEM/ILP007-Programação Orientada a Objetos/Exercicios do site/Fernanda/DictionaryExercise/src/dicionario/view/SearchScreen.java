package dicionario.view;

import dicionario.controller.FileManager;
import dicionario.controller.SearchScreenController;
import dicionario.model.Word;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;

public class SearchScreen extends Group {

	public FlowPane searchPanel;
	public TextField textfieldSearch;
	public Button buttonSearch;

	public FlowPane resultPanel;
	public Label labelWordResult;
	public Label labelDefinitionResult;

	public SearchScreenController ssc;

	private VBox vbox;

	public FileManager m;

	public SearchScreen() {

		ssc = new SearchScreenController();

		searchPanel = new FlowPane();
		searchPanel.setMinWidth(400);
		searchPanel.setHgap(10);
		searchPanel.setPadding(new Insets(10));

		textfieldSearch = new TextField();
		textfieldSearch.setPromptText("tell me a word...");

		buttonSearch = new Button("Search");

		resultPanel = new FlowPane();
		resultPanel.setMinSize(400, 400);
		resultPanel.setHgap(10);
		resultPanel.setPadding(new Insets(0, 20, 20, 20));

		labelWordResult = new Label();
		labelDefinitionResult = new Label();
		labelDefinitionResult.setWrapText(true);
		labelDefinitionResult.setPrefWidth(resultPanel.getMinWidth());

		resultPanel.getChildren().addAll(labelWordResult, labelDefinitionResult);
		searchPanel.getChildren().addAll(textfieldSearch, buttonSearch);

		vbox = new VBox(searchPanel, resultPanel);
		this.getChildren().add(vbox);

		buttonSearch.setOnAction((e) -> {

			if (!textfieldSearch.getText().isEmpty()) {

				Word wSearch = ssc.searchSubmit(textfieldSearch.getText());
				if (wSearch != null) {
					labelWordResult.setText(wSearch.getName());
					labelDefinitionResult.setText(wSearch.getDefinition());
				} else {
					new RegisterScreen(textfieldSearch.getText());
				}
				e.consume();
			} else {
				Alert alert = new Alert(AlertType.ERROR);
				alert.setContentText("No word to register");
				alert.show();
			}
		});
	}
}
