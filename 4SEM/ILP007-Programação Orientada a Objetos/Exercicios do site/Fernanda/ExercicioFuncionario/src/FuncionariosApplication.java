import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;
import view.TelaCadastraFuncionario;
import view.TelaMenuFuncionario;

public class FuncionariosApplication extends Application {
	
	TelaMenuFuncionario telaMenu;
	
	TelaCadastraFuncionario telaCadastro;
	
	@Override
	public void start(Stage stage) throws Exception {
		//telaMenu = new TelaMenuFuncionario();
		//Scene scene = new Scene(telaMenu, 400, 400);
		
		telaCadastro = new TelaCadastraFuncionario();
		Scene scene = new Scene(telaCadastro,500,500);
		
		
		
		stage.setScene(scene);
		stage.setTitle("Cadastro de Funcionários");
		stage.show();
	}
	
	public static void main(String[] args) {
		Application.launch(FuncionariosApplication.class, args);

	}
}
