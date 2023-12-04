package model;

import java.util.Date;

public class RedemptionGift {
	private int id;
	private Date redemptionDate;
	private Date expirationDate;
	private float unitPoint;
	private int quantity;
	private float totalPoint;
	private Gift gift;
	
	public RedemptionGift() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getRedemptionDate() {
		return redemptionDate;
	}
	public void setRedemptionDate(Date redemptionDate) {
		this.redemptionDate = redemptionDate;
	}
	public Date getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	public float getUnitPoint() {
		return unitPoint;
	}
	public void setUnitPoint(float unitPoint) {
		this.unitPoint = unitPoint;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(float totalPoint) {
		this.totalPoint = totalPoint;
	}
	public Gift getGift() {
		return gift;
	}
	public void setGift(Gift gift) {
		this.gift = gift;
	}
	
	
	
}
