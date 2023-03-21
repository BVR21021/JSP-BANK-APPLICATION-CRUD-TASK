<%@ page import="java.sql.*"%>
<%
long Account_Number = Long.parseLong(request.getParameter("Anum"));
String Name = request.getParameter("name");
long Password = Long.parseLong(request.getParameter("pwd"));
long ConfirmPassword = Long.parseLong(request.getParameter("cpwd"));
double Amount = Double.parseDouble(request.getParameter("amount"));
String Address = request.getParameter("uadd");
long MobileNumber = Long.parseLong(request.getParameter("mobile"));
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "venky", "venky");
	PreparedStatement ps = con.prepareStatement("insert into Accounts values(?,?,?,?,?,?,?)");
	ps.setLong(1, Account_Number);
	ps.setString(2, Name);
	ps.setLong(3, Password);
	ps.setLong(4, ConfirmPassword);
	ps.setDouble(5, Amount);
	ps.setString(6, Address);
	ps.setLong(7, MobileNumber);
	int i = ps.executeUpdate();
	if (i == 1) {
		out.print("<h1>Account Info</h1>");
		out.print("Your Account is created..");
	}
} catch (Exception e) {
	out.println(e);
}
%>