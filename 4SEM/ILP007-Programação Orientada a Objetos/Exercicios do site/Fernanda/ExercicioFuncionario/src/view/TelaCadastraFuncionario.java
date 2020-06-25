package view;

import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

public class TelaCadastraFuncionario extends GridPane {
	
	private TextField textDefinition;
	private Button botaoCadastrar, botaoCancelar;
	private VBox vbox;
	private FlowPane buttonPanel;
	private Scene scene;
	
	
	public TelaCadastraFuncionario() {
		
		VBox labels = new VBox();
		VBox fields = new VBox();
		
		
		
		HBox fpName 			= new HBox();
		Label labelNome 		= new Label("Nome:");
		TextField textNome		= new TextField();
		fpName.setSpacing(40);
		fpName.getChildren().addAll(labelNome, textNome);
		
		HBox fpMatricula 	= new HBox();
		Label labelMatricula 	= new Label("Matrícula:");
		TextField textMatricula	= new TextField();
		fpMatricula.setSpacing(20);
		fpMatricula.getChildren().addAll(labelMatricula, textMatricula);
		
		HBox fpLabelDatas		 	= new HBox(); 
		Label labelAdmissaoFuncionario 	= new Label("Data de admissão:");
		Label labelDemissaoFuncionario 	= new Label("Data de demissão:");
		fpLabelDatas.setSpacing(50);
		fpLabelDatas.getChildren().addAll(labelAdmissaoFuncionario, labelDemissaoFuncionario);
		
		HBox fpDatePickers 	= new HBox();
		DatePicker dataAdmissao	= new DatePicker();
		DatePicker dataDemissao	= new DatePicker();
		fpDatePickers.setSpacing(30);
		fpDatePickers.getChildren().addAll(dataAdmissao, dataDemissao);
		
		HBox fpSalario 		= new HBox();
		Label labelSalario 		= new Label("Salário:");
		TextField textSalario	= new TextField();
		fpSalario.getChildren().addAll(labelSalario, textSalario);
		
		HBox fpHorario		= new HBox();	
		Label labelHorario	 	= new Label("Horário h/dia:");
		TextField textHorario	= new TextField();
		fpHorario.getChildren().addAll(labelHorario, textHorario);
		
		labels.getChildren().addAll(labelNome, labelMatricula, labelAdmissaoFuncionario, dataAdmissao, labelSalario);
		labels.
		labels.setPadding(new Insets(20));
		fields.getChildren().addAll(textNome, textMatricula, labelDemissaoFuncionario, dataDemissao, textSalario, textHorario);
		fields.setPadding(new Insets(20));
		
		//vbox = new VBox();
		//vbox.getChildren().addAll(fpName, fpMatricula, fpLabelDatas, fpDatePickers, fpSalario, fpHorario);
		//vbox.setPadding(new Insets(20));
		this.add(labels, 0, 0);
		this.add(fields, 3, 0);
		
		
		
		
		//this.getChildren().add(vbox);
		
		//		hbox, outrohbox, 
			//	labelSalarioFuncionario, textSalario,
				//textHorario, labelHorario);
		//
		
		//DatePickerSkin datePickerSkin = new DatePickerSkin(new DatePicker(LocalDate.now()));
	
		
	}
}
