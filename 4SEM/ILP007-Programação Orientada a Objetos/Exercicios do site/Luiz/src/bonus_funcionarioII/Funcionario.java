package bonus_funcionarioII;

public class Funcionario {
	
	private Long id;
	private String nome;
	private String matricula;
	private double salario;
	private int faltasNoAno;
	private float ultimaNotaAvaliacao;
	private int qtdPremiosRecebidosAno;
	private boolean graduacao;
	private String nomeFaculdade;
	private String nomeCurso;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(int id) {
		Long idLong = (long) id;
		this.id = idLong;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	public int getFaltasNoAno() {
		return faltasNoAno;
	}
	public void setFaltasNoAno(int faltasNoAno) {
		this.faltasNoAno = faltasNoAno;
	}
	public float getUltimaNotaAvaliacao() {
		return ultimaNotaAvaliacao;
	}
	public void setUltimaNotaAvaliacao(float ultimaNotaAvaliacao) {
		this.ultimaNotaAvaliacao = ultimaNotaAvaliacao;
	}
	public int getQtdPremiosRecebidosAno() {
		return qtdPremiosRecebidosAno;
	}
	public void setQtdPremiosRecebidosAno(int qtdPremiosRecebidosAno) {
		this.qtdPremiosRecebidosAno = qtdPremiosRecebidosAno;
	}
	public boolean isGraduacao() {
		return graduacao;
	}
	public void setGraduacao(boolean graduacao) {
		this.graduacao = graduacao;
	}
	public String getNomeFaculdade() {
		return nomeFaculdade;
	}
	public void setNomeFaculdade(String nomeFaculdade) {
		this.nomeFaculdade = nomeFaculdade;
	}
	public String getNomeCurso() {
		return nomeCurso;
	}
	public void setNomeCurso(String nomeCurso) {
		this.nomeCurso = nomeCurso;
	}
	
	
	
}
