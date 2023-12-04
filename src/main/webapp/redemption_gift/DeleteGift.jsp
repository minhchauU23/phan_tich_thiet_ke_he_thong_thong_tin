<%@page import="model.RedemptionGift"%>
<%@page import="model.RedemptionBill"%>
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
		RedemptionBill redemptionBill = (RedemptionBill) session.getAttribute("redemptionBill");
		String position = (String)request.getParameter("position");
		RedemptionGift redemptionGift = redemptionBill.getListRedemptionGift().get(Integer.parseInt(position));
		redemptionBill.setTotalOfPoint(redemptionBill.getTotalOfPoint() - redemptionGift.getTotalPoint());
		redemptionBill.getListRedemptionGift().remove(Integer.parseInt(position));
		session.setAttribute("redemptionBill", redemptionBill);
		%>
			<script type="text/javascript">
			window.location.href = 'RedemptionGiftView.jsp'
			</script>
		<%
	%>
</body>
</html>