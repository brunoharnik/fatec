import java.io.FileInputStream;
import java.io.InputStream;

import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.geometry.Point2D;
import javafx.geometry.Point3D;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.SnapshotParameters;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import javafx.scene.transform.Rotate;
import javafx.stage.Stage;

public class TranslacoesTerra extends Application {

	class Pontos {
		double rotacaoSol = 1;
		double anguloTerra = 0;
		double anguloLua = 0;
		double distanciaTerra = 200;

	}

	@Override
	public void start(Stage stage) throws Exception {
		Group grupo = new Group();
		Scene cena = new Scene(grupo);
		stage.setScene(cena);

		FileInputStream fis = new FileInputStream("images/espaco.jpg");
		Image imgEspaco = new Image(fis);

		fis = new FileInputStream("images/sol.png");
		Image imgSol = new Image(fis);
		ImageView ivSol = new ImageView(imgSol);

		fis = new FileInputStream("images/terra.png");
		Image imgTerra = new Image(fis);

		fis = new FileInputStream("images/lua.png");
		Image imgLua = new Image(fis);

		Canvas canvas = new Canvas(imgEspaco.getWidth(), imgEspaco.getHeight());
		grupo.getChildren().add(canvas);
		GraphicsContext gc = canvas.getGraphicsContext2D();

		Pontos pontos = new Pontos();

		Rotate rot = new Rotate();

		SnapshotParameters parameters = new SnapshotParameters();
		parameters.setFill(Color.TRANSPARENT);

		new AnimationTimer() {

			@Override
			public void handle(long now) {

				desenhaSolTerraLua(gc, pontos, rot, parameters, imgEspaco, ivSol, imgTerra, imgLua);

			}
		}.start();

		stage.setTitle("Sistema Solar");
		stage.show();
	}

	public static void main(String[] args) {
		Application.launch(TranslacoesTerra.class, args);
	}

	public void desenhaSolTerraLua(GraphicsContext gc, Pontos p, Rotate rot, SnapshotParameters params, Image espaco,
			ImageView sol, Image terra, Image lua) {
		gc.drawImage(espaco, 0, 0);
		rot.setAxis(new Point3D(sol.snapshot(params, null).getWidth() / 2, sol.snapshot(params, null).getHeight() / 2, 0));
		rot.setAngle(p.rotacaoSol);
		sol.getTransforms().add(rot);

		gc.drawImage(sol.snapshot(params, null), pontoCentral(espaco).getX() - sol.getImage().getWidth() / 2,
				pontoCentral(espaco).getY() - sol.getImage().getHeight() / 2);
	}

	public Point2D pontoCentral(Image imgFundo) {
		return new Point2D(imgFundo.getWidth() / 2, imgFundo.getHeight() / 2);
	}
}
