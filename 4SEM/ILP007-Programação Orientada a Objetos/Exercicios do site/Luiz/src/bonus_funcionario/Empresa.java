package bonus_funcionario;

public class Empresa {

	public static void main(String[] args) {
		
		Funcionario func = new Funcionario();
		func.setFaltasNoAno(1);
		func.setNome("ANA");
		func.setSalario(1000.0);
		
		Funcionario func1 = new Funcionario();
		func1.setFaltasNoAno(2);
		func1.setNome("PEDRO");
		func1.setSalario(1000.0);
		
		Funcionario func2 = new Funcionario();
		func2.setFaltasNoAno(5);
		func2.setNome("JOAO");
		func2.setSalario(1000.0);
		
		RH rh = new RH();
		
		rh.adicionarFuncionario(func);
		rh.adicionarFuncionario(func1);
		rh.adicionarFuncionario(func2);
		System.out.println("----------------------------------------");
		
		rh.valorBonus(func);
		rh.valorBonus(func1);
		rh.valorBonus(func2);
		System.out.println("----------------------------------------");
		
		rh.mostrarBonusTodosFuncionarios();
		System.out.println("----------------------------------------");

	}

}
