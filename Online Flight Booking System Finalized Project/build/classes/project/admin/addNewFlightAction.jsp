<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>  
<%
	String id=request.getParameter("id");
	String start=request.getParameter("start");
	String destination=request.getParameter("destination");
	String date=request.getParameter("date");
	String time=request.getParameter("time");
	String price=request.getParameter("price");
	String active=request.getParameter("active");
	
	try{
		Connection con=ConnectionProvider.getCon();
		PreparedStatement ps=con.prepareStatement("insert into flight values(?,?,?,?,?,?,?)");
		ps.setString(1, id);
		ps.setString(2, start);
		ps.setString(3, destination);
		ps.setString(4, date);
		ps.setString(5, time);
		ps.setString(6, price);
		ps.setString(7, active);
		ps.executeUpdate();
		response.sendRedirect("addNewFlight.jsp?msg=done");
	}
	catch(Exception e){
		response.sendRedirect("addNewFlight.jsp?msg=wrong");
	}
%>
 
 