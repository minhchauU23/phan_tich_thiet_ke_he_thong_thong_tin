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
	align-items: center;
	justify-content: flex-end;
}

.navbar {
	background: linear-gradient(to right, #00c4cc, #8b3dff);
	display: flex;
	justify-content: space-between;
	flex-direction: row;
	align-items: stretch;
	padding: 0px 10px;
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
}

.tab>a {
	text-decoration: none;
	color: green;
	border-right: 1px green solid;
	padding-right: 10px;
}

.tab:hover {
	background-color: rgb(10, 167, 167);
	cursor: pointer;
}

.btn {
	font-size: 18px;
	border: black;
	border-radius: 20px;
	background-color: green;
	text-align: center;
	padding: 6px 12px;
	margin-left: 10px;
}

.btn>a {
	text-decoration: none;
	color: white;
}

.btn:hover {
	cursor: pointer;
	background-color: yellowgreen;
}

.register-btn {
	background-color: red;
}
</style>
</head>
<body>
	<%
		session.invalidate();
	%>
	<div class="navbar">
		<div class="tab-container">
			<div class="tab">
				<a href="./HomeView.jsp">Home</a>
			</div>
		</div>
		<div class="navigation-container">
			<div class="btn login-btn">
				<a href="LoginView.jsp">Login</a>
			</div>
			<div class="btn register-btn">
				<a href="RegistrationView.jsp">Register</a>
			</div>


		</div>
	</div>

</body>
</html>