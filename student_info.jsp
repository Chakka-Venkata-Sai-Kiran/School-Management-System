<%@ page import="java.sql.*"%>
<link href="student_info_response.css" rel="stylesheet">
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	String sfind=request.getParameter("sfind");
    Statement stmt = con.createStatement();
    ResultSet flag=stmt.executeQuery(" select * from student where roll='"+sfind+"'");
    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery(" select * from student where roll='"+sfind+"'");
        ResultSetMetaData rsmd=rs.getMetaData();
        int colCount=rsmd.getColumnCount();
        out.println("<br><br><br><br>");
        out.println("<h2>Student Info</h2>");
        out.println("<br><br>");
        out.print("<center><table><tr>");
        for(int i=1;i<=colCount;i++)
        out.print("<td><b>"+rsmd.getColumnLabel(i)+"</b></td>");
        out.print("</tr>");
        while(rs.next())
        {
            out.print("<tr>");
            for(int i=1;i<=colCount;i++)
            out.print("<td>"+rs.getString(i)+"</td>");
            out.print("</tr>");
        }
        out.print("</table></center>");
        rs.close();
    }
    else
    {
        out.print("<center><h3>No data exist</h3></center>");
    }
    flag.close();
    con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
		