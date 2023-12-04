<%@page import="model.Ticket"%>
<%@page import="model.Seat"%>
<%@page import="model.Bill"%>
<%@page import="model.ShowTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		ShowTime showTime = (ShowTime) session.getAttribute("showTime");
		Bill bill = (Bill) session.getAttribute("bill");
		for(Seat seat: showTime.getRoom().getSeats()){
			if(seat.getId() == Integer.parseInt(id)){
				Ticket ticket = new Ticket();
				ticket.setSeat(seat);
				ticket.setShowTime(showTime);
				if(seat.getType().equals("VIP")){
					ticket.setPrice(120000);
					ticket.setBonusPoint(1);
					bill.setTotalBonusPoint(bill.getTotalBonusPoint() + 1);
				}
				else{
					ticket.setPrice(100000);
					ticket.setBonusPoint(0.5f);
					bill.setTotalBonusPoint(bill.getTotalBonusPoint() + 0.5f);
				}
				bill.getListTicket().add(ticket);
				bill.setTotal(bill.getTotal() + ticket.getPrice());
				session.setAttribute("bill", bill);
				break;
			}
		}
	%>
	<script type="text/javascript">
				window.location.href = 'SelectSeatView.jsp'
	</script>
</body>
</html>