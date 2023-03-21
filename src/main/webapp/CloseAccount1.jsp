<%@ page import="java.sql.*"%>
<%
int AccountNumber=Integer.parseInt(request.getParameter("Anum"));
String Name=request.getParameter("name");
int Password=Integer.parseInt(request.getParameter("pwd"));
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","venky","venky");
	PreparedStatement ps=con.prepareStatement("delete from Accounts where AccountNumber=? and Name=? and Password=?");
	ps.setInt(1,AccountNumber);
	ps.setString(2,Name);
	ps.setInt(3,Password);
        int i=ps.executeUpdate();
        if(i==1)
		{
			out.print("<h1>Account Info</h1>");
			out.print("Your Account is closed");	
		}
		
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
