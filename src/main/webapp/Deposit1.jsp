<%@ page import="java.sql.*"%>
<%
long AccountNumber = Long.parseLong(request.getParameter("Anum"));
String Name = request.getParameter("name");
long Password = Long.parseLong(request.getParameter("pwd"));
double damount = Double.parseDouble(request.getParameter("amount"));
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "venky", "venky");
	PreparedStatement ps = con
	.prepareStatement("select Amount from Accounts where AccountNumber=? and Name=? and Password=?");
	ps.setLong(1, AccountNumber);
	ps.setString(2, Name);
	ps.setLong(3, Password);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
		double amount = damount + rs.getDouble(1);
		PreparedStatement ps1 = con.prepareStatement("update Accounts set Amount=? where AccountNumber=?");
		ps1.setDouble(1, amount);
		ps1.setLong(2, AccountNumber);
		int i = ps1.executeUpdate();
		if (i == 1) {
	out.print("<h1>Account Info</h1>");
	out.print("Your  diposited Amount is:" + damount + "<br>");
	out.print("your Total Amount Is:" + amount);
		}

	} else {
		out.println("enter correct details..");
	}
	con.close();
} catch (Exception e) {
	e.printStackTrace();
	out.println(e);
}
%>