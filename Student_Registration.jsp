<%@ page import="java.sql.*"%>
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
    PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?,?)");
	String sname=request.getParameter("sname");
	String sid=request.getParameter("sid");
    String sgender=request.getParameter("sgender");
    String sdob=request.getParameter("sdob");
    String sclass=request.getParameter("sclass");
    String saddress=request.getParameter("saddress");
    ps.setString(1,sname);
    ps.setString(2,sid);
    ps.setString(3,sgender);
    ps.setString(4,sdob);
    ps.setString(5,sclass);
    ps.setString(6,saddress);
    int rs=ps.executeUpdate();
    if(rs>0)
        out.println("<center><h1>Addmision Successfull</h1></center>");
    else
        out.println("<center><h1>Something went wrong</h1></center>");
    con.close();
}
catch(SQLException sqe)
{
    if(sqe.getErrorCode()==1)
        out.println("<center><h3>Roll Number Already Exits</h3></center>");
    else
        out.println(sqe);
}
catch(Exception e)
{
	out.println(e);
}
%>
		