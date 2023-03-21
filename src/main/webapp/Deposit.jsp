<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
h1 {
	color: red;
	text-align: center;
}

a {
	padding: 10px 50px 10px;
	margin-left: 13px;
	text-decoration: none;
	font-size: 18px;
	font-weight: 700;
}

fieldset {
	width: 20%;
	margin: 40px 0px 0px 501px;
	background: linear-gradient(45deg, yellow, green);
	color: white;
}
</style>
</head>
<body>
	<h1>DEPOSITE FORM</h1>
	<a href="HomeAccount.jsp">HOME</a>
	<a href="NewAccount.jsp">New Account</a>
	<a href="Balance.jsp">Balance</a>
	<a href="Deposit.jsp">Deposit</a>
	<a href="Withdraw.jsp">Withdraw</a>
	<a href="Transfer.jsp">Transfer</a>
	<a href="CloseAccount.jsp">Close A/C</a>
	<a href="About.jsp">AboutUs</a>
	<fieldset>
		<form action="Deposit1.jsp" method="get">
			<table>
				<tr>
					<td>Account Number:</td>
					<td><input type="text" name="Anum"></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="text" name="pwd"></td>
				</tr>
				<tr>
					<td>Amount:</td>
					<td><input type="text" name="amount"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit"></td>
					<td><input type="Reset" value="Clear"></td>
				</tr>
			</table>
		</form>
	</fieldset>

</body>
</html>