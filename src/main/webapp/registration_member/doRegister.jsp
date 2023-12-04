<%@page import="controller.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Client"%>
<%@page import="model.Member"%>
<%@page import="java.util.Date"%>
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullName = request.getParameter("fullName");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		//validate
		System.out.print(dob.equals(""));
		if(username == null || username.contains(" ") || username.equals("")
			|| password == null|| password.equals("")
			|| fullName == null || fullName.equals("")
			|| dob == null || dob.equals("")
			|| gender == null || gender.equals("")
			|| email == null || email.equals("") || email.contains(" ") ||!email.contains("@")
			|| phone == null || phone.equals("")
			|| address == null || address.equals("")
				){
			%>
			<script type="text/javascript">
				alert("Invalid Infor!!");
				history.back();
			</script>
			<%
			
		}
		
		Member client = new Client();
		client.setUsername(username);
		client.setPassword(password);
		client.setFullName(fullName);
		client.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(dob));
		client.setGender(gender);
		client.setEmail(email);
		((Client)client).setPhone(phone);
		((Client)client).setAddress(address);
		
		MemberDAO memberDAO = new MemberDAO();
		boolean isSuccess = memberDAO.register(client);
		if(isSuccess){
			%>
			<script type="text/javascript">
				alert("Register successful!!")
				window.location.href = 'HomeView.jsp'
			</script>
			<%
			response.sendRedirect("HomeView.jsp");
		}
		else{
			%>
			<script type="text/javascript">
				alert("Register failed!!");
				history.back();
			</script>
			<%
		}
		
	%>
</body>
</html>