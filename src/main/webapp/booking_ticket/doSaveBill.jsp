<%@page import="controller.BillDAO"%>
<%@page import="model.Bill"%>
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
		Bill bill = (Bill)session.getAttribute("bill");
	if (bill.getListTicket().size() > 0) {
		BillDAO billDAO = new BillDAO();
		boolean isSuccess = billDAO.saveBill(bill);
		if(isSuccess){
			session.setAttribute("client", bill.getClient());
			session.removeAttribute("bill");
			%>
			<script type="text/javascript">
				alert("Đặt vé thành công!!")
				window.location.href = '../registration_member/ClientHomeView.jsp'
			</script>
			<%
		}
		else{
			%>
			<script type="text/javascript">
				alert("Đặt vé thất bại!!")
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