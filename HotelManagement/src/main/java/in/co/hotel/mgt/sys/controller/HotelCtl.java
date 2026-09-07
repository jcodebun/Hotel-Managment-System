package in.co.hotel.mgt.sys.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.hotel.mgt.sys.bean.BaseBean;
import in.co.hotel.mgt.sys.bean.HotelBean;
import in.co.hotel.mgt.sys.exception.ApplicationException;
import in.co.hotel.mgt.sys.exception.DuplicateRecordException;
import in.co.hotel.mgt.sys.model.HotelModel;
import in.co.hotel.mgt.sys.util.DataUtility;
import in.co.hotel.mgt.sys.util.DataValidator;
import in.co.hotel.mgt.sys.util.PropertyReader;
import in.co.hotel.mgt.sys.util.ServletUtility;

/**
 * Servlet implementation class HotelCtl
 */

@WebServlet(name="HotelCtl",urlPatterns={"/ctl/HotelCtl"})
public class HotelCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
       
	private static Logger log=Logger.getLogger(HotelCtl.class);
	/**
	 * Validate input Data Entered By User
	 * 
	 * @param request
	 * @return
	 */
	@Override
    protected boolean validate(HttpServletRequest request) {
		log.debug("HotelCtl validate method start");
        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("name"))) {
            request.setAttribute("name",
                    PropertyReader.getValue("error.require", "Name"));
            pass = false;
        }
        
        if (DataValidator.isNull(request.getParameter("city"))) {
            request.setAttribute("city",
                    PropertyReader.getValue("error.require", "City"));
            pass = false;
        }
        
        if (DataValidator.isNull(request.getParameter("address"))) {
            request.setAttribute("address",
                    PropertyReader.getValue("error.require", "Address"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("description"))) {
            request.setAttribute("description",
                    PropertyReader.getValue("error.require", "Description"));
            pass = false;
        }
        
        
        if (DataValidator.isNull(request.getParameter("contect"))) {
            request.setAttribute("contect",
                    PropertyReader.getValue("error.require", "Contect"));
            pass = false;
        }
        
        if (DataValidator.isNull(request.getParameter("rating"))) {
            request.setAttribute("rating",
                    PropertyReader.getValue("error.require", "Rating"));
            pass = false;
        }

        log.debug("HotelCtl validate method end");
        return pass;
    }
	
	
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("HotelCtl populateBean method start");
		HotelBean bean=new HotelBean();
		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		
		bean.setCity(DataUtility.getString(request.getParameter("city")));
		bean.setAddress(DataUtility.getString(request.getParameter("address")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));
		bean.setContect(DataUtility.getString(request.getParameter("contect")));
		bean.setRating(DataUtility.getString(request.getParameter("rating")));
		populateDTO(bean, request);
		log.debug("HotelCtl populateBean method end");
		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("HotelCtl doGet method start"); 
		String op = DataUtility.getString(request.getParameter("operation"));
			
		   HotelModel model = new HotelModel();
			long id = DataUtility.getLong(request.getParameter("id"));
			ServletUtility.setOpration("Add", request);
			if (id > 0 || op != null) {
				System.out.println("in id > 0  condition");
				HotelBean bean;
				try {
					bean = model.findByPK(id);
					ServletUtility.setOpration("Edit", request);
					ServletUtility.setBean(bean, request);
				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);
					return;
				}
			}

			ServletUtility.forward(getView(), request, response);
			log.debug("HotelCtl doGet method end");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 log.debug("HotelCtl doPost method start");
			String op=DataUtility.getString(request.getParameter("operation"));
			HotelModel model=new HotelModel();
			long id=DataUtility.getLong(request.getParameter("id"));
			if(OP_SAVE.equalsIgnoreCase(op)){
				
				HotelBean bean=(HotelBean)populateBean(request);
					try {
						if(id>0){
							
						model.update(bean);
						ServletUtility.setOpration("Edit", request);
						ServletUtility.setSuccessMessage("Data is successfully Updated", request);
		                ServletUtility.setBean(bean, request);

						}else {
							long pk=model.add(bean);
							//bean.setId(id);
							ServletUtility.setSuccessMessage("Data is successfully Saved", request);
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
			HotelBean bean=	(HotelBean)populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(HMSView.HOTEL_LIST_CTL, request, response);
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				e.printStackTrace();
			}
			}else if (OP_CANCEL.equalsIgnoreCase(op)) {
				ServletUtility.redirect(HMSView.HOTEL_LIST_CTL, request, response);
				return;
		}else if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(HMSView.HOTEL_CTL, request, response);
			return;
	}
					
			
			ServletUtility.forward(getView(), request, response);
			 log.debug("HotelCtl doPost method end");
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return HMSView.HOTEL_VIEW;
	}

}
