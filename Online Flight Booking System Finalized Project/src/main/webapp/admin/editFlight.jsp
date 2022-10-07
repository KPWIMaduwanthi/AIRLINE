<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add Or Edit Flight </title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allFlightEditflight.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from flight where id='"+id+"'");
	while(rs.next())
	{

%>
<form action="editFlightAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="left-div">
 <h3>Starts From </h3>
 <input class="input-style" type="text" name="start" value="<%=rs.getString(2) %>" required> 
<hr>
</div>

<div class="right-div">
<h3>Destination</h3>
<input class="input-style" type="text" name="destination" value="<%=rs.getString(3) %>" required> 
<hr>
</div>

<div class="left-div">
<h3>Price</h3>
 <input class="input-style" type="number" name="price" value="<%=rs.getString(4) %>" required> 
<hr>
</div>

<div class="right-div">
<h3>Departure Date</h3>
<input class="input-style" type="date" name="date" value="<%=rs.getString(5) %>" required> 
<hr>
</div>

<div class="right-div">
<h3>Scheduled Time</h3>
 <input class="input-style" type="time" name="time" value="<%=rs.getString(6) %>" required> 
<hr>
</div>




<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
 <hr>
</div>
 
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
<br><br><br>
</body>
</html>