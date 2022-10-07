<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%

String email=session.getAttribute("email").toString();
String flight_id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and flight_id='"+flight_id+"'  and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
	
	
}
catch(Exception e)
{
	System.out.println(e);
}

%>