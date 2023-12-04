package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import model.Client;
import model.RedemptionBill;
import model.RedemptionGift;

public class RedemptionBillDAO extends DAO{
	public RedemptionBillDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean saveRedemptionBill(RedemptionBill redemptionBill) {
		boolean isSuccess = false;
		try {
			connection.setAutoCommit(false);
			String queryInsertBill = "INSERT INTO tblRedemptionBill (totalOfPoint, redemptionDate, tblClientid) VALUES(?, ?, ?);";
			PreparedStatement prepare = connection.prepareStatement(queryInsertBill, Statement.RETURN_GENERATED_KEYS);
			prepare.setFloat(1, redemptionBill.getTotalOfPoint());
			prepare.setString(2, (new SimpleDateFormat("yyyy-MM-dd")).format(redemptionBill.getRedemptionDate()));
			prepare.setInt(3, redemptionBill.getClient().getId());
			prepare.execute();
			
			//getID cua redemptionbill
			ResultSet resultSet = prepare.getGeneratedKeys();
			if(resultSet.next()) {
				redemptionBill.setId(resultSet.getInt(1));
				System.out.println(redemptionBill.getId());
				String queryInsertRedemptionGift = "INSERT INTO tblRedemptionGift (redemptionDate, expirationDate, unitPoint, quantity, tblRedemptionBillid, tblGiftid) "
						+ "	VALUES(?, ?, ?, ?, ?, ?);";
				for(RedemptionGift redemptionGift: redemptionBill.getListRedemptionGift()) {
					prepare = connection.prepareStatement(queryInsertRedemptionGift);
					prepare.setString(1, (new SimpleDateFormat("yyyy-MM-dd")).format(redemptionGift.getRedemptionDate()));
					prepare.setString(2, (new SimpleDateFormat("yyyy-MM-dd")).format(redemptionGift.getExpirationDate()));
					prepare.setFloat(3, redemptionGift.getUnitPoint());
					prepare.setInt(4, redemptionGift.getQuantity());
					prepare.setInt(5, redemptionBill.getId());
					prepare.setInt(6, redemptionGift.getGift().getId());
					prepare.execute();
				}
				String queryUpdateClient = "UPDATE tblClient SET point = ? WHERE id = ?;";
				prepare = connection.prepareStatement(queryUpdateClient);
				prepare.setFloat(1, redemptionBill.getClient().getPoint() - redemptionBill.getTotalOfPoint());
				prepare.setInt(2, redemptionBill.getClient().getId());
				prepare.execute();
				redemptionBill.getClient().setPoint(redemptionBill.getClient().getPoint() - redemptionBill.getTotalOfPoint());
				isSuccess = true;
			}
			else {
				connection.rollback();
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
				isSuccess = false;
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
}
