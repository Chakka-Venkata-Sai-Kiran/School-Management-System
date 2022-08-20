<%@ page import="java.sql.*"%>
<link href="Class_info_response.css" rel="stylesheet" type="text/css">
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
	String cfind=request.getParameter("cfind");
    Statement stmt = con.createStatement();
    ResultSet flag=stmt.executeQuery(" select roll,name    from student where class='"+cfind+"'");
    out.print("<center><table border=1 cellspaing=10 cellpadding=10><caption><h3>Student's Info</h3></caption><tr>");
    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery(" select roll,name    from student where class='"+cfind+"'");
        ResultSetMetaData rsmd=rs.getMetaData();
        int colCount=rsmd.getColumnCount();
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
        rs.close();
    }
    else
    {
        out.print("<tr><td>No data exist</td></tr>");
    }
    out.print("</table></center>");
    out.print("<center><table border=1 cellspaing=10 cellpadding=10><caption><h3>Teacher's info</h3></caption><tr>");
    flag=stmt.executeQuery(" select name,teacher_id from teacher where class='"+cfind+"'");
    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery(" select name,teacher_id from teacher where class='"+cfind+"'");
        ResultSetMetaData rsmd=rs.getMetaData();
        int colCount=rsmd.getColumnCount();
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
        rs.close();
    }
    else
    {
        out.print("<tr><td>No data exist</td></tr>");
    }
    out.print("</table></center>");
    flag.close();
    con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
		