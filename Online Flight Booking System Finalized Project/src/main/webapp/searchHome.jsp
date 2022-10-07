<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">Flight Id</th>
            <th scope="col">Start</th>
            <th scope="col">Destination</th>
            <th scope="col"><i class="fa fa-dollar"></i>Price</th>
            <th scope="col">Departure Date</th>
            <th scope="col">Scheduled Time</th>
            <th scope="col">Make Reservation<i class="fa fa-plane" style="font-size:36px;"></i></th>
            
          </tr>
        </thead>
        <tbody>
<%
int z=0;
try{
	
	String search=request.getParameter("search");
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from flight where start like '%"+search+"%' or destination like '%"+search+"%' and active='Yes'");
	while(rs.next())
	{
		z=1;
%>
          <tr>
           <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td> <%=rs.getString(3) %></td>
            <td><i class="fa fa-dollor"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><a href="makeReservationAction.jsp">Make Reservation<i class="fa fa-plane" style="font-size:36px;"></i></a></td>
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
     <%if(z==0){%> 	
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All Right Reserved @Phoenix Airlines Private Limited Company.</p>
      </div>

</body>
</html>