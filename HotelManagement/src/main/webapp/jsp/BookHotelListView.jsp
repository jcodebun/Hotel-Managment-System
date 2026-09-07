<%@page import="in.co.hotel.mgt.sys.model.UserModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.hotel.mgt.sys.bean.BookHotelBean"%>
<%@page import="in.co.hotel.mgt.sys.controller.BookHotelListCtl"%>
<%@page import="in.co.hotel.mgt.sys.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Hotel List</title>
</head>
<body>
<div class="super_container">
	
<%@ include file="Header.jsp" %>

	<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="../images/blog.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content text-center">
							<div class="home_title"><h1>Book Hotel</h1></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Search Box -->
<form action="<%=HMSView.BOOK_HOTEL_LIST_CTL%>" id="search_form" class="search_form" method="post">
	<div class="search_box">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="search_box_container d-flex flex-row align-items-center justify-content-start">
						<div class="search_form_container">
							
								<div class="d-flex flex-lg-row flex-column align-items-center justify-content-start">
											<input type="text" class="form-control" name="hName" placeholder="Enter Hotel Name" value="<%=ServletUtility.getParameter("hName", request)%>">&nbsp;&nbsp; 
										<input type="text" class="form-control" name="city" placeholder="Enter Name" value="<%=ServletUtility.getParameter("name", request)%>"> &nbsp;&nbsp;
									<input type="submit" name="operation" value="<%=BookHotelListCtl.OP_SEARCH%>" class="btn btn-primary">
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
                    BookHotelBean bean=null;
                    List list = ServletUtility.getList(request);
                    Iterator<BookHotelBean> it = list.iterator();

                    while (it.hasNext()) {

                         bean = it.next();
                %>
						<div class="blog_post">
							<div class="row">
								<div class="col-xl-5 col-lg-6">
									<div class="blog_post_content">
										
										<div class="pb_title"><h2><%=bean.getHotelName()%></h2></div>
										<div class="pb_info">
											<ul class="d-flex flex-row align-items-center justify-content-start">
												<li>To Date:-<%=bean.getToDate()%></li>
												<li>From Date:-<%=bean.getFromDate()%></li>
												<% UserModel  uModel= new UserModel();
														UserBean uBean=uModel.findByPK(bean.getUserId());
												%>
												<li>Contect:-<%=uBean.getMobileNo()%></li>
												<li>No Of Person:-<%=bean.getNoOfPerson()%></li>
												
											</ul>
										</div>
										<div class="pb_text">
											<p>Name:-<%=bean.getUserName()%></p>
										</div>
										
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

	

	<%@ include file="Footer.jsp" %>
</div>
</body>
</html>