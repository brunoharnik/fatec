package model.dao.implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

import model.dao.AlunoDao;
import model.dao.DaoFactory;
import model.entities.Aluno;

public class AlunoDaoImpl implements AlunoDao {

	private DaoFactory daoFactory;

	public AlunoDaoImpl() {
		daoFactory = new DaoFactory();
	}

	@Override
	public Integer inserir(Aluno aluno) {
		Integer genKey = null;
		try {
			Connection conn = daoFactory.getConnection();
			String sql = "INSERT INTO aluno (ra, nome, nascimento) VALUES (?, ?, ?)";
			PreparedStatement stmn = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmn.setString(1, aluno.getRa());
			stmn.setString(2, aluno.getNome());
			stmn.setDate(3, java.sql.Date.valueOf(aluno.getNascimento()));
			stmn.executeUpdate();
			ResultSet rs = stmn.getGeneratedKeys();
			while(rs.next()) {
				genKey = rs.getInt("id");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return genKey;
	}

	@Override
	public Boolean atualizar(Aluno aluno) {
		try {
			Connection conn = daoFactory.getConnection();
			String sql = "UPDATE aluno SET nome = ?, nascimento = ? WHERE ra = ?";
			PreparedStatement stmn = conn.prepareStatement(sql);
			stmn.setString(1, aluno.getNome());
			stmn.setDate(2, java.sql.Date.valueOf(aluno.getNascimento()));
			stmn.setString(3, aluno.getRa());
			stmn.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Boolean removerRa(String ra) {
		try {
			Connection conn = daoFactory.getConnection();
			String sql = "DELETE aluno.* FROM aluno WHERE ra = " + ra;
			PreparedStatement stmn = conn.prepareStatement(sql);
			stmn.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Aluno pesquisarPorRa(String ra) {
		Aluno aluno = null;
		try {
			Connection conn = daoFactory.getConnection();
			String sql = "SELECT * FROM aluno WHERE ra =" + ra;
			PreparedStatement stmn = conn.prepareStatement(sql);
			ResultSet rs = stmn.executeQuery();
			while (rs.next()) {
				aluno = new Aluno(rs.getInt("id"), 
						rs.getString("ra"), 
						rs.getString("nome"), 
						rs.getDate("nascimento").toLocalDate());
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return aluno;
	}

	@Override
	public Set<Aluno> listarTodosOsAlunos() {
		Set<Aluno> alunos = null;
		try {
			Connection conn = daoFactory.getConnection();
			String sql = "SELECT * FROM aluno ORDER by nome";
			PreparedStatement stmn = conn.prepareStatement(sql);
			ResultSet rs = stmn.executeQuery();
			alunos = new HashSet<Aluno>();
			while (rs.next()) {
				alunos.add(new Aluno(rs.getInt("id"), 
						rs.getString("ra"), 
						rs.getString("nome"), 
						rs.getDate("nascimento").toLocalDate()));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alunos;
	}
}
