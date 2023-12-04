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

#redemption-tab {
	color: green;
	border-color: green;
}

.header {
	text-align: center;
	padding: 10px 0px;
}

table {
	border-collapse: collapse;
}

.th-gift>th {
	font-size: 14px;
	background-color: green;
	color: white;
	padding: 10px 6px;
}

.th-redemptionGift>th {
	font-size: 14px;
	background-color: red;
	color: white;
	padding: 10px 15px;
}

.row-gift>td {
	font-size: 13px;
	text-align: center;
	border-bottom: 1px green solid;
	padding: 10px 2px;
}

.row-redemptionGift>td {
	font-size: 13px;
	text-align: center;
	border-bottom: 1px red solid;
	padding: 12px 10px;
}

.infor-container {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

.item-infor-container {
	font-size: 20px;
	padding: 10px 10px 10px 0px;
}

.label-item {
	font-size: 20px;
	font-weight: bold;
}
.redempt-btn{
	color: white;
	border-radius: 20px;
	background-color: red;
	padding: 5px 20px;
	text-decoration: none;
	font-size: 20px;
}

.redempt-btn:hover {
	background-color: yellowgreen;
}
</style>
</head>
<body>
	<%
	RedemptionBill redemptionBill = (RedemptionBill) session.getAttribute("redemptionBill");
	if (redemptionBill == null) {
		redemptionBill = new RedemptionBill();
		Client client = (Client) session.getAttribute("client");
		List<RedemptionGift> listRedemptionGift = new ArrayList();
		redemptionBill.setListRedemptionGift(listRedemptionGift);
		redemptionBill.setClient(client);
		redemptionBill.setTotalOfPoint(0);
		redemptionBill.setRedemptionDate(new Date());
		session.setAttribute("redemptionBill", redemptionBill);
	}
	List<Gift> listGift = (ArrayList<Gift>) session.getAttribute("listGift");
	if (listGift == null) {
		GiftDAO giftDAO = new GiftDAO();
		listGift = giftDAO.getGift();
		session.setAttribute("listGift", listGift);
	}
	%>

	<div class="navbar">
		<div class="tab-container">
			<div class="tab">
				<a href="../registration_member/ClientHomeView.jsp">Home</a>
			</div>
			<div class="tab">
				<a href="../booking_ticket/SearchShowTimeView.jsp">Booking Ticket</a>
			</div>
			<div class="tab">
				<a href="./RedemptionGiftView.jsp" id="redemption-tab">Redemption Gift</a>
			</div>
		</div>
		<div class="navigation-container">
			<div class="infor-member">
				<%=redemptionBill.getClient().getUsername()%>
			</div>
			<div class="btn">
				<a href="../registration_member/HomeView.jsp">Logout</a>
			</div>
		</div>
	</div>
	<h1 class="header">Redemption Gift</h1>
	<div class="main-container">
		<table class="tblgift">
			<tr class="th-gift">
				<th>id</th>
				<th>Name</th>
				<th>Type</th>
				<th>Needed Point</th>
				<th>Condition</th>
				<th>Worth</th>
				<th>Enter Quantity</th>
				<th>Add</th>
			</tr>
			<%
			for (Gift gift : listGift) {
			%>
			<tr class="row-gift">
				<form method="post" action="AddGift.jsp">
					<td><%=gift.getId()%></td>
					<td><%=gift.getName()%></td>
					<td><%=gift.getType()%></td>
					<td><%=gift.getNeededPoint()%></td>
					<td><%=gift.getCondition()%></td>
					<td><%=(gift instanceof Coupon) ? ((Coupon) gift).getPercent() : ((GiftInKind) gift).getWorth()%></td>
					<td><input type="number" name="quantity"></td> <input
						type="hidden" name="id" value=<%=gift.getId()%>>
					<td><input type="submit" value="Add"></td>
				</form>
			</tr>
			<%
			}
			%>
		</table>
		<div class="redemption-container">
			<div class="infor-container">
				<div class="item-infor-container">
					<label class="label-item">Fullname: </label> <label><%=redemptionBill.getClient().getFullName()%></label>
				</div>
				<div class="item-infor-container">
					<label class="label-item">Point: </label> <label><%=redemptionBill.getClient().getPoint()%></label>

				</div>
			</div>
			<table class="redemption-gift">
				<tr class="th-redemptionGift">
					<th>Name</th>
					<th>Type</th>
					<th>Condition</th>
					<th>Unit Point</th>
					<th>Worth</th>
					<th>Quantity</th>
					<th>Total</th>
					<th>Delete</th>
				</tr>
				<%
				for (RedemptionGift redemptionGift : redemptionBill.getListRedemptionGift()) {
				%>
				<tr class="row-redemptionGift">
					<td><%=redemptionGift.getGift().getName()%></td>
					<td><%=redemptionGift.getGift().getType()%></td>
					<td><%=redemptionGift.getGift().getCondition()%></td>
					<td><%=redemptionGift.getUnitPoint()%></td>
					<td><%=(redemptionGift.getGift() instanceof Coupon) ? ((Coupon) redemptionGift.getGift()).getPercent()
		: ((GiftInKind) redemptionGift.getGift()).getWorth()%></td>
					<td><%=redemptionGift.getQuantity()%></td>
					<td><%=redemptionGift.getTotalPoint()%></td>
					<td><a
						href="./DeleteGift.jsp?position=<%=redemptionBill.getListRedemptionGift().indexOf(redemptionGift)%>">Delete</a></td>
				</tr>
				<%
				}
				%>
			</table>
			<div class="infor-redemptionBill">
				<div class="item-infor-container">
					<label class="label-item">Total point: </label> <label><%=redemptionBill.getTotalOfPoint()%></label>
				</div>
				<a class ="redempt-btn" href="./doSaveRedemptionBill.jsp">Redemption</a>
			</div>
		</div>

	</div>
</body>
</html>