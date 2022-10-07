<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%
String email=session.getAttribute("email").toString();
String flight_id=request.getParameter("id");
int quantity=1;
int flight_pricecl1=0;
int flight_total=0;
int booking_total=0;

int z=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from flight where id='"+flight_id+"'");
	while(rs.next())
	{
		flight_pricecl1=rs.getInt(6);
		flight_total=flight_pricecl1;
	}
	ResultSet rs1=st.executeQuery("select *from booking where flight_id='"+flight_id+"' and email='"+email+"' ");
	while(rs1.next())
	{
		booking_total=rs1.getInt(4);
		booking_total=booking_total+flight_total;
		quantity=rs.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1){
		st.executeUpdate("update booking set total='"+booking_total+"',quantity='"+quantity+"' where flight_id='"+flight_id+"' and email='"+email+"'");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0)
	{
		PreparedStatement ps=con.prepareStatement("insert into booking (email,flight_id,quantity,total) values(?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, flight_id);
		ps.setInt(3, quantity);
		ps.setInt(4, flight_total);
		response.sendRedirect("home.jsp?msg=added");
	}
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>