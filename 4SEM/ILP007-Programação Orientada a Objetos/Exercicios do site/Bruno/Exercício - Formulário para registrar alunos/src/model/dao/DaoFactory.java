package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoFactory {
	private static final String URL = "jdbc:mariadb://localhost/aluno?alowMultiQueries=true",
			USER = "root",
			PASS = "blackout";

	public DaoFactory() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		try {
			return DriverManager.getConnection(URL, USER, PASS);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}