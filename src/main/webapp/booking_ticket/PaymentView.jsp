<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Ticket"%>
<%@page import="model.Bill"%>
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
	justify-content: space-around;
	margin: 20px 400px;
	padding: 20px;
}

.list-ticket{
	display: flex;
	flex-direction: column;
	
}
.ticket-item{
	display: flex;
	flex-direction: row;
	margin-top: 15px;
}
.ticket-item>img{
	width: 100px;
	height: 150px;
}
.ticket-container{
	display: flex;
	padding: 10px;
	flex-direction: column;
}
.ticket-infor{
	font-size: 15px;
	padding-left: 10px;
}
.btnBooking{
	font-size: 18px;
	background-color: red;
	border-radius: 20px;
	width: 100px;
	text-align: center;
}
.btnBooking:hover{
	background-color: yellowgreen;
	cursor: pointer;
}
.btnBooking>a{
	color: white;
	text-decoration: none;
}
label{
	font-size: 20px;
}
.label{
	font-size: 20px;
	font-weight: bold;
}
.infor-bill{
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<%
	Bill bill = (Bill) session.getAttribute("bill");
	if(bill.getListTicket().size() == 0){
		%>
			<script type="text/javascript">
				alert("Vui lòng chọn chỗ ngồi!!")
				history.back()
			</script>
		<%
	}
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
		<div class="client-name">
			<label class = "label">Full Name:</label> <label><%=bill.getClient().getFullName()%></label>
		</div>
		<div class="list-ticket">
			<%
				for(Ticket ticket: bill.getListTicket()){
					%>
					<div class = "ticket-item">
						<img alt="" src="<%=ticket.getShowTime().getFilm().getPoster()%>">
						<div class = "ticket-container">
							<div class = "ticket-infor">
								<label  class = "label" >Name:</label><label><%=ticket.getShowTime().getFilm().getName() %></label>
							</div>
							<div class = "ticket-infor">
								<label  class = "label">Duration:</label><label><%=ticket.getShowTime().getFilm().getDuration() %></label>
							</div>
							<div class="ticket-infor">
								<label class="label">Room: </label> <label><%=ticket.getShowTime().getRoom().getName() + "-" + ticket.getShowTime().getRoom().getType() %></label>
							</div>
							<div class="ticket-infor">
								<label class="label">TimeSlot: </label> <label><%=(new SimpleDateFormat("hh:mm")).format(ticket.getShowTime().getTimeSlot().getStartTime()) + " " + 
									(new SimpleDateFormat("dd/MM/yyyy")).format(ticket.getShowTime().getTimeSlot().getDate()) %></label>
							</div>
							<div class="ticket-infor">
								<label class="label">Seat: </label> <label><%=ticket.getSeat().getName() + "-" + ticket.getSeat().getType() %></label>
							</div>
							<div class="ticket-infor">
								<label class="label">Bonus Point: </label> <label><%=ticket.getBonusPoint()%></label>
							</div>
						</div>
					</div>
					<% 
				}
			%>
		</div>
		<div class = "bill-container">
			<div class = "infor-bill">
				<label  class = "label">Total Bonus Point: </label>
				<label><%=bill.getTotalBonusPoint() %></label>
			</div>
			<div class = "infor-bill">
				<label  class = "label">Gift: </label>
				<% 
					if(bill.getGift() == null){
						%><a href="./ApplyGiftView.jsp"> Apply Gift</a><%
					}
					else{
						%>
						<label><%=bill.getGift().getGift().getName()%></label>
						<%
					}
				%>
			</div>
			<div class = "infor-bill">
				<label  class = "label">Total: </label>
				<label><%=bill.getTotal() %></label>
			</div>
			<div class = "btnBooking">
			<a href="./doSaveBill.jsp">Booking</a>
		</div>
		</div>
		
	</div>
</body>
</html>