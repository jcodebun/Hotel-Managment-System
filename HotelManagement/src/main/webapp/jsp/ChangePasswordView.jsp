<%@page import="in.co.hotel.mgt.sys.controller.ChangePasswordCtl"%>
<%@page import="in.co.hotel.mgt.sys.util.DataUtility"%>
<%@page import="in.co.hotel.mgt.sys.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
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
							<div class="home_title"><h1>Change Password</h1></div>
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
                    <div class="card-header">Change Password
                    <b><font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font></b>
                
              <b><font color="Green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font></b>
                    </div>
                   
                    <div class="card-body">
                        <form action="<%=HMSView.CHANGE_PASSWORD_CTL%>" method="post">
                        
                        <jsp:useBean id="bean" class="in.co.hotel.mgt.sys.bean.UserBean"
            scope="request"></jsp:useBean>

	
		<input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
		
             				
             				<div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Old Password</label>
                                <div class="col-md-6">
                                    <input type="password" id="password" class="form-control" name="oldPassword" value=<%=DataUtility
                    .getString(request.getParameter("oldPassword") == null ? ""
                            : DataUtility.getString(request
                                    .getParameter("oldPassword")))%>>
                               <font
                        			color="red"> <%=ServletUtility.getErrorMessage("oldPassword", request)%></font>
                                </div>
                            </div>
             				

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">New Password</label>
                                <div class="col-md-6">
                                    <input type="password" id="password" class="form-control" name="newPassword" value=<%=DataUtility.getString(request.getParameter("newPassword") == null ? ""
                            : DataUtility.getString(request.getParameter("newPassword")))%>>
                               <font
                        			color="red"> <%=ServletUtility.getErrorMessage("newPassword", request)%></font>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                <div class="col-md-6">
                                    <input type="password" id="password" class="form-control" name="confirmPassword" value=<%=DataUtility.getString(request
                    .getParameter("confirmPassword") == null ? "" : DataUtility
                    .getString(request.getParameter("confirmPassword")))%>>
                               <font
                        color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
                                </div>
                            </div>
                            
                            

                            

                            <div class="col-md-6 offset-md-4">
                                <input type="submit" name="operation" class="btn btn-primary" value="<%=ChangePasswordCtl.OP_SAVE%>">
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