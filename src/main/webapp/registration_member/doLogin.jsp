<%@page import="controller.MemberDAO"%>
<%@page import="model.Member"%>
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
		Member member = new Member();
		member.setUsername(username);
		member.setPassword(password);
		MemberDAO memberDAO = new MemberDAO();
		boolean isSuccess = memberDAO.login(member);
		if(isSuccess){
			session.setAttribute("member", member);
			response.sendRedirect("ClientHomeView.jsp");
		}
		else{
			%>
			<script type="text/javascript">
				alert("Login failed!!!")
				history.back()
			</script>
			<%
		}
	%>

</body>
</html>