<%@ page import="java.sql.*"%>
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
    PreparedStatement ps=con.prepareStatement("insert into Teacher values(?,?,?,?,?,?,?)");
	String tname=request.getParameter("tname");
	String tid=request.getParameter("tid");
    String tgender=request.getParameter("tgender");
    String tclass=request.getParameter("tclass");
    String tsubject=request.getParameter("tsubject");
    String tphone=request.getParameter("tphone");
    String taddress=request.getParameter("taddress");
    ps.setString(1,tname);
    ps.setString(2,tid);
    ps.setString(3,tgender);
    ps.setString(4,tclass);
    ps.setString(5,tsubject);
    ps.setString(6,tphone);
    ps.setString(7,taddress);
    int rs=ps.executeUpdate();
    if(rs>0)
        out.println("<center><h1>Joined Successfully</h1></center>");
    else
        out.println("<center><h1>Something went wrong</h1></center>");
    con.close();
}
catch(SQLException sqe)
{
    if(sqe.getErrorCode()==1)
        out.println("<center><h3>Teacher_id Already Exits</h3></center>");
    else
        out.println(sqe);
}
catch(Exception e)
{
	out.println(e);
}
%>
		