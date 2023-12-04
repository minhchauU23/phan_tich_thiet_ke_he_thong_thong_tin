package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import model.Client;
import model.Member;

public class MemberDAO extends DAO{
	public MemberDAO() {
		super();
	}
	public boolean register(Member member) {
		boolean isSuccess = false;
		
			try {
				String queryInsertMember = "INSERT INTO tblMember(username, password, fullName, dob, gender, email) VALUES (?, ?, ?, ?, ?, ?);";
				PreparedStatement prepare = connection.prepareStatement(queryInsertMember);
				prepare.setString(1, member.getUsername());
				prepare.setString(2, member.getPassword());
				prepare.setString(3, member.getFullName());
				prepare.setString(4, (new SimpleDateFormat("yyyy-MM-dd").format(member.getDob())).toString());
				prepare.setString(5, member.getGender());
				prepare.setString(6, member.getEmail());
				prepare.execute();
				if(member instanceof Client) {
					String queryGetIDmember = "SELECT id FROM tblMember WHERE username = ? AND password = ?;";
					prepare = connection.prepareStatement(queryGetIDmember);
					prepare.setString(1, member.getUsername());
					prepare.setString(2, member.getPassword());
					ResultSet resultSet = prepare.executeQuery();
					resultSet.next();
					String queryInsertClient = "INSERT INTO tblClient(id, phone, address) VALUES(?, ?, ?);";
					prepare = connection.prepareStatement(queryInsertClient);
					prepare.setInt(1, resultSet.getInt(1));
					prepare.setString(2, ((Client)member).getPhone());
					prepare.setString(3, ((Client)member).getAddress());
					prepare.execute();
				}
				isSuccess = true;
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return isSuccess;
	}
	
	public boolean login(Member member) {
		boolean isSuccess = false;
		String query = "SELECT * FROM pttkhttt.tblMember WHERE username = ? AND password = ?;";
		try {
			PreparedStatement prepare = connection.prepareStatement(query);
			prepare.setString(1, member.getUsername());
			prepare.setString(2, member.getPassword());
			System.out.println(member.getUsername() + " " + member.getPassword());
			ResultSet resultSet = prepare.executeQuery();
			if(resultSet.next()) {
				
				member.setId(resultSet.getInt(1));
				member.setFullName(resultSet.getString(4));
				member.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(resultSet.getString(5)));
				member.setGender(resultSet.getString(6));
				member.setEmail(resultSet.getString(7));
				member.setRole(resultSet.getString(8));
				isSuccess = true;
				System.out.println("true");
			}
			System.out.println("true");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}
	
}
