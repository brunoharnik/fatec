import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class Desenhos extends Application {

	public static void main(String[] args) {
		Application.launch(Desenhos.class, args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		GridPane gpDesenhos = new GridPane();
		
		Canvas canvas1 = new Canvas(300, 300);
		GraphicsContext gc1 = canvas1.getGraphicsContext2D();
		desenhaCasinha(gc1);
		
		Canvas canvas2 = new Canvas(300, 300);
		GraphicsContext gc2 = canvas2.getGraphicsContext2D();
		desenhaAlvo(gc2, 300);
		
		Canvas canvas3 = new Canvas(300, 300);
		GraphicsContext gc3 = canvas3.getGraphicsContext2D();
		desenhaGlobo(gc3, 300);
		
		gpDesenhos.add(canvas1, 0, 0);
		gpDesenhos.add(canvas2, 1, 0);
		gpDesenhos.add(canvas3, 0, 1);
		
		Scene cena = new Scene(gpDesenhos, 600, 600, Color.LIGHTGOLDENRODYELLOW);
		primaryStage.setTitle("Desenhos");
		primaryStage.setResizable(false);
		primaryStage.setScene(cena);
		primaryStage.show();	
	}
	
	private void desenhaCasinha(GraphicsContext gc) {
		gc.setStroke(Color.CRIMSON);
		gc.setLineWidth(3);
		gc.strokeRect(100, 100, 100, 100);
		gc.strokeLine(100, 100, 150, 50);
		gc.strokeLine(150, 50, 200, 100);
	}
	
	private void desenhaAlvo(GraphicsContext gc, int tamanho) {

		if (tamanho <= 1) {
			return;
		}
		
		gc.setStroke(Color.DARKBLUE);
		gc.setLineWidth(1);
		gc.strokeOval((gc.getCanvas().getWidth() - tamanho) / 2, (gc.getCanvas().getHeight() - tamanho) / 2, tamanho, tamanho);
		desenhaAlvo(gc, tamanho - 5);	
	}
	
	private void desenhaGlobo(GraphicsContext gc, int tamanho) {

		if (tamanho <= 1) {
			return;
		}
		
		gc.setStroke(Color.OLIVE);
		gc.setLineWidth(1);
		gc.strokeOval(0, (gc.getCanvas().getHeight() - tamanho * 0.8) / 2, 300, tamanho * 0.8);
		gc.strokeOval((gc.getCanvas().getWidth() - tamanho) / 2, (gc.getCanvas().getHeight() - 300 * 0.8) / 2, tamanho, 300 * 0.8);
		desenhaGlobo(gc, tamanho - 15);
	}

}
