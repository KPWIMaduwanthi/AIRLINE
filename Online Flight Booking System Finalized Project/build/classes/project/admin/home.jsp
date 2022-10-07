<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something Went Wrong! Try Again..!</h3>
<%} %>
<table>
	
        <thead>
          <tr>
            <th scope="col">Flight ID</th>
            <th scope="col">Starting From</th>
            <th scope="col">Destination</th>
            <th scope="col">Departure Date</th>
            <th scope="col">Scheduled Time</th>
            <th scope="col"><i class="fa fa-dollor"></i>Price</th>         
            <th scope="col">Make A Reservation<i class="fa fa-plane" style="font-size:36px;"></i></th>
            
          </tr>
        </thead>
       
        <tbody>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from flight where active='Yes'");
	while(rs.next())
	{
%>
	
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td> <%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><i class="fa fa-dollor"></i><%=rs.getString(6) %></td>
            
            <td><a href="makeReservationAction.jsp?id=<%=rs.getString(1) %>">Make A Reservation<i class="fa fa-plane" style="font-size:36px;"></i></a></td>
		 </tr>

<%
}
}
catch(Exception e)	{
	System.out.println(e);
	}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>