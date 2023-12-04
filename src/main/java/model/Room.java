package model;

import java.util.List;

public class Room {
	private int id;
	private String name;
	private int amountSeat;
	private String type;
	private String description;
	private List<Seat> seats;
	
	public Room() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmountSeat() {
		return amountSeat;
	}

	public void setAmountSeat(int amountSeat) {
		this.amountSeat = amountSeat;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Seat> getSeats() {
		return seats;
	}

	public void setSeats(List<Seat> seats) {
		this.seats = seats;
	}
	
}
