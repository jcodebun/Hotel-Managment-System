<%@page import="in.co.hotel.mgt.sys.controller.HotelCtl"%>
<%@page import="in.co.hotel.mgt.sys.util.DataUtility"%>
<%@page import="in.co.hotel.mgt.sys.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Hotel</title>
</head>
<body>
<%@ include file="Header.jsp" %>

		<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="/HotelManagement/images/blog.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content text-center">
							<div class="home_title"><h1>Add Hotel</h1></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>					
<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Add Hotel
                    <b><font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font></b>
                
              <b><font color="Green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font></b>
                    </div>
                   
                    <div class="card-body">
                        <form action="<%=HMSView.HOTEL_CTL%>" method="post">
                        
                        <jsp:useBean id="bean" class="in.co.hotel.mgt.sys.bean.HotelBean"
            scope="request"></jsp:useBean>

	
		<input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
		
             				<div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="name" value="<%=DataUtility.getStringData(bean.getName())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("name", request)%></font>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Contect</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="contect" value="<%=DataUtility.getStringData(bean.getContect())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("contect", request)%></font>
                                </div>
                            </div>
             
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Rating</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="rating" value="<%=DataUtility.getStringData(bean.getRating())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("rating", request)%></font>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">City</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="city" value="<%=DataUtility.getStringData(bean.getCity())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("city", request)%></font>
                                </div>
                            </div>
                            
                            
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Address</label>
                                <div class="col-md-6">
                                    <textarea rows="3" cols="5" name="address" class="form-control" ><%=DataUtility.getStringData(bean.getAddress()) %></textarea>
                                    <font  color="red"><%=ServletUtility.getErrorMessage("address", request)%></font>
                                </div>
                            </div>
                            
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Description</label>
                                <div class="col-md-6">
                                    <textarea rows="3" cols="5" name="description" class="form-control" ><%=DataUtility.getStringData(bean.getDescription()) %></textarea>
                                    <font  color="red"><%=ServletUtility.getErrorMessage("description", request)%></font>
                                </div>
                            </div>

                            
                            
                          

                            

                            <div class="col-md-6 offset-md-4">
                                <input type="submit" name="operation" class="btn btn-primary" value="<%=HotelCtl.OP_SAVE%>">
                                <input type="submit" name="operation" class="btn btn-primary" value="<%=HotelCtl.OP_RESET%>">
                            </div>
                   
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>

</main>     
						

  

	
	

<%@ include file="Footer.jsp" %>
</body>
</html>