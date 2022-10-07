<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%
	String id=request.getParameter("id");
	String start=request.getParameter("start");
	String destination=request.getParameter("destination");
	String date=request.getParameter("date");
	String time=request.getParameter("time");
	String price=request.getParameter("price");
	String active=request.getParameter("active");
	try
	{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		st.executeUpdate("update flight set start='"+start+"',destination='"+destination+"',date='"+date+"',time='"+time+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
		if(active.equals("No"))
		{
			st.executeUpdate("delete from booking where flight_id='"+id+"' and address is NULL");
		}
		response.sendRedirect("allFlightEditflight.jsp?msg=done");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("allFlightEditflight.jsp?msg=wrong");
	}
	
%>