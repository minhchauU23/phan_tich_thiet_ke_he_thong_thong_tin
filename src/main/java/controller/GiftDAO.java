package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Coupon;
import model.Gift;
import model.GiftInKind;

public class GiftDAO extends DAO {
	public GiftDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Gift> getGift(){
		List<Gift> gifts = new ArrayList<>();
		String query = "SELECT a.id, a.name, a.type, a.neededPoint, a.gcondition, b.percent, c.worth FROM tblGift a\r\n"
				+ "	LEFT JOIN tblCoupon b ON a.id = b.id\r\n"
				+ "    LEFT JOIN tblGiftInKind c ON a.id = c.id;";
		
		try {
			PreparedStatement prepare = connection.prepareStatement(query);
			ResultSet resultSet = prepare.executeQuery();
			while(resultSet.next()) {
				int id = resultSet.getInt(1);
				String name = resultSet.getString(2);
				String type = resultSet.getString(3);
				float neededPoint = resultSet.getFloat(4);
				String condition = resultSet.getString(5);
				if(type.equals("Coupon")) {
					float percent = resultSet.getFloat(6);
					Coupon coupon = new Coupon();
					coupon.setId(id);
					coupon.setName(name);
					coupon.setType(type);
					coupon.setNeededPoint(neededPoint);
					coupon.setCondition(condition);
					coupon.setPercent(percent);
					gifts.add(coupon);
				}
				else if(type.equals("GiftInKind")) {
					float worth = resultSet.getFloat(7);
					GiftInKind giftInKind = new GiftInKind();
					giftInKind.setId(id);
					giftInKind.setName(name);
					giftInKind.setType(type);
					giftInKind.setNeededPoint(neededPoint);
					giftInKind.setCondition(condition);
					giftInKind.setWorth(worth);
					gifts.add(giftInKind);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return gifts;
	}
	
}
