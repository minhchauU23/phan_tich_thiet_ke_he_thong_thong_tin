package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Client;

public class ClientDAO extends DAO {
	public boolean getClient(Client client) {
		boolean isSuccess = false;
		String query = "SELECT tblclient.phone, tblclient.address, tblclient.point FROM tblclient WHERE id = ?;";
		try {
			PreparedStatement prepare = connection.prepareStatement(query);
			prepare.setInt(1, client.getId());
			ResultSet resultSet = prepare.executeQuery();
			if(resultSet.next()) {
				client.setPhone(resultSet.getString(1));
				client.setAddress(resultSet.getString(2));
				client.setPoint(resultSet.getFloat(3));
				isSuccess = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
		
	}
}
