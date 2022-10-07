<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %> 
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
 
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title> Add New Flight</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Flight Added Successfully!</h3>
<% } %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from flight");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{}
%>

<form action="addNewFlightAction.jsp" method="post">
<h3 style="color: yellow;">Flight ID: <%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">


<div class="left-div">
 <h3>Starting From<i class="fa fa-plane" style="font-size:30px;color:blue"></i></h3>
 <input class="input-style" type="text" name="start" placeholder="Enter Starting Airport" required>
 <hr>
</div>

<div class="right-div">
<h3>Destination<i class="fa fa-plane" style="font-size:30px;color:blue"></i></h3>
 <input class="input-style" type="text" name="destination" placeholder="Enter Destination Airport" required>
 <hr>
</div>

<div class="center-div">
<h3> Economy Class Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required>   
<hr>
</div>

<div class="left-div">
<h3>Departure Date</h3>
 <input class="input-style" type="date" name="date" placeholder="Enter Depature Date" required>
 <hr>
</div>

<div class="right-div">
<h3>Scheduled Time</h3>
 <input class="input-style" type="time" name="time" placeholder="Enter Depaturing time" required>
<hr>
</div>




<div class="center-div">
 <h3>Active Status</h3> 
 <select class="input-style" name="active" >
 <option value="Yes"> Yes </option>
 <option value="No"> No </option>
 </select>
<hr>
</div>

<button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
 
</form>
</body>
<br><br><br>
</body>
</html>