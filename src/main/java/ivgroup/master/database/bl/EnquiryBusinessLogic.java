package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.CRMAccessListDAOImpl;
import ivgroup.master.database.dao.impl.CompanyExecutiveDAOImpl;
import ivgroup.master.database.dao.impl.EnquiryDAOImpl;
import ivgroup.master.database.dao.impl.TicketDAOImpl;
import ivgroup.master.database.dto.enquiry.EnquiryAccessListInsert;
import ivgroup.master.database.dto.enquiry.EnquiryAccessListSelect;
import ivgroup.master.database.dto.enquiry.EnquiryDetailsForNewProductTicketInsert;
import ivgroup.master.database.dto.enquiry.EnquiryInsert;
import ivgroup.master.database.dto.enquiry.EnquiryNonAddedProductSelect;
import ivgroup.master.database.dto.enquiry.EnquiryProductInsert;
import ivgroup.master.database.dto.enquiry.EnquiryProductSelect;
import ivgroup.master.database.dto.enquiry.EnquirySelect;
import ivgroup.master.database.dto.enquiry.EnquiryUpdate;
import ivgroup.master.database.dto.enquiry.NonAccessibleExecutiveListSelect;
import ivgroup.master.database.dto.enquiry.SelectEnquiryDetailsByProductListId;
import ivgroup.master.database.dto.ticket.TicketInsert;

@Service
public class EnquiryBusinessLogic
{
	@Autowired
	EnquiryDAOImpl edi;
	
	@Autowired
	TicketDAOImpl tdi;
	
	@Autowired
	TicketBusinessLogic tbl;
	
	@Autowired
	CRMAccessListDAOImpl cadi;
	
	@Autowired
	CompanyExecutiveDAOImpl cedi;
	
	public ResponseEntity<Void> addEnquiry(EnquiryInsert ei)
	{
		if(ei==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		if(ei.getStartDateAndTime().after(ei.getDeadlineDateAndTime()))
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long enquiryId=null;
		try {
			enquiryId=edi.addEnquiry(ei);
			Long check=cadi.checkExecutiveOwnerFlag(ei.getCreatedBy());
			if(check==0)
			{
				Long ownerId=cedi.getOwnerIdByCompanyExecutiveId(ei.getCreatedBy());
				Boolean rsOwnerAccess=edi.addEnquiryAccessList(new EnquiryAccessListInsert(
																							enquiryId,
																							ownerId,
																							ei.getCreatedOn()));
				if(!rsOwnerAccess)
				{
					Boolean rsDelete=edi.deleteEnquiry(enquiryId);
					if(!rsDelete)
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
			}
			ListIterator<Long> li=ei.getProductId().listIterator();
			if(enquiryId==null)
			{
				Boolean rsDelete=edi.deleteEnquiry(enquiryId);
				if(!rsDelete)
				{
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			while(li.hasNext())
			{
				Long productId=li.next();
				Boolean rsMain=false;
				rsMain=edi.addEnquiryProduct(enquiryId, productId);
				if(!rsMain)
				{
					Boolean rsDelete=edi.deleteEnquiry(enquiryId);
					if(!rsDelete)
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
					
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
				ResponseEntity<Long> ticketId=null;
				ticketId=tbl.addTicket(new TicketInsert(
						enquiryId,
						ei.getEnquiryRemarks(),
						"#Ticket("+ei.getCreatedOn()+") Personal Ticket Remarks",
						ei.getStatusId(),
						ei.getStartDateAndTime(),
						ei.getDeadlineDateAndTime(),
						productId,
						ei.getEnquiryType(),
						ei.getPrioirty(),
						ei.getCompanyId(),
						ei.getCreatedOn(),
						ei.getCreatedBy()
						));
				if(ticketId==null)
				{
					Boolean rsDelete=edi.deleteEnquiry(enquiryId);
					if(!rsDelete)
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
				
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
				if(ticketId.getStatusCode()!=HttpStatus.CREATED)
				{
					Boolean rsDelete=edi.deleteEnquiry(enquiryId);
					if(!rsDelete)
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
				
					return new ResponseEntity<Void>(ticketId.getStatusCode());
				}
				if(ticketId.getStatusCode()!=HttpStatus.CREATED)
				{
					return new ResponseEntity<Void>(ticketId.getStatusCode()); 
				}
			}
			Boolean rsMain=edi.addEnquiryAccessList(new EnquiryAccessListInsert(
					enquiryId,
					ei.getCreatedBy(),
					ei.getCreatedOn()));
			if(!rsMain)
			{
				Boolean rsDelete=edi.deleteEnquiry(enquiryId);
				if(!rsDelete)
				{
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}	
			}
			
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<Long> addEnquiryProduct(EnquiryProductInsert epi)
	{		
		Boolean rsMain=false;
		Long ticketId=null;
		if(epi==null)
		{
			return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
		}
		try {
			
			Long count=edi.checkCompanyExecutiveByEnquiryId(epi.getEnquiryId(), epi.getCreatedBy());
			if(count==0)
			{
				return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
			}
			
			ListIterator<EnquiryNonAddedProductSelect> lep=null;
			lep=edi.selectEnquiryNonAddedProducts(epi.getEnquiryId()).listIterator();
			Boolean checkForProductDependency=false;
			while(lep.hasNext())
			{
				if(epi.getProductId()==lep.next().getId())
				{
					checkForProductDependency=true;
					break;
				}
				else {
					checkForProductDependency=false;
				}
			}
			if(!checkForProductDependency)
			{
				return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
			}
			
			rsMain=edi.addEnquiryProduct(epi.getEnquiryId(), epi.getProductId());
			EnquiryDetailsForNewProductTicketInsert eData=edi.selectEnquiryForNewProductTicketInsert(epi.getEnquiryId());
			if(eData==null)
			{
				return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
			}
			
			ResponseEntity<Long> rsTicket=tbl.addTicket(new TicketInsert(
						epi.getEnquiryId(),
						eData.getEnquiryRemarks(),
						epi.getTicketRemarks(),
						epi.getStatusId(),
						eData.getStartDateAndTime(),
						eData.getDeadlineDateAndTime(),
						epi.getProductId(),
						eData.getEnquiryType(),
						epi.getPriorityId(),
						eData.getCompanyId(),
						epi.getCreatedOn(),
						epi.getCreatedBy()
						));
			ticketId=rsTicket.getBody();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Long>(ticketId,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println("Enquiry Product: "+e);
			return new ResponseEntity<Long>(ticketId,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain||ticketId==null)
		{
			return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Long>(ticketId,HttpStatus.CREATED);
	}
	
	public ResponseEntity<Void> deleteEnquiryProduct(Long productId,Long companyExecutiveId)  
	{
		Boolean rs=false;
		try {
			
			 SelectEnquiryDetailsByProductListId sed=edi.selectEnquiryAndProductIdByProductListId(productId);
			 if(sed==null)
			 {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			 }
			 Long count=edi.checkCompanyExecutiveByEnquiryId(sed.getEnquiryId(),companyExecutiveId);
				if(count==0)
				{
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
			 Long ticketId=tdi.selectTicketIdByEnquiryAndProductId(sed.getEnquiryId(), sed.getProductId());
			 if(ticketId==null)
			 {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			 }
			 Boolean rsMain2=false;
			 rsMain2=tdi.deleteMainTicket(ticketId);
			 if(!rsMain2)
			 {
				 return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			 }
			 rs=edi.deleteEnquiryProduct(productId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> deleteEnquiry(Long enquiryId,Long companyExecutiveId)  
	{
		Boolean rs=false;
		try {
			 Long count=edi.checkCompanyExecutiveByEnquiryId(enquiryId,companyExecutiveId);
				if(count==0)
				{
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
			 rs=edi.deleteEnquiry(enquiryId);
			 ListIterator<Long> li=tdi.selectTicketIdByEnquiryId(enquiryId).listIterator();
			 while(li.hasNext())
			 {
				 Boolean rsDelete=false;
				 rsDelete=tdi.deleteMainTicket(li.next());
				 if(!rsDelete)
				 {
					
					 return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				 }
			 }
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryClient(Connection c, Long enquiryId, Long clientId)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryClient(c, enquiryId, clientId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
			 
	}

	private ResponseEntity<Void> updateEnquiryCountry(Connection c, Long enquiryId, Long countryId) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryCountry(c, enquiryId, countryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryState(Connection c, Long enquiryId, Long stateId) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryState(c, enquiryId, stateId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryCity(Connection c, Long enquiryId, Long cityId)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryCity(c, enquiryId, cityId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryArea(Connection c, Long enquiryId, Long areaId)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryArea(c, enquiryId, areaId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryAddressLine1(Connection c, Long enquiryId, String addressLine1)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryAddressLine1(c, enquiryId, addressLine1);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryAddressLine2(Connection c, Long enquiryId, String addressLine2)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryAddressLine2(c, enquiryId, addressLine2);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryAddressLine3(Connection c, Long enquiryId, String addressLine3) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryAddressLine3(c, enquiryId, addressLine3);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryLatitude(Connection c, Long enquiryId, String latitude)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryLatitude(c, enquiryId, latitude);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryLongitude(Connection c, Long enquiryId, String longitude) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryLongitude(c, enquiryId, longitude);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryPincode(Connection c, Long enquiryId, String pincode) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryPincode(c, enquiryId, pincode);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateEnquiryEnquiryRemarks(Connection c, Long enquiryId, String enquiryRemarks) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryEnquiryRemarks(c, enquiryId, enquiryRemarks);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryEnquiryType(Connection c, Long enquiryId, Long enquiryType)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryEnquiryType(c, enquiryId, enquiryType);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryLastEditBy(Connection c, Long enquiryId, Long lastEditBy)
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryLastEditBy(c, enquiryId, lastEditBy);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryLastEditOn(Connection c, Long enquiryId, Timestamp lastEditOn) 
	{
		Boolean rs=false;
		try {
			 rs=edi.updateEnquiryLastEditOn(c, enquiryId, lastEditOn);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
		
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> updateEnquiryFields(Long enquiryId,EnquiryUpdate eu)
	{
		 Long count;
		try {
			count = edi.checkCompanyExecutiveByEnquiryId(enquiryId,eu.getLastEditBy());
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
			if(count==0)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
		Connection c=null;
		try {
			 c=ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs=null;
		Boolean wentIn=false;
		if(eu.getClientId()!=null) {
			rs=updateEnquiryClient(c, enquiryId, eu.getClientId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getCountryId()!=null) {
			rs=updateEnquiryCountry(c, enquiryId,eu.getCountryId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(eu.getStateId()!=null) {
			rs=updateEnquiryState(c, enquiryId,eu.getStateId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;			
		if(eu.getCityId()!=null) {
			rs=updateEnquiryCity(c, enquiryId,eu.getCityId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(eu.getAreaId()!=null) {
			rs=updateEnquiryArea(c, enquiryId,eu.getAreaId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;	
		if(eu.getAddressLine1()!=null) {
			rs=updateEnquiryAddressLine1(c, enquiryId,eu.getAddressLine1());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getAddressLine2()!=null) {
			rs=updateEnquiryAddressLine2(c, enquiryId,eu.getAddressLine2());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getAddressLine3()!=null) {
			rs=updateEnquiryAddressLine3(c, enquiryId,eu.getAddressLine3());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getLatitude()!=null) {
			rs=updateEnquiryLatitude(c, enquiryId,eu.getLatitude());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getLongitude()!=null) {
			rs=updateEnquiryLongitude(c, enquiryId,eu.getLongitude());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getPincode()!=null) {
			rs=updateEnquiryPincode(c, enquiryId,eu.getPincode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;						
		if(eu.getEnquiryRemarks()!=null) {
			rs=updateEnquiryEnquiryRemarks(c, enquiryId,eu.getEnquiryRemarks());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;	
		if(eu.getEnquiryType()!=null) {
			rs=updateEnquiryEnquiryType(c, enquiryId,eu.getEnquiryType());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(eu.getLastEditBy()!=null) {
			rs=updateEnquiryLastEditBy(c, enquiryId,eu.getLastEditBy());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
		if(eu.getLastEditOn()!=null) {
			rs=updateEnquiryLastEditOn(c, enquiryId,eu.getLastEditOn());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;	
		try {
		if(eu.getEnquiryRemarks()!=null)
		{
			 ListIterator<Long> li;
			
				li = tdi.selectTicketIdByEnquiryId(enquiryId).listIterator();
			
			 while(li.hasNext())
			 {
				 tdi.updateEnquiryRemarks(c, li.next(), eu.getEnquiryRemarks());
			 }
		}
		if(eu.getEnquiryType()!=null)
		{
			 ListIterator<Long> li;
				
				li = tdi.selectTicketIdByEnquiryId(enquiryId).listIterator();
			
			 while(li.hasNext())
			 {
				 tdi.updateTicketType(c, li.next(), eu.getEnquiryType());
			 }
		}
		
		
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	try {
			c.close();
		}catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	return new ResponseEntity<Void>(HttpStatus.OK); 	
	}
	
	public ResponseEntity<Void> addEnquiryAccessList(EnquiryAccessListInsert eai,Long companyExecutiveId)
	{
		Boolean rsMain=false;
		if(eai==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			Long count=edi.checkCompanyExecutiveByEnquiryId(eai.getEnquiryId(),companyExecutiveId);
			if(count==0)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Long check=edi.checkCompanyExecutiveEnquiryAccessDependency(eai.getEnquiryId(), eai.getCompanyExecutiveId());
			if(check!=0)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			rsMain=edi.addEnquiryAccessList(eai);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<List<EnquiryAccessListSelect>> selectEnquiryAccessListByEnquiryId(Long enquiryId)
	{
		List<EnquiryAccessListSelect> lea=new ArrayList<EnquiryAccessListSelect>();
		if(enquiryId==null)
		{
			return new ResponseEntity<List<EnquiryAccessListSelect>>(lea,HttpStatus.BAD_REQUEST);
		}
		try {
			lea=edi.selectEnquiryAccessListByEnquiryId(enquiryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquiryAccessListSelect>>(lea,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<List<EnquiryAccessListSelect>>(lea,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lea.isEmpty())
		{
			return new ResponseEntity<List<EnquiryAccessListSelect>>(lea,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryAccessListSelect>>(lea,HttpStatus.OK);
	}

	public ResponseEntity<Void> deleteEnquiryAccessListExecutive(Long companyExecutiveAccessId,Long enquiryId,Long companyExecutiveId)
	{
		Boolean rsMain=false;
		if(companyExecutiveAccessId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			Long count=edi.checkCompanyExecutiveByEnquiryId(enquiryId,companyExecutiveId);
			if(count==0)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			rsMain=edi.deleteEnquiryAccessListExecutive(companyExecutiveAccessId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquiryNonAddedProductSelect>> selectEnquiryNonAddedProducts(Long enquiryId)
	{
		List<EnquiryNonAddedProductSelect> lps=new ArrayList<EnquiryNonAddedProductSelect>();
		if(enquiryId==null)
		{
			return new ResponseEntity<List<EnquiryNonAddedProductSelect>>(lps,HttpStatus.BAD_REQUEST);
		}
		try {
			lps= edi.selectEnquiryNonAddedProducts(enquiryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquiryNonAddedProductSelect>>(lps,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquiryNonAddedProductSelect>>(lps,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lps.isEmpty())
		{
			return new ResponseEntity<List<EnquiryNonAddedProductSelect>>(lps,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryNonAddedProductSelect>>(lps,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquiryProductSelect>> selectEnquiryProduct(Long enquiryId)
	{
		List<EnquiryProductSelect> lep=new ArrayList<EnquiryProductSelect>();
		try {
			lep=edi.selectEnquiryProduct(enquiryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquiryProductSelect>>(lep,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquiryProductSelect>>(lep,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lep.isEmpty())
		{
			return new ResponseEntity<List<EnquiryProductSelect>>(lep,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryProductSelect>>(lep,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquirySelect>> selectEnquiryByCountry(Long companyExecutiveId, Long countryId)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||countryId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByCountry(companyExecutiveId, countryId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquirySelect>> selectEnquiryByState(Long companyExecutiveId, Long stateId) 
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||stateId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByState(companyExecutiveId, stateId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquirySelect>> selectEnquiryByCity(Long companyExecutiveId, Long cityId)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||cityId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByCity(companyExecutiveId, cityId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquirySelect>> selectEnquiryByArea(Long companyExecutiveId, Long areaId)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||areaId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByArea(companyExecutiveId, areaId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				System.out.println("Area: "+enquiryId);
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquirySelect>> selectEnquiryByCompanyExecutiveId(Long companyExecutiveId)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByCompanyExecutiveId(companyExecutiveId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				System.out.println("Executive: "+enquiryId);
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquirySelect>> selectEnquiryByClient(Long companyExecutiveId, Long clientId)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||clientId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByClient(companyExecutiveId, clientId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquirySelect>> selectEnquiryByProduct(Long companyExecutiveId, Long product)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||product==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByProduct(companyExecutiveId, product);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquirySelect>> selectEnquiryByEnquiryType(Long companyExecutiveId, Long enquiryTypeId)
	{
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		List<EnquirySelect> lesModified=new ArrayList<EnquirySelect>();
		if(companyExecutiveId==null||enquiryTypeId==null)
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.BAD_REQUEST);
		}
		try {
			les=edi.selectEnquiryByEnquiryType(companyExecutiveId, enquiryTypeId);
			ListIterator<EnquirySelect> li=les.listIterator();
			while(li.hasNext())
			{
				EnquirySelect es=li.next();
				Long enquiryId=es.getEnquiryId();
				List<EnquiryProductSelect> lep=edi.selectEnquiryProduct(enquiryId);
				es.setEnquiryProductList(lep);
				lesModified.add(es);
			}
			les.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lesModified.isEmpty())
		{
			return new ResponseEntity<List<EnquirySelect>>(les,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquirySelect>>(lesModified,HttpStatus.OK);
	}
	
	public ResponseEntity<List<NonAccessibleExecutiveListSelect>> selectNonAccessibleExecutivesOfEnquiry(Long enquiryId)
	{
		List<NonAccessibleExecutiveListSelect> ll=new ArrayList<NonAccessibleExecutiveListSelect>();
		if(enquiryId==null)
		{
			return new ResponseEntity<List<NonAccessibleExecutiveListSelect>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=edi.selectNonAccessibleExecutivesOfEnquiry(enquiryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<NonAccessibleExecutiveListSelect>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<NonAccessibleExecutiveListSelect>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<NonAccessibleExecutiveListSelect>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<NonAccessibleExecutiveListSelect>>(ll,HttpStatus.OK);
	}
}
