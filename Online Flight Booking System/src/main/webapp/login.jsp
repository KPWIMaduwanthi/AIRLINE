
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter Your Email" required>
     <input type="password" name="password" placeholder="Enter Your Password" required>
     <input type="submit" value="Login">
     </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  	String msg=request.getParameter("msg");
  	if("notexist".equals(msg))
  	{
  %>
  <h1>Incorrect User Name or Password</h1>
<%} %>
<%if ("invalid".equals(msg))
{
%>

<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>

    <h2>Welcome To Phoenix Airlines</h2>
    <p>The Online Flight Ticket Booking System is the application that allows the Phoenix Airlines users to easily make their 
    	reservations and book tickets for their wishing destinations with lower cost</p>
  </div>
</div>

</body>
</html>