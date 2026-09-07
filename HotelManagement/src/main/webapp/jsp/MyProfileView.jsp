<%@page import="in.co.hotel.mgt.sys.controller.MyProfileCtl"%>
<%@page import="in.co.hotel.mgt.sys.util.DataUtility"%>
<%@page import="in.co.hotel.mgt.sys.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
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
							<div class="home_title"><h1>My Profile</h1></div>
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
                    <div class="card-header">My Profile
                    <b><font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font></b>
                
              <b><font color="Green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font></b>
                    </div>
                   
                    <div class="card-body">
                        <form action="<%=HMSView.MY_PROFILE_CTL%>" method="post">
                        
                        <jsp:useBean id="bean" class="in.co.hotel.mgt.sys.bean.UserBean"
            scope="request"></jsp:useBean>

	
		<input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
		
             				<div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">First Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="firstName" value="<%=DataUtility.getStringData(bean.getFirstName())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("firstName", request)%></font>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Last Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="lastName" value="<%=DataUtility.getStringData(bean.getLastName())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("lastName", request)%></font>
                                </div>
                            </div>
             
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Login Id</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="login" value="<%=DataUtility.getStringData(bean.getLogin())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
                                </div>
                            </div>

                            
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Mobile No.</label>
                                <div class="col-md-6">
                                    <input type="text" id="email_address" class="form-control" name="mobileNo" value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
                                    <font  color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
                                </div>
                            </div>

                            

                            <div class="col-md-6 offset-md-4">
                                <input type="submit" name="operation" class="btn btn-primary" value="<%=MyProfileCtl.OP_SAVE%>">
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