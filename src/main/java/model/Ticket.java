package model;

public class Ticket {
	private int id;
	private float price;
	private float bonusPoint;
	private ShowTime showTime;
	private Seat seat;
	private RedemptionGift gift;
	
	public Ticket() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getBonusPoint() {
		return bonusPoint;
	}

	public void setBonusPoint(float bonusPoint) {
		this.bonusPoint = bonusPoint;
	}

	public ShowTime getShowTime() {
		return showTime;
	}

	public void setShowTime(ShowTime showTime) {
		this.showTime = showTime;
	}

	public Seat getSeat() {
		return seat;
	}

	public void setSeat(Seat seat) {
		this.seat = seat;
	}

	public RedemptionGift getGift() {
		return gift;
	}

	public void setGift(RedemptionGift gift) {
		this.gift = gift;
	}
	
	
}
