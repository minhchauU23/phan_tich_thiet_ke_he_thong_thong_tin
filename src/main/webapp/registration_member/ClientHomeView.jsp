<%@page import="controller.ClientDAO"%>
<%@page import="model.Client"%>
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
}

.navigation-container {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: flex-end;
}

.navbar {
	background: linear-gradient(to right, #00c4cc, #8b3dff); display : flex;
	justify-content: space-between;
	flex-direction: row;
	align-items: baseline;
	padding: 0px 10px;
	display: flex;
}

.tab-container {
	display: flex;
	flex-direction: row;
	align-items: center;
}

body {
	background-repeat: no-repeat;
	background-size: cover;
}

.tab {
	font-size: 18px;
	font-weight: bolder;
	padding: 18px 10px;
	border: black;
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
	font-size: 16px; color : black;
	text-align: center;
	color: black;
}
#home{
	color: green;
	border-color: green;
}
</style>
</head>
<body>
	<%
	
	Client client = (Client)session.getAttribute("client");
	if(client == null){
		Member member = (Member) session.getAttribute("member");
		client = new Client();
		client.setId(member.getId());
		client.setUsername(member.getUsername());
		client.setPassword(member.getPassword());
		client.setFullName(member.getFullName());
		client.setDob(member.getDob());
		client.setGender(client.getGender());
		client.setEmail(member.getEmail());
		client.setRole(member.getRole());
		session.setAttribute("client", client);
		ClientDAO clientDAO = new ClientDAO();
		clientDAO.getClient(client);
	}
	%>

	<div class="navbar">
		<div class="tab-container">
			<div class="tab">
				<a href="./ClientHomeView.jsp" id = "home">Home</a>
			</div>
			<div class="tab">
				<a href="../booking_ticket/SearchShowTimeView.jsp">Booking Ticket</a>
			</div>
			<div class="tab">
				<a href="../redemption_gift/RedemptionGiftView.jsp">Redemption Gift</a>
			</div>
		</div>
		<div class="navigation-container">
			<div class="infor-member">
				<%=client.getUsername()%>
			</div>
			<div class="btn">
				<a href="HomeView.jsp">Logout</a>
			</div>
		</div>
	</div>
</body>
</html>