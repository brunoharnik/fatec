import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class Bolinha extends Application {
	
	class Ponto{
		double x = 0;
		double y = 0;
		double velX = 2;
		double velY = 2;
		double w = 40;
		double h = 40;
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		Group grupo = new Group();
		Scene cena = new Scene(grupo);
		primaryStage.setScene(cena);
		
		Canvas canvas = new Canvas(640, 480);
		GraphicsContext gc = canvas.getGraphicsContext2D();
		grupo.getChildren().add(canvas);
		
		Ponto p = new Ponto();
		
		new AnimationTimer() {
			
			@Override
			public void handle(long now) {
				
				desenhaBolinha(p, gc, canvas);
				
				p.x += p.velX;
				p.y += p.velY;
				
				if (p.x >= (canvas.getWidth() - p.w) || p.x <= 0) {
					p.velX *= -1;
				}
				if (p.y >= (canvas.getHeight() - p.h) || p.y <= 0) {
					p.velY *= -1;
				}
			}
		}.start();
		
		primaryStage.setTitle("Animação com bolinha");
		primaryStage.show();
		
		
	}
	
	public static void main(String[] args) {
		Application.launch(Bolinha.class, args);
	}
	
	private void desenhaBolinha(Ponto p, GraphicsContext gc, Canvas canvas) {
		gc.clearRect(0, 0, canvas.getWidth(), canvas.getHeight());
		gc.setStroke(Color.CRIMSON);
		gc.setLineWidth(2);
		gc.strokeOval(p.x, p.y, p.w, p.h);
		gc.strokeText("DVD", p.x + (p.w / 6), p.y + (p.h / 1.60));
	}

}
