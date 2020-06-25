package bonus_funcionarioII;

import javax.swing.JOptionPane;

public class Empresa {
	
	private RH rh;
	private int id;
	
	public Empresa() {
		this.rh = new RH();
	}
	
	public Funcionario contratarFuncionario(){
		Funcionario func = new Funcionario();
		func.setNome(JOptionPane.showInputDialog("Informe o nome: "));
		func.setMatricula(JOptionPane.showInputDialog("Informe a matricula: "));
		func.setSalario(Double.parseDouble(JOptionPane.showInputDialog("Informe o salario do funcionario: ")));
		func.setFaltasNoAno(Integer.parseInt(JOptionPane.showInputDialog("Informe ao numero de faltas no ano: ")));
		func.setUltimaNotaAvaliacao(Integer.parseInt(JOptionPane.showInputDialog("Nota da ultima avaliação")));
		func.setId(gerarid());
		
		return func;
	}
	
	
    public int gerarid() {
    	this.id ++;
        return this.id;
    }  
	
	
	public static void main(String[] args) {
		
		Empresa empresa = new Empresa();
		
		for(int i = 1; i <= 5; i++){
			empresa.rh.adicionarFuncionario(empresa.contratarFuncionario());
			empresa.rh.mostrarBonusTodosFuncionarios();
		}
	}

}
