<%@page import="controller.RedemptionBillDAO"%>
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
	RedemptionBillDAO redemptionBillDAO = new RedemptionBillDAO();
	
	if (redemptionBill.getTotalOfPoint() > 0) {
		boolean isSuccess = redemptionBillDAO.saveRedemptionBill(redemptionBill);
		if(isSuccess){
			session.setAttribute("client", redemptionBill.getClient());
			session.removeAttribute("redemptionBill");
			%>
			<script type="text/javascript">
				alert("Đổi quà thành công!!")
				window.location.href = '../registration_member/ClientHomeView.jsp'
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
				alert("Đổi quà thất bại!!")
				history.back()
			</script>
			<%
		}
	
	} else {
	%>
	<script type="text/javascript">
		alert("Đổi quà thất bại!!")
		history.back()
	</script>
	<%
	}
	%>
</body>
</html>