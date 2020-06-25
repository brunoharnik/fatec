package model;

public class Funcionario {
	
	private Long id;
	private String nome;
	private String matricula;
	private Double salario;
	private Integer faltasNoAno;
	private Float ultimaNotaAvaliacao;
	private Integer qtdPremiosRecebidosAno;
	private Boolean graduado;
	private String nomeFaculdade;
	private String nomeCurso;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Double getSalario() {
		return salario;
	}
	public void setSalario(Double salario) {
		this.salario = salario;
	}
	public Integer getFaltasNoAno() {
		return faltasNoAno;
	}
	public void setFaltasNoAno(Integer faltasNoAno) {
		this.faltasNoAno = faltasNoAno;
	}
	public Float getUltimaNotaAvaliacao() {
		return ultimaNotaAvaliacao;
	}
	public void setUltimaNotaAvaliacao(Float ultimaNotaAvaliacao) {
		this.ultimaNotaAvaliacao = ultimaNotaAvaliacao;
	}
	public Integer getQtdPremiosRecebidosAno() {
		return qtdPremiosRecebidosAno;
	}
	public void setQtdPremiosRecebidosAno(Integer qtdPremiosRecebidosAno) {
		this.qtdPremiosRecebidosAno = qtdPremiosRecebidosAno;
	}
	public Boolean isGraduado() {
		return graduado;
	}
	public void setGraduado(Boolean graduado) {
		this.graduado = graduado;
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
