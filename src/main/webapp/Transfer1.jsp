<%@ page import="java.sql.*"%>
<%
long AccountNumber = Long.parseLong(request.getParameter("Anum"));
String Name = request.getParameter("name");
long Password = Long.parseLong(request.getParameter("pwd"));
long taccount = Long.parseLong(request.getParameter("tnum"));
double tamount = Double.parseDouble(request.getParameter("amount"));
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
		double temp = rs.getDouble(1);
		if (tamount < temp) {
	double amount = temp - tamount;
	PreparedStatement ps1 = con.prepareStatement("update Accounts set Amount=? where AccountNumber=?");
	ps1.setDouble(1, amount);
	ps1.setLong(2, AccountNumber);
	int i = ps1.executeUpdate();
	if (i == 1) {
		PreparedStatement ps2 = con.prepareStatement("update Accounts set Amount=? where AccountNumber=?");
		ps2.setDouble(1, tamount);
		ps2.setLong(2, taccount);
		int j = ps2.executeUpdate();
		if (j == 1) {
			out.print("<h1>Account Info</h1>");
			out.print("Your Trasfered Amount is:" + tamount + "<br>");
			out.print("your Total Amount Is:" + amount + "<br>");
			out.print("Your Transection Completed Successfully");
		}

	}

		} else {
	out.print("insufficent funds..");
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