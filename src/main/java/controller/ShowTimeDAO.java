package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Film;
import model.Room;
import model.ShowTime;
import model.TimeSlot;

public class ShowTimeDAO extends DAO{
	public ShowTimeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<ShowTime> searchShowTime(Date showDate, String filmName){
		List<ShowTime> listShowTime = new ArrayList<>();
		String query = "SELECT st.id, f.id, f.name, f.director, f.genre, f.duration, f.poster, r.id, r.name, r.amountSeat, r.type, ts.id, ts.startTime, ts.showDate FROM tblShowTime st\r\n"
				+ "INNER JOIN tblFilm f ON st.tblFilmid = f.id\r\n"
				+ "AND f.name LIKE ? \r\n"
				+ "INNER JOIN tblRoom r ON st.tblRoomid = r.id\r\n"
				+ "INNER JOIN tblTimeSlot ts ON st.tblTimeSlotid = ts.id\r\n"
				+ "AND ts.showDate = ?;";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, filmName+"%");
			preparedStatement.setString(2, (new SimpleDateFormat("yyyy-MM-dd")).format(showDate));
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				ShowTime showTime = new ShowTime();
				showTime.setId(resultSet.getInt(1));
				
				Film film = new Film();
				film.setId(resultSet.getInt(2));
				film.setName(resultSet.getString(3));
				film.setDirector(resultSet.getString(4));
				film.setGenre(resultSet.getString(5));
				film.setDuration(resultSet.getInt(6));
				film.setPoster(resultSet.getString(7));
				
				showTime.setFilm(film);
				
				Room room = new Room();
				room.setId(resultSet.getInt(8));
				room.setName(resultSet.getString(9));
				room.setAmountSeat(resultSet.getInt(10));
				room.setType(resultSet.getString(11));
				
				showTime.setRoom(room);
				
				TimeSlot timeSlot = new TimeSlot();
				timeSlot.setId(resultSet.getInt(12));
				timeSlot.setStartTime((new SimpleDateFormat("HH:mm:ss")).parse(resultSet.getString(13)));
				timeSlot.setDate((new SimpleDateFormat("yyyy-MM-dd")).parse(resultSet.getString(14)));
				showTime.setTimeSlot(timeSlot);

				listShowTime.add(showTime);
			}
		} catch (SQLException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listShowTime;
		
	}
	
}
