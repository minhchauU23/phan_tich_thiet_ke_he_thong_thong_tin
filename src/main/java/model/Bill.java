package model;

import java.util.Date;
import java.util.List;

public class Bill {
	private int id;
	private Date dateTimePayment;
	private float totalBonusPoint;
	private float discount;
	private float total;
	private Client client;
	private RedemptionGift gift;
	private List<Ticket> listTicket;
	
	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateTimePayment() {
		return dateTimePayment;
	}

	public void setDateTimePayment(Date dateTimePayment) {
		this.dateTimePayment = dateTimePayment;
	}

	public float getTotalBonusPoint() {
		return totalBonusPoint;
	}

	public void setTotalBonusPoint(float totalBonusPoint) {
		this.totalBonusPoint = totalBonusPoint;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public List<Ticket> getListTicket() {
		return listTicket;
	}

	public void setListTicket(List<Ticket> listTicket) {
		this.listTicket = listTicket;
	}

	public RedemptionGift getGift() {
		return gift;
	}

	public void setGift(RedemptionGift gift) {
		this.gift = gift;
	}

	
	
	
	
	
}
