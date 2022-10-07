<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%
String email=session.getAttribute("email").toString();
String flight_id=request.getParameter("id");
//declareing some variables
int quantity=1;
int flight_price=0;
int flight_total=0;
int cart_total=0;

int z=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from flight where id='"+flight_id+"'");
	while(rs.next())
	{
		flight_price=rs.getInt(4);
		flight_total=flight_price;
	}
	ResultSet rs1=st.executeQuery("select *from cart where flight_id='"+flight_id+"' and email='"+email+"' ");
	while(rs1.next())
	{
		cart_total=rs1.getInt(5);
		cart_total=cart_total+flight_total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1){
		st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where flight_id="+flight_id+" and email='"+email+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0)
	{
		PreparedStatement ps=con.prepareStatement("insert into cart(email,flight_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, flight_id);
		ps.setInt(3, quantity);
		ps.setInt(4, flight_price);
		ps.setInt(5, flight_total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>