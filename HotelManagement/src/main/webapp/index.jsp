<%@page import="in.co.hotel.mgt.sys.controller.IndexCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.hotel.mgt.sys.bean.HotelBean"%>
<%@page import="in.co.hotel.mgt.sys.util.ServletUtility"%>
<%@page import="in.co.hotel.mgt.sys.controller.HMSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
</head>
<body>
<div class="super_container">
	
<%@ include file="jsp/Header.jsp" %>

	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/blog.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content text-center">
							<div class="home_title"><h1>Hotels</h1></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Search Box -->
<form action="<%=HMSView.INDEX_CTL%>" id="search_form" class="search_form" method="post">
	<div class="search_box">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="search_box_container d-flex flex-row align-items-center justify-content-start">
						<div class="search_form_container">
							
								<div class="d-flex flex-lg-row flex-column align-items-center justify-content-start">
											<input type="text" class="form-control" name="name" placeholder="Enter Hotel Name" value="<%=ServletUtility.getParameter("name", request)%>">&nbsp;&nbsp; 
										<input type="text" class="form-control" name="city" placeholder="Enter City" value="<%=ServletUtility.getParameter("city", request)%>"> &nbsp;&nbsp;
									<input type="submit" name="operation" value="<%=IndexCtl.OP_SEARCH%>" class="btn btn-primary">
								</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Blog -->

	<div class="blog">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<!-- Blog Posts -->
					<div class="blog_posts">
						
						<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
            <b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>
            
            
            
						<!-- Blog Post -->
						
						 <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;
                    HotelBean bean=null;
                    List list = ServletUtility.getList(request);
                    Iterator<HotelBean> it = list.iterator();

                    while (it.hasNext()) {

                         bean = it.next();
                %>
						<div class="blog_post">
							<div class="row">
								<div class="col-xl-5 col-lg-6">
									<div class="blog_post_content">
										
										<div class="pb_title"><h2><%=bean.getName()%></h2></div>
										<div class="pb_info">
											<ul class="d-flex flex-row align-items-center justify-content-start">
												<li>Contect:-<%=bean.getContect() %></li>
												<li>Rating:-<%=bean.getRating()+" "%>Star</li>
												<li>
													<ul class="d-flex flex-row align-items-center justify-content-start">
														<li><%=bean.getCity()%></li>
													</ul>
												</li>
												<li>Address:-<%=bean.getAddress() %></li>
											</ul>
										</div>
										<div class="pb_text">
											<p><%=bean.getDescription() %></p>
										</div>
										
										<div class="button blog_button"><a href="<%=HMSView.LOGIN_CTL%>">Book Hotel</a></div>
										
										
									</div>
								</div>
							</div>
						</div>

					<%} %>	
						
					</div>

					<!-- Page Nav -->
					
				</div>
			</div>
		</div>		
		<input type="hidden" name="pageNo" value="<%=pageNo%>">
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
	</div>
	</form>

	<!-- Newsletter -->

	

	<%@ include file="jsp/Footer.jsp" %>
</div>

</body>
</html>