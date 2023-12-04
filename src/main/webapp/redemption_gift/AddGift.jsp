<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.RedemptionGift"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Gift"%>
<%@page import="java.util.List"%>
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
		String id = request.getParameter("id");
		String quantity = request.getParameter("quantity");
		if(quantity == null|| quantity.equals("")|| Integer.parseInt(quantity) <= 0){
			%>
				<script type="text/javascript">
					alert("Số lượng không hợp lệ")
					history.back()
				</script>
			<%
		}
		else{
			List<Gift> listGift = (List<Gift>)session.getAttribute("listGift");
			System.out.print("listgift " + listGift.size());
			RedemptionBill redemptionBill = (RedemptionBill) session.getAttribute("redemptionBill");
			RedemptionGift redemptionGift = null;
			boolean isExisted = false;
			
			for(RedemptionGift item: redemptionBill.getListRedemptionGift()){
				if(item.getGift().getId() == Integer.parseInt(id)){
					redemptionGift = item;
					isExisted = true;
					break;
				}
			}
			
			if(redemptionGift == null){
				for(Gift gift : listGift){
					if(gift.getId() == Integer.parseInt(id)){
						redemptionGift = new RedemptionGift();
						redemptionGift.setGift(gift);
						redemptionGift.setQuantity(0);
						redemptionGift.setUnitPoint(gift.getNeededPoint());
						redemptionGift.setRedemptionDate(new Date());
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(redemptionGift.getRedemptionDate());
						calendar.add(Calendar.DATE, 7);
						redemptionGift.setExpirationDate(calendar.getTime());
						break;
					}
				}
			}
			
			if(redemptionBill.getTotalOfPoint() + redemptionGift.getUnitPoint() * Integer.parseInt(quantity) <= redemptionBill.getClient().getPoint()){
				redemptionGift.setQuantity(redemptionGift.getQuantity() + Integer.parseInt(quantity));
				redemptionGift.setTotalPoint(redemptionGift.getUnitPoint()*redemptionGift.getQuantity());
				if(!isExisted) redemptionBill.getListRedemptionGift().add(redemptionGift);
				redemptionBill.setTotalOfPoint(redemptionBill.getTotalOfPoint() + redemptionGift.getUnitPoint() * Integer.parseInt(quantity));
				%>
				<script type="text/javascript">
				window.location.href = 'RedemptionGiftView.jsp'
				</script>
				<%
			}
			else{
				%>
				<script type="text/javascript">
					alert("Không đủ điểm!!")
					history.back()
				</script>
			<%
			}
			
			
			
		}
		
	%>
</body>
</html>