package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	protected Connection connection;
	
	private String dbName = "pttkhttt";
	private String url = "jdbc:mysql://localhost:3306/" + dbName;
	private String user = "root";
	private String pass = "Tranminhchau2";
	protected DAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, pass);
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
