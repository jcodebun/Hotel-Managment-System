<%@page import="in.co.hotel.mgt.sys.controller.LoginCtl"%>
<%@page import="in.co.hotel.mgt.sys.bean.UserBean"%>
<%@page import="in.co.hotel.mgt.sys.controller.HMSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/HotelManagement/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/HotelManagement/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/plugins/OwlCarousel2-2.2.1/animate.css">
<link href="/HotelManagement/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/styles/login.css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/HotelManagement/styles/blog_responsive.css">


     <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="icon" href="Favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<%
    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;

    String welcomeMsg = "Hi, ";

    if (userLoggedIn) {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    } else {
        welcomeMsg += "Guest";
    }

%>
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="header_content d-flex flex-row align-items-center justify-content-start">
						<div class="logo">
							<a href="#">
								<div><h3 style="color: white;">Hotel Management</h3></div>
								
							</a>
						</div>
						<nav class="main_nav">
							<ul class="d-flex flex-row align-items-center justify-content-start">
								<li class="active"><a href="<%=HMSView.WELCOME_CTL%>">Home</a></li>
								
								<%
       								 if (userLoggedIn) {
   								 %>
   								 
   								 <%if(userBean.getRoleId()==1){ %>
								
								<li><a href="<%=HMSView.HOTEL_CTL%>">Add Hotel</a></li>
								<li><a href="<%=HMSView.HOTEL_LIST_CTL%>">Hotel List</a></li>
								<li><a href="<%=HMSView.BOOK_HOTEL_LIST_CTL%>">Book Hotel Detail</a></li>
								
								
								
								<%}else{ %>
								<li><a href="<%=HMSView.HOTEL_LIST_CTL%>">Hotel List</a></li>
								<li><a href="<%=HMSView.BOOK_HOTEL_LIST_CTL%>">Book Hotel Detail</a></li>
								<%} %>
								<li><a href="<%=HMSView.MY_PROFILE_CTL%>">My Profile</a></li>
								<li><a href="<%=HMSView.CHANGE_PASSWORD_CTL%>">Change Password</a></li>
								<li><a href="<%=HMSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a></li>
								<%}else{ %>
								
								<li><a href="<%=HMSView.INDEX_CTL%>">Hotels</a></li>	
								<li><a href="<%=HMSView.LOGIN_CTL%>">Login</a></li>
								<li><a href="<%=HMSView.USER_REGISTRATION_CTL%>">Sign Up</a></li>
								
								<%} %>
							</ul>
						</nav>
						
						
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>