package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import model.Bill;
import model.Ticket;

public class BillDAO extends DAO {
	
	public BillDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean saveBill(Bill bill) {
		boolean isSuccess = false;
		try {
			connection.setAutoCommit(false);
			String queryInsertBill = "INSERT INTO tblBill(dateTimePayment, totalBonusPoint, total, tblClientid) VALUES(?, ?, ?, ?);";
			PreparedStatement preparedStatement = connection.prepareStatement(queryInsertBill, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, (new SimpleDateFormat("yyyy-MM-dd")).format(bill.getDateTimePayment()));
			preparedStatement.setFloat(2, bill.getTotalBonusPoint());
			preparedStatement.setFloat(3, bill.getTotal());
			preparedStatement.setInt(4, bill.getClient().getId());
			preparedStatement.execute();
			
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if(resultSet.next()) {
				bill.setId(resultSet.getInt(1));
				String queryInsertTicket = "INSERT INTO tblTicket (price, bonusPoint, tblSeatid, tblBillid, tblShowTimeid) VALUES(?, ?, ?, ?, ?);";
				for(Ticket ticket: bill.getListTicket()) {
					preparedStatement = connection.prepareStatement(queryInsertTicket);
					preparedStatement.setFloat(1, ticket.getPrice());
					preparedStatement.setFloat(2, ticket.getBonusPoint());
					preparedStatement.setInt(3, ticket.getSeat().getId());
					preparedStatement.setInt(4, bill.getId());
					preparedStatement.setInt(5, ticket.getShowTime().getId());
					preparedStatement.execute();
				}
				String queryUpdateClient = "UPDATE tblClient SET point = ? WHERE id = ?;";
				preparedStatement = connection.prepareStatement(queryUpdateClient);
				preparedStatement.setFloat(1, bill.getClient().getPoint() + bill.getTotalBonusPoint());
				preparedStatement.setInt(2, bill.getClient().getId());
				bill.getClient().setPoint(bill.getClient().getPoint() + bill.getTotalBonusPoint());
				preparedStatement.execute();
				isSuccess = true;
			}
			
		} catch (SQLException e) {
			try{
                connection.rollback();
            }catch(Exception ee){
                isSuccess = false;
                ee.printStackTrace();               
            }
			e.printStackTrace();
		}finally {
			try {
				connection.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				isSuccess = false;
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}

}
