package in.co.hotel.mgt.sys.controller;

public interface HMSView {
	
	public String APP_CONTEXT = "/HotelManagement";

	public String LAYOUT_VIEW = "/BaseLayout.jsp";
	public String PAGE_FOLDER = "/jsp";

	public String JAVA_DOC_VIEW = APP_CONTEXT + "/doc/index.html";

	public String ERROR_VIEW = PAGE_FOLDER + "/Error.jsp";

	public String INDEX_VIEW = "/index.jsp";
	
	public String USER_VIEW = PAGE_FOLDER + "/UserView.jsp";	
	public String USER_LIST_VIEW = PAGE_FOLDER + "/UserListView.jsp";
	public String USER_REGISTRATION_VIEW = PAGE_FOLDER + "/UserRegistrationView.jsp";
	
	
	public String HOTEL_VIEW = PAGE_FOLDER + "/HotelView.jsp";	
	public String HOTEL_LIST_VIEW = PAGE_FOLDER + "/HotelListView.jsp";
	
	
	public String BOOK_HOTEL_VIEW = PAGE_FOLDER + "/BookHotelView.jsp";	
	public String BOOK_HOTEL_LIST_VIEW = PAGE_FOLDER + "/BookHotelListView.jsp";
		
	
	public String LOGIN_VIEW = PAGE_FOLDER + "/LoginView.jsp";
	public String WELCOME_VIEW = PAGE_FOLDER + "/WelcomeView.jsp";
	public String CHANGE_PASSWORD_VIEW = PAGE_FOLDER + "/ChangePasswordView.jsp";
	public String MY_PROFILE_VIEW = PAGE_FOLDER + "/MyProfileView.jsp";
	public String FORGET_PASSWORD_VIEW = PAGE_FOLDER + "/ForgetPasswordView.jsp";

	
	

	public String ERROR_CTL = "/ctl/ErrorCtl";

	
	public String USER_CTL = APP_CONTEXT + "/ctl/UserCtl";
	public String USER_LIST_CTL = APP_CONTEXT + "/ctl/UserListCtl";
	
	
	
	public String HOTEL_CTL = APP_CONTEXT + "/ctl/HotelCtl";
	public String HOTEL_LIST_CTL = APP_CONTEXT + "/ctl/HotelListCtl";
	
	public String BOOK_HOTEL_CTL = APP_CONTEXT + "/ctl/BookHotelCtl";
	public String BOOK_HOTEL_LIST_CTL = APP_CONTEXT + "/ctl/BookHotelListCtl";
	
	public String INDEX_CTL = APP_CONTEXT + "/IndexCtl";
	
	public String USER_REGISTRATION_CTL = APP_CONTEXT + "/UserRegistrationCtl";
	public String LOGIN_CTL = APP_CONTEXT + "/LoginCtl";
	public String WELCOME_CTL = APP_CONTEXT + "/WelcomeCtl";
	public String LOGOUT_CTL = APP_CONTEXT + "/LoginCtl";
	public String CHANGE_PASSWORD_CTL = APP_CONTEXT + "/ctl/ChangePasswordCtl";
	public String MY_PROFILE_CTL = APP_CONTEXT + "/ctl/MyProfileCtl";
	public String FORGET_PASSWORD_CTL = APP_CONTEXT + "/ForgetPasswordCtl";



}
