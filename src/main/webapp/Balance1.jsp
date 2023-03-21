<%@ page import="java.sql.*"%>
<% 
long AccountNumber=Long.parseLong(request.getParameter("Anum"));
String Name=request.getParameter("name");
long Password=Long.parseLong(request.getParameter("pwd"));
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","venky","venky");
	PreparedStatement ps=con.prepareStatement("select Amount,Name,Address from Accounts where AccountNumber=? and Name=? and Password=?");
	ps.setLong(1,AccountNumber);
	ps.setString(2,Name);
	ps.setLong(3,Password);
	ResultSet rs=ps.executeQuery();
	ResultSetMetaData rsmd=rs.getMetaData();
	out.println("Welcome"+" "+Name);
	out.println("<table border='1'>");
	int n=rsmd.getColumnCount();
	for(int i=1;i<=n;i++)
		out.print("<td><font color=blue size=3> "+rsmd.getColumnName(i));
	out.print("<tr>");
	while(rs.next())
	{
		for(int i=1;i<=n;i++)
			out.println("<td><br>"+rs.getString(i));
		out.println("<tr>");
	}
	out.println("</table> </body> </html>");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>