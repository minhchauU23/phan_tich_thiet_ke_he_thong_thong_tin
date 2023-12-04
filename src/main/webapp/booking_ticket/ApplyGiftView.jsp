<%@page import="controller.RedemptionGiftDAO"%>
<%@page import="model.RedemptionGift"%>
<%@page import="java.util.List"%>
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
.main-container{
	display: flex;
	flex-direction: column;
}
</style>
</head>
<body>
	<%
		Bill bill = (Bill) session.getAttribute("bill");
		RedemptionGiftDAO redemptionGiftDAO = new RedemptionGiftDAO();
		List<RedemptionGift> listRedemptionGift = redemptionGiftDAO.getGiftOfClient(bill);
		
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
	
	<div class = "main-container">
		<%
			for(RedemptionGift redemptionGift : listRedemptionGift){
				%>
				<a class = "gift-item">
					<div class = "gift-infor">
						Gift1
					</div>
				</a>
				
				<%
			}
		
		%>
		
	</div>

</body>
</html>