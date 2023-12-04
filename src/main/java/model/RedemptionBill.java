package model;

import java.util.Date;
import java.util.List;

public class RedemptionBill {
	private int id;
	private float totalOfPoint;
	private Date redemptionDate;
	private Client client;
	private List<RedemptionGift> listRedemptionGift;
	public RedemptionBill() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getTotalOfPoint() {
		return totalOfPoint;
	}
	public void setTotalOfPoint(float totalOfPoint) {
		this.totalOfPoint = totalOfPoint;
	}
	public Date getRedemptionDate() {
		return redemptionDate;
	}
	public void setRedemptionDate(Date redemptionDate) {
		this.redemptionDate = redemptionDate;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public List<RedemptionGift> getListRedemptionGift() {
		return listRedemptionGift;
	}
	public void setListRedemptionGift(List<RedemptionGift> listRedemptionGift) {
		this.listRedemptionGift = listRedemptionGift;
	}
	
	
	
}
