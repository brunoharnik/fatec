/*
 *************************
Lote 01 - Exercício 16 - Receba a quantidade de horas trabalhadas, o valor por 
        hora, o percentual de desconto e o número de descendentes. Calcule o 
        salário que serão as horas trabalhadas x o valor por hora. Calcule o 
        salário líquido (= Salário Bruto – desconto). A cada dependente será 
        acrescido R$ 100 no Salário Líquido. Exiba o salário a receber.

Programador: Fernanda Pinheiro Reis
Professor: Ricardo Satoshi
 *************************
*/
 
import javax.swing.JOptionPane;
import java.text.DecimalFormat;

public class Lt01_Mod16 {
	static int descend;
	static double valor_hora, percent, horas_trab;
	private static DecimalFormat casas2 = new DecimalFormat (".##");
        public static void main (String args[]) {
    
		horas_trab = Double.parseDouble(JOptionPane.showInputDialog("Digite a quantidade de horas trabalhadas: "));
		valor_hora = Double.parseDouble(JOptionPane.showInputDialog("Digite o valor por hora trabalhada: "));
		percent = (Double.parseDouble(JOptionPane.showInputDialog("Digite a porcentagem de desconto: % "))/100);
		descend = Integer.parseInt(JOptionPane.showInputDialog("Digite o número de descendentes: "));
    
		CalculaSalario ();
            JOptionPane.showMessageDialog(null,"O salário líquido será de R$ " +casas2.format(horas_trab) +".");    
    
    }     
        
/* 
 	Módulo para calcular salário
*/
	static void CalculaSalario ( ) {
            
            horas_trab = (horas_trab * valor_hora);
            horas_trab = horas_trab - ((double)percent * horas_trab);
            horas_trab = horas_trab + (descend * 100);
        }
}