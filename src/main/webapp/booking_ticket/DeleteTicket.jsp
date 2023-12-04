<%@page import="model.Ticket"%>
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
		for(Ticket ticket: bill.getListTicket()){
			if(ticket.getSeat().getId() == Integer.parseInt(id)){
				bill.setTotal(bill.getTotal() - ticket.getPrice());
				bill.setTotalBonusPoint(bill.getTotalBonusPoint() - ticket.getBonusPoint());
				bill.getListTicket().remove(ticket);
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