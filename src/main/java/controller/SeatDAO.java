package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Seat;
import model.ShowTime;

public class SeatDAO extends DAO {
	
	public SeatDAO() {
		// TODO Auto-generated constructor stub
	}
	
//	public void insert() {
//		String query = "INSERT INTO tblSeat (name, srow, position, type, tblRoomid) VALUES(?, ?, ?, ?, ?);";
//		for(int room = 1; room<=6; room++) {
//			for(char row = 'A'; row <= 'G'; row++) {
//				for(int position = 1; position <= 12; position++) {
//					try {
//						PreparedStatement preparedStatement = connection.prepareStatement(query);
//						preparedStatement.setString(1, (char)(row) +""+position );
//						preparedStatement.setString(2, (char)(row)+"");
//						preparedStatement.setInt(3, position);
//						if(row =='F') {
//							preparedStatement.setString(4, "VIP");
//						}
//						else {
//							preparedStatement.setString(4, "Thường");
//						}
//						preparedStatement.setInt(5, room);
//						preparedStatement.execute();
//					} catch (SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}
//			}
//		}
//		
//	}
//	
//	public static void main(String[] args) {
//		SeatDAO seatDAO = new SeatDAO();
//		seatDAO.insert();
//	}
	
	
	public void getAllSeat(ShowTime showTime){
		List<Seat> listSeat = new ArrayList<>();
		String query = "SELECT * FROM tblSeat WHERE tblRoomid = ?;";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, showTime.getRoom().getId());
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Seat seat = new Seat();
				seat.setId(resultSet.getInt(1));
				seat.setName(resultSet.getString(2));
				seat.setRow(resultSet.getString(3));
				seat.setPosition(resultSet.getInt(4));
				seat.setType(resultSet.getString(5));
				listSeat.add(seat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		showTime.getRoom().setSeats(listSeat);
		
	}
	
	public List<Seat> getBookedSeat(ShowTime showTime){
		List<Seat> listSeat = new ArrayList<>();
		String query = "SELECT s.id, s.name, s.srow, s.position, s.type FROM tblTicket tk\r\n"
				+ "INNER JOIN tblSeat s ON s.id = tk.tblSeatid\r\n"
				+ "INNER JOIN tblShowTime st ON st.id = tk.tblShowTimeid\r\n"
				+ "INNER JOIN tblBill b ON b.id = tk.tblBillid;";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Seat seat = new Seat();
				seat.setId(resultSet.getInt(1));
				seat.setName(resultSet.getString(2));
				seat.setRow(resultSet.getString(3));
				seat.setPosition(resultSet.getInt(4));
				seat.setType(resultSet.getString(5));
				listSeat.add(seat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSeat;
	}
	
}
