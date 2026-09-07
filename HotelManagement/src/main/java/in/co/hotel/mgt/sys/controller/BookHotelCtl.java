package in.co.hotel.mgt.sys.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import in.co.hotel.mgt.sys.bean.BaseBean;
import in.co.hotel.mgt.sys.bean.BookHotelBean;
import in.co.hotel.mgt.sys.bean.HotelBean;
import in.co.hotel.mgt.sys.bean.UserBean;
import in.co.hotel.mgt.sys.exception.ApplicationException;
import in.co.hotel.mgt.sys.exception.DuplicateRecordException;
import in.co.hotel.mgt.sys.model.BookHotelModel;
import in.co.hotel.mgt.sys.model.HotelModel;
import in.co.hotel.mgt.sys.util.DataUtility;
import in.co.hotel.mgt.sys.util.DataValidator;
import in.co.hotel.mgt.sys.util.PropertyReader;
import in.co.hotel.mgt.sys.util.ServletUtility;

/**
 * Servlet implementation class BookHotelCtl
 */
@WebServlet(name="BookHotelCtl",urlPatterns={"/ctl/BookHotelCtl"})
public class BookHotelCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
       
	private static Logger log=Logger.getLogger(BookHotelCtl.class);
	/**
	 * Validate input Data Entered By User
	 * 
	 * @param request
	 * @return
	 */
	@Override
    protected boolean validate(HttpServletRequest request) {
		log.debug("BookHotelCtl validate method start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("toDate"))) {
            request.setAttribute("toDate",
                    PropertyReader.getValue("error.require", "To Date"));
            pass = false;
        }
        
        if (DataValidator.isNull(request.getParameter("fromDate"))) {
            request.setAttribute("fromDate",
                    PropertyReader.getValue("error.require", "From Date"));
            pass = false;
        }
        
        if (DataValidator.isNull(request.getParameter("person"))) {
            request.setAttribute("person",
                    PropertyReader.getValue("error.require", "No Of Person"));
            pass = false;
        }
        

        log.debug("BookHotelCtl validate method end");
        return pass;
    }

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("BookHotelCtl populateBean method start");
		BookHotelBean bean=new BookHotelBean();
		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setToDate(DataUtility.getString(request.getParameter("toDate")));
		bean.setFromDate(DataUtility.getString(request.getParameter("fromDate")));
		bean.setNoOfPerson(DataUtility.getString(request.getParameter("person")));
		bean.setHotelId(DataUtility.getLong(request.getParameter("htId")));
		populateDTO(bean, request);
		log.debug("BookHotelCtl populateBean method end");
		return bean;
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("BookHotelCtl doGet method start"); 
		String op = DataUtility.getString(request.getParameter("operation"));
			
		   BookHotelModel model = new BookHotelModel();
			long id = DataUtility.getLong(request.getParameter("id"));
			long HHId = DataUtility.getLong(request.getParameter("hId"));
			ServletUtility.setOpration("Add", request);
			if (id > 0 || op != null) {
				System.out.println("in id > 0  condition");
				BookHotelBean bean;
				try {
					bean = model.findByPK(id);
					ServletUtility.setOpration("Edit", request);
					ServletUtility.setBean(bean, request);
				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);
					return;
				}
			}
			request.setAttribute("hihd", HHId);
			ServletUtility.forward(getView(), request, response);
			log.debug("BookHotelCtl doGet method end");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 log.debug("BookHotelCtl doPost method start");
			String op=DataUtility.getString(request.getParameter("operation"));
			BookHotelModel model=new BookHotelModel();
			long id=DataUtility.getLong(request.getParameter("id"));
			if(OP_SAVE.equalsIgnoreCase(op)){
				
				BookHotelBean bean=(BookHotelBean)populateBean(request);
				HttpSession session =request.getSession();
				UserBean uBean=(UserBean)session.getAttribute("user");
				bean.setUserId(uBean.getId());
				bean.setUserName(uBean.getFirstName()+" "+uBean.getLastName());
					try {
						if(id>0){
							
						model.update(bean);
						ServletUtility.setOpration("Edit", request);
						ServletUtility.setSuccessMessage("Hotel Booked successfully Updated", request);
		                ServletUtility.setBean(bean, request);

						}else {
							long pk=model.add(bean);
							//bean.setId(id);
							ServletUtility.setSuccessMessage("Hotel Booked  successfully Saved", request);
							ServletUtility.forward(getView(), request, response);
						}
		              
					} catch (ApplicationException e) {
						e.printStackTrace();
						ServletUtility.forward(HMSView.ERROR_VIEW, request, response);
						return;
					
				} catch (DuplicateRecordException e) {
					ServletUtility.setBean(bean, request);
					ServletUtility.setErrorMessage("Hotel is already exists",
							request);
				}
				
			}else if (OP_DELETE.equalsIgnoreCase(op)) {
			BookHotelBean bean=	(BookHotelBean)populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(HMSView.BOOK_HOTEL_LIST_CTL, request, response);
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				e.printStackTrace();
			}
			}else if (OP_CANCEL.equalsIgnoreCase(op)) {
				ServletUtility.redirect(HMSView.BOOK_HOTEL_LIST_CTL, request, response);
				return;
		}else if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(HMSView.BOOK_HOTEL_CTL, request, response);
			return;
	}
					
			
			ServletUtility.forward(getView(), request, response);
			 log.debug("BookHotelCtl doPost method end");
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return HMSView.BOOK_HOTEL_VIEW;
	}

}
