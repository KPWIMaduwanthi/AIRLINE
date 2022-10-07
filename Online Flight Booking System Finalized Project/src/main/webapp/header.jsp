<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString(); %> 
            <center><h2>Phoenix Airlines Flight Booking System</h2></center>
            <h2><a href=""><%out.println(email); %> <i class='fas fa-user-alt'></i></a></h2>
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="myCart.jsp">My Future Flights<i class="fa fa-plane" style="font-size:20px;"></i></a>
            <a href="myOrders.jsp">My Bookings  <i class='fab fa-elementor'></i></a>
            <a href="changeDetails.jsp">Change Details <i class="fa fa-edit"></i></a>
            <a href="contact.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
            <a href="about.jsp">Who We Are<i class="fa fa-address-book"></i></a>
            <a href="login.jsp">Logout <i class='fas fa-share-square'></i></a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
             <input type="text" name="search" placeholder="Search">
             <button type="submit"><i class="fa fa-search"></i></button>
             </form>
          
            </div>
          </div>
           <br>
           <!--table-->
