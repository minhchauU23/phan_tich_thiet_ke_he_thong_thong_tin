<%@page import="java.util.Date"%>
<%@page import="model.Seat"%>
<%@page import="controller.SeatDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Ticket"%>
<%@page import="model.Client"%>
<%@page import="model.Bill"%>
<%@page import="model.ShowTime"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	flex-direction: column;
	background-repeat: no-repeat;
	background-size: cover;
}

.navigation-container {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: flex-end;
}

.main-container {
	background-color: white;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	flex: 1;
}

.navbar {
	background: linear-gradient(to right, #00c4cc, #8b3dff);
	display: flex;
	justify-content: space-between;
	flex-direction: row;
	align-items: center;
	padding: 0px 10px;
	display: flex;
}

.tab-container {
	display: flex;
	flex-direction: row;
	align-items: center;
}

.tab {
	font-size: 18px;
	font-weight: bolder;
	padding: 18px 10px;
	border: black;
	font-weight: bolder;
}

.tab>a {
	text-decoration: none;
	color: white;
	border-right: 1px white solid;
	padding-right: 10px;
}

.tab:hover {
	background-color: rgb(10, 167, 167);
	cursor: pointer;
}

.btn {
	font-size: 18px;
	background-color: red;
	border-radius: 20px;
	padding: 6px 12px;
	margin-left: 10px;
	background-color: red;
}

.btn>a {
	color: white;
	text-decoration: none;
}

.btn:hover {
	background-color: yellowgreen;
	cursor: pointer;
}

.infor-member {
	font-size: 16px;
	color: black;
	text-align: center;
	color: black;
}

#booking-tab {
	color: green;
	border-color: green;
}

.main-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.header {
	font-size: 25px;
	font-weight: bold;
	padding: 20px;
}

.seat-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 630px;
	justify-content: space-around;
}

.available-seat {
	padding: 10px 10px;
	border-radius: 10px;
	margin: 5px;
	text-decoration: none;
	background-color: green;
}

.available-seat:hover {
	background-color: #00c4cc;
	cursor: pointer;
}

.booked-seat {
	padding: 10px 10px;
	border-radius: 10px;
	text-decoration: none;
	margin: 5px;
	background-color: gray;
}

.booking-seat {
	padding: 10px 10px;
	border-radius: 10px;
	text-decoration: none;
	margin: 5px;
	background-color: #00c4cc;
}

.default-seat {
	color: white;
}

.vip-seat {
	color: red;
}

.default {
	padding: 10px 10px;
	border-radius: 10px;
	padding: 10px 10px;
	margin: 5px;
	color: white;
	background-color: green;
}

.booked {
	padding: 10px 10px;
	border-radius: 10px;
	padding: 10px 10px;
	margin: 5px;
	background-color: gray;
}

.vip {
	padding: 10px 10px;
	border-radius: 10px;
	padding: 10px 10px;
	border-radius: 10px;
	margin: 5px;
	color: red;
}

.available {
	padding: 10px 10px;
	border-radius: 10px;
	padding: 10px 10px;
	margin: 5px;
	color: white;
	background-color: green;
}

.booking {
	padding: 10px 10px;
	border-radius: 10px;
	padding: 10px 10px;
	margin: 5px;
	background-color: #00c4cc;
}

.infor-seat {
	display: flex;
	flex-direction: row;
	width: 500px;
	justify-content: center;
	padding-top: 20px;
	margin-bottom: 50px;
}

</style>
</head>
<body>
	<%
	
	String showTimeID = request.getParameter("showtimeid");
	List<ShowTime> listShowTime = (List<ShowTime>) session.getAttribute("listShowTime");
	ShowTime showTime = null;
	if(showTimeID == null || showTimeID.equals("")){
		showTime = (ShowTime) session.getAttribute("showTime");
	}
	else{
		for (ShowTime item : listShowTime) {
			if (item.getId() == Integer.parseInt(showTimeID)) {
				showTime = item;
				session.setAttribute("showTime", showTime);
				break;
			}
		}
	}
	
	Bill bill = (Bill) session.getAttribute("bill");
	if (bill == null) {
		bill = new Bill();
		Client client = (Client) session.getAttribute("client");
		List<Ticket> listTicket = new ArrayList();
		bill.setClient(client);
		bill.setListTicket(listTicket);
		bill.setTotal(0);
		bill.setTotalBonusPoint(0);
		bill.setDateTimePayment(new Date());
		session.setAttribute("bill", bill);
	}
	SeatDAO seatDAO = new SeatDAO();
	seatDAO.getAllSeat(showTime);
	List<Seat> listBookedSeat = seatDAO.getBookedSeat(showTime);
	%>

	<div class="navbar">
		<div class="tab-container">
			<div class="tab">
				<a href="../registration_member/ClientHomeView.jsp">Home</a>
			</div>
			<div class="tab">
				<a href="./SearchShowTimeView.jsp" id="booking-tab">Booking
					Ticket</a>
			</div>
			<div class="tab">
				<a href="../redemption_gift/RedemptionGiftView.jsp"
					id="redemption-tab">Redemption Gift</a>
			</div>
		</div>
		<div class="navigation-container">
			<div class="infor-member">
				<%=bill.getClient().getUsername()%>
			</div>
			<div class="btn">
				<a href="../registration_member/HomeView.jsp">Logout</a>
			</div>
		</div>
	</div>
	<div class="main-container">
		<div class="header">Select Seat</div>
		<div class="seat-container">
			<%
			for (Seat seat : showTime.getRoom().getSeats()) {
				boolean isBooked = false;
				boolean isBooking = false;
				for (Seat bookedSeat : listBookedSeat) {
					if (seat.getId() == bookedSeat.getId()) {
						isBooked = true;
						break;
					}
				}
				for (Ticket ticket : bill.getListTicket()) {
					if (ticket.getSeat().getId() == seat.getId()) {
						isBooking = true;
						break;
					}
				}
				if (isBooked) {
					%>
					<a class="booked-seat <%=seat.getType().equals("VIP") ? "vip-seat" : "default-seat"%> ">
						<%=seat.getName()%>
					</a>
					<%
				} else if (isBooking) {
					%>
					<a class="booking-seat <%=seat.getType().equals("VIP") ? "vip-seat" : "default-seat"%>" href="./DeleteTicket.jsp?id=<%=seat.getId()%>">
						<%=seat.getName()%>
					</a>
					<%
				} else {
					%>
					<a class="available-seat <%=seat.getType().equals("VIP") ? "vip-seat" : "default-seat"%>" href="./AddTicket.jsp?id=<%=seat.getId()%>">
						<%=seat.getName()%>
					</a>
					<%
				}
			}
			%>
		</div>
		<div class="infor-seat">
			<div class="booked">Booked Seat</div>
			<div class="available">Available Seat</div>
			<div class="vip">Vip Seat</div>
			<div class="booking">Booking Seat</div>
		</div>
		<div class = "btn">
			<a  href="./PaymentView.jsp">Next</a>
		</div>
		
	</div>
</body>
</html>