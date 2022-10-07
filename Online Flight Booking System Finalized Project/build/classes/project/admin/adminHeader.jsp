
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString(); %>
           <center><h2> Phoenix Airlines </h2></center> 
            <a href="addNewFlight.jsp"> Add New Flight <i class='fas fa-plus-square'></i></a>
            <a href="allFlightEditflight.jsp">All Flights And Edit Flights <i class="fa fa-plane" style="font-size:25px;"></i></a>
            <a href="">Messages Received <i class='fas fa-comment-alt'></i></a>
            <a href="">Bookings <i class="fas fa-archive"></i></a>
            <a href="">Cancel Bookings <i class='fas fa-window-close'></i></a>
            <a href=""> <i class='fas fa-dolly'></i></a>
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
       </div>
      <br>
           <!--table-->
           


