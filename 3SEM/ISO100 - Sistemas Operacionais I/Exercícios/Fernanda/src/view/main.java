package view;
import java.util.Scanner;
import javax.swing.JOptionPane;
import controller.ThreadCalc;
import controller.ThreadSec;

public class main {
	public static void main(String[] args) {
		int a = 10;
		int b = 2;
		//int op = 2;
		int n;
	
		
		for (int seq = 0; seq<10; seq++) {
			do {
				n = ((int)((Math.random()*100)+1));
			} while (n % 2 == 0);
			ThreadSec t = new ThreadSec(n);
			t.start();
		}
		//for (int op = 0; op < 4; op++) { //la�o que inicia a thread 4x com mudan�as de par�metros
		//ThreadCalc thread = new ThreadCalc(a, b, op);
		// ou (polimorfismo --> ThreadCalc ou Thread)
		//Thread t = new ThreadCalc(a, b, op); // instancia, n�o inicia
		//t.start(); // inicia a thread.
		//} roda o que ele quiser, � aut�nomo
	}
}