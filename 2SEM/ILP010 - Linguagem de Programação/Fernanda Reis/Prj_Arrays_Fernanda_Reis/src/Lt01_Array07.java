/*
 *************************
Lote 1 - Array - Exercício 7: A partir do exercício 6 (vetor classificado) 
solicitar um valor qualquer e verificar a sua existência no vetor (utilizar 
pesquisa binária).

Programador: Fernanda Pinheiro Reis
Professor: Ricardo Satoshi
 *************************

 */

import java.text.DecimalFormat;
import javax.swing.JOptionPane;

public class Lt01_Array07 {
    private static DecimalFormat casas2 = new DecimalFormat ("#.##");
    @SuppressWarnings("empty-statement")
    public static void main (String args []) {
        double vt[] = new double[20];
        int i = 0, mid = 0;
        double temp = 0.0;
        String vetor = "Números em ordem aleatória: \n";
        
        
        //populaVetor
        for (i = 0; i < 20; i++) {
            vt[i] = (double) (0 + (Math.random() *100));
            vetor += casas2.format(vt[i]) + "   ";
        }
        
        //bubbleSort
        for (i = 0; i < 20; i++) {
            for(int j = 1; j < (20-i); j++) {
                if(vt[j-1] > vt[j]) {
                    temp = vt[j-1];
                    vt[j-1] = vt[j];
                    vt[j] = temp;
                }
            }
        }
        double numero = Double.parseDouble(JOptionPane.showInputDialog(vetor +"\nDigite um valor para procura: "));
        //pesquisaBinaria
        int j = 0;
        boolean x = false;
        
        for (i = 20; i > 0; i--) {
            mid = i / 2;
            j = mid-1;
            if (vt[j] == numero) {
                x = true;
            } else if (vt[j] > numero) {
                j -= 1;
            } else {
                j += 1;
            }
            if (x == true) {
                i = 0;
            }
        }
        
        
        nao ta funcionando aidna
                
        
        if (x == true) {
           JOptionPane.showMessageDialog(null, "O número foi encontrado na posição " +j +" do vetor."); 
        } else {
           JOptionPane.showMessageDialog(null, "O número não foi encontrado no vetor."); 
        }
    }
}