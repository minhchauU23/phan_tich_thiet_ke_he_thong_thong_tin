<%@page import="model.ShowTime"%>
<%@page import="controller.ShowTimeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.RedemptionGift"%>
<%@page import="model.RedemptionBill"%>
<%@page import="model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.GiftInKind"%>
<%@page import="model.Coupon"%>
<%@page import="model.Gift"%>
<%@page import="controller.GiftDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
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
	flex-direction: row;
	justify-content: flex-start;
}

.search-container {
	display: flex;
	flex-direction: column;
	padding: 10px 10px;
	align-items: center;
	justify-content: flex-start;
}

.search-item {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding: 10px;
}

.search-item>input {
	padding: 5px 20px;
}

.search-item>label {
	padding: 5px 20px;
	font-size: 20px;
	font-weight: bold;
}

#btn-search {
	border-radius: 20px;
	padding: 5px 20px;
	font-weight: bold;
	background-color: green;
	flex: 1;
	color: white;
}

.showtime-main {
	display: flex;
	flex-direction: column;
	flex: 1;
	align-items: stretch;
}

.header {
	text-align: center;
	font-size: 32px;
	font-weight: bolder;
	color: white;
	background-color: purple;
}

.showtime-container {
	display: flex;
	flex-direction: column;
	justify-content:space-around;
	
}

.showtime-item {
	display: flex;
	flex-direction: row;
	text-decoration: none;
	font-size: 22px;
	color: black;
	margin: 15px;
}

.showtime-item:hover{
	background-color: #00c4cc;
}

.showtime-infor {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-content: space-around;
}

.film-infor {
	margin-left: 15px;
	padding: 10px;
}

.film-infor>.label {
	font-weight: bold;
}


.poster{
	width: 188px;
	height: 274px;
}
</style>
</head>
<body>
	<%
	Client client = (Client) session.getAttribute("client");
	String showDateRaw = (String) request.getParameter("showDate");
	String txtFilmName = (String) request.getParameter("filmName");
	Date showDate = null;
	if(txtFilmName == null){
		txtFilmName = "";
	}
	if (showDateRaw == null || showDateRaw.equals("")) {
		showDate = new Date();
	} else {
		showDate = (new SimpleDateFormat("yyyy-MM-dd")).parse(showDateRaw);
	}
	ShowTimeDAO showTimeDAO = new ShowTimeDAO();
	List<ShowTime> listShowTime = showTimeDAO.searchShowTime(showDate, txtFilmName);
	session.setAttribute("listShowTime", listShowTime);
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
				<%=client.getUsername()%>
			</div>
			<div class="btn">
				<a href="../registration_member/HomeView.jsp">Logout</a>
			</div>
		</div>
	</div>
	<div class="main-container">
		<div class="search-container">
			<form method="post" action="./SearchShowTimeView.jsp">
				<div class="search-item">
					<label>Show Date:</label> <input type="date"
						value="<%=(new SimpleDateFormat("yyyy-MM-dd")).format(showDate)%>"
						name="showDate">
				</div>
				<div class="search-item">
					<label>Film name:</label> <input type="text" name="filmName"
						placeholder="Enter Film Name" value="<%=txtFilmName%>">
				</div>
				<div class="search-item">
					<input type="submit" id="btn-search" value="Search">
				</div>
			</form>
		</div>
		<div class="showtime-main">
			<div class="header">Select ShowTime</div>
			<div class="showtime-container">
				<%
				for (ShowTime showTime: listShowTime) {
				%>
				<a href="./SelectSeatView.jsp?showtimeid=<%=showTime.getId()%>"
					class="showtime-item"> <img alt=""
					src="<%=showTime.getFilm().getPoster() %>"
					class="poster">
					<div class="showtime-infor">
						<div class="film-infor">
							<label class="label">Name: </label> <label><%=showTime.getFilm().getName() %></label>
						</div>
						<div class="film-infor">
							<label class="label">Director: </label> <label><%=showTime.getFilm().getDirector() %></label>
						</div>
						<div class="film-infor">
							<label class="label">Main genre: </label> <label><%=showTime.getFilm().getGenre() %></label>
						</div>
						<div class="film-infor">
							<label class="label">Duration: </label> <label><%=showTime.getFilm().getDuration() + " Min" %></label>
						</div>
						<div class="film-infor">
							<label class="label">Room: </label> <label><%=showTime.getRoom().getName() + "-" + showTime.getRoom().getType() %></label>
						</div>
						<div class="film-infor">
							<label class="label">TimeSlot: </label> <label><%=(new SimpleDateFormat("HH:mm")).format(showTime.getTimeSlot().getStartTime()) + " " + 
									(new SimpleDateFormat("dd/MM/yyyy")).format(showTime.getTimeSlot().getDate()) %></label>
						</div>
						
					</div>
				</a>
				<%
				}
				%>
			</div>
		</div>
	</div>


</body>
</html>