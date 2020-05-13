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
import ivgroup.master.database.dao.impl.CompanyExecutiveDAOImpl;
import ivgroup.master.database.dao.impl.TicketDAOImpl;
import ivgroup.master.database.dto.ticket.TicketAccessListInsert;
import ivgroup.master.database.dto.ticket.TicketDetailsSelect;
import ivgroup.master.database.dto.ticket.TicketFilterSelect;
import ivgroup.master.database.dto.ticket.TicketFollowupDateInsert;
import ivgroup.master.database.dto.ticket.TicketFollowupDateSelect;
import ivgroup.master.database.dto.ticket.TicketInsert;
import ivgroup.master.database.dto.ticket.TicketStatusInsert;
import ivgroup.master.database.dto.ticket.TicketUpdate;

@Service
public class TicketBusinessLogic
{
	@Autowired
	TicketDAOImpl tdi;
	
	@Autowired
	CompanyExecutiveDAOImpl edi;

	public ResponseEntity<Long> addTicket(TicketInsert ti)
	{
		Long ticketId=null;
		if(ti==null)
		{
			return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
		}
		try {
			if(ti.getStartDateAndTime().after(ti.getDeadlineDateAndTime()))
			{
				return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
			}
			ticketId=tdi.addTicket(ti);
			if(ticketId==null)
			{
				Boolean rsDelete=tdi.deleteMainTicket(ticketId);
				if(!rsDelete)
				{
					return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
				}
				return new ResponseEntity<Long>(ticketId,HttpStatus.BAD_REQUEST);
			}

		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Long>(ticketId,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Long>(ticketId,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Long>(ticketId,HttpStatus.CREATED);
	}

	public ResponseEntity<Void> addTicketStatus(TicketStatusInsert ti)
	{
		if(ti==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ti.getTicketId(), ti.getCreatedBy());
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rsMain=false;
		try {
			rsMain=tdi.addTicketStatus(ti);
			Connection c=ConnectionProvider.getConnection();
			ResponseEntity<Void> rsMainRes=updateTicketLastEditOn(c,ti.getTicketId(),ti.getCreatedOn());
			ResponseEntity<Void> rsMainRes2=updateTicketLastEditBy(c,ti.getTicketId(),ti.getCreatedBy());
			if(rsMainRes.getStatusCode()!=HttpStatus.OK||rsMainRes2.getStatusCode()!=HttpStatus.OK)
			{
				c.close();
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			c.close();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<Void> addFollowupDateInsert(TicketFollowupDateInsert ti) 
	{
		if(ti==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			if(	ti.getFollowupDate().before(tdi.getStartDateAndTimeOfTicket(ti.getTicketId()))||
				ti.getFollowupDate().after(tdi.getDeadlineDateAndTimeOfTicket(ti.getTicketId())))
			{
				
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ti.getTicketId(), ti.getLastEditBy());
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rsMain=false;
		try {
			rsMain=tdi.addFollowupDateInsert(ti);
			Connection c=ConnectionProvider.getConnection();
			ResponseEntity<Void> rsMainRes=updateTicketLastEditOn(c,ti.getTicketId(),ti.getLastEditOn());
			ResponseEntity<Void> rsMainRes2=updateTicketLastEditBy(c,ti.getTicketId(),ti.getLastEditBy());
			if(rsMainRes.getStatusCode()!=HttpStatus.OK||rsMainRes2.getStatusCode()!=HttpStatus.OK)
			{
				c.close();
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			c.close();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<Void> addTicketAccessList(TicketAccessListInsert ti) 
	{
		if(ti==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ti.getTicketId(), ti.getLastEditBy());
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rsMain=false;
		try {
			rsMain=tdi.addTicketAccessList(ti);
			Connection c=ConnectionProvider.getConnection();
			ResponseEntity<Void> rsMainRes=updateTicketLastEditOn(c,ti.getTicketId(),ti.getAccessApplicationTime());
			ResponseEntity<Void> rsMainRes2=updateTicketLastEditBy(c,ti.getTicketId(),ti.getLastEditBy());
			if(rsMainRes.getStatusCode()!=HttpStatus.OK||rsMainRes2.getStatusCode()!=HttpStatus.OK)
			{
				c.close();
			
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			c.close();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<Void> deleteMainTicket(Long ticketId,Long companyExecutiveId)
	{
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ticketId,companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=tdi.deleteMainTicket(ticketId);
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

	public ResponseEntity<Void> deleteTicketAccessList(Long ticketAccessListId,Long companyExecutiveId) 
	{
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ticketAccessListId,companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=tdi.deleteTicketAccessList(ticketAccessListId);
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

	public ResponseEntity<Void> deleteTicketFollowupDate(Long ticketFollowupDateId,Long companyExecutiveId)
	{
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ticketFollowupDateId,companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=tdi.deleteTicketFollowupDate(ticketFollowupDateId);
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
	
	private ResponseEntity<Void> updateTicketRemarks(Connection c, Long ticketId, String ticketRemarks)
	{
		Boolean rs=false;
		try {
			 rs=tdi.updateTicketRemarks(c, ticketId, ticketRemarks);
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

	private ResponseEntity<Void> updateTicketStartDateAndTime(Connection c, Long ticketId, Timestamp startDateAndTime)
	{
		Boolean rs=false;
		try {
			 rs=tdi.updateTicketStartDateAndTime(c, ticketId, startDateAndTime);
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

	private ResponseEntity<Void> updateTicketDeadlineDateAndTime(Connection c, Long ticketId, Timestamp deadlineDateAndTime)
	{
		Boolean rs=false;
		try {
			 rs=tdi.updateTicketDeadlineDateAndTime(c, ticketId, deadlineDateAndTime);
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

	private ResponseEntity<Void> updateTicketPriority(Connection c, Long ticketId, Integer ticketPriority)
	{
		Boolean rs=false;
		try {
			 rs=tdi.updateTicketPriority(c, ticketId, ticketPriority);
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

	private ResponseEntity<Void> updateTicketLastEditOn(Connection c, Long ticketId, Timestamp lastEditOn)
	{
		Boolean rs=false;
		try {
			 rs=tdi.updateTicketLastEditOn(c, ticketId, lastEditOn);
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

	private ResponseEntity<Void> updateTicketLastEditBy(Connection c, Long ticketId, Long lastEditBy)
	{
		Boolean rs=false;
		try {
			 rs=tdi.updateTicketLastEditBy(c, ticketId, lastEditBy);
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
	
	public ResponseEntity<Void> updateEnquiryRemarks(Long ticketId, String enquiryRemarks,Long companyExecutiveId)
	{
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ticketId,companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			Connection c=ConnectionProvider.getConnection();
			 rs=tdi.updateEnquiryRemarks(c, ticketId, enquiryRemarks);
			 c.close();
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

	public ResponseEntity<Void> updateTicketType(Long ticketId, Long ticketType,Long companyExecutiveId)
	{
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ticketId,companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(count==0)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			Connection c=ConnectionProvider.getConnection();
			 rs=tdi.updateTicketType(c, ticketId, ticketType);
			 c.close();
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

	public ResponseEntity<Void> updateTicketFields(Long ticketId,TicketUpdate tu)
	{
		if(tu==null||ticketId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST); 
		}
		Long count=null;
		try {
			count=tdi.checkTicketCompanyExecutiveAccess(ticketId,tu.getLastEditBy());
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
		if(tu.getTicketRemarks()!=null) {
			rs=updateTicketRemarks(c, ticketId, tu.getTicketRemarks());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(tu.getStartDateAndTime()!=null) {
			if(tu.getDeadlineDateAndTime()!=null) {
			if(tu.getStartDateAndTime().after(tu.getDeadlineDateAndTime()))
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			}
			if(tu.getDeadlineDateAndTime()==null)
			{
				try {
					if(tu.getStartDateAndTime().after(tdi.getDeadlineDateAndTimeOfTicket(ticketId)))
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
				} catch (ClassNotFoundException e) {
					return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
				} catch (SQLException e) {
					return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}
			try {
				List<TicketFollowupDateSelect> ltd=tdi.selectTicketFollowupDates(ticketId);
				ListIterator<TicketFollowupDateSelect> li=ltd.listIterator();
				while(li.hasNext())
				{
					if(li.next().getFollowupDate().before(tu.getStartDateAndTime()))
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
				}
			} catch (ClassNotFoundException e) {
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException e) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			
			rs=updateTicketStartDateAndTime(c, ticketId, tu.getStartDateAndTime());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;				
		if(tu.getDeadlineDateAndTime()!=null) {
			if(tu.getStartDateAndTime()!=null) 
			{
				if(tu.getStartDateAndTime().after(tu.getDeadlineDateAndTime()))
				{
					return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
				}
			}
			if(tu.getStartDateAndTime()==null)
			{
				try {
					if(tdi.getStartDateAndTimeOfTicket(ticketId).after(tu.getDeadlineDateAndTime()))
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
				} catch (ClassNotFoundException e) {
					return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
				} catch (SQLException e) {
					return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}
			try {
				List<TicketFollowupDateSelect> ltd=tdi.selectTicketFollowupDates(ticketId);
				ListIterator<TicketFollowupDateSelect> li=ltd.listIterator();
				while(li.hasNext())
				{
					if(li.next().getFollowupDate().after(tu.getDeadlineDateAndTime()))
					{
						return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
					}
				}
			} catch (ClassNotFoundException e) {
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException e) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			rs=updateTicketDeadlineDateAndTime(c, ticketId, tu.getDeadlineDateAndTime());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(tu.getTicketPriority()!=null) {
			rs=updateTicketPriority(c, ticketId, tu.getTicketPriority());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(tu.getLastEditOn()!=null) {
			rs=updateTicketLastEditOn(c, ticketId, tu.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(tu.getLastEditBy()!=null) {
			rs=updateTicketLastEditBy(c, ticketId, tu.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		try {
				c.close();
			}catch (SQLException e) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
	return new ResponseEntity<Void>(HttpStatus.OK); 			
	}
	
	public ResponseEntity<List<TicketDetailsSelect>> selectTicketDetailsByCompanyExecutiveId(Long companyExecutiveId)
	{
		
		List<TicketDetailsSelect> lts=new ArrayList<TicketDetailsSelect>();
		List<TicketDetailsSelect> ltsModified=new ArrayList<TicketDetailsSelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<TicketDetailsSelect>>(ltsModified,HttpStatus.BAD_REQUEST);
		}
		try {
			lts=tdi.selectTicketDetailsByCompanyExecutiveId(companyExecutiveId);
			ListIterator<TicketDetailsSelect> li=lts.listIterator();
		while(li.hasNext())
		{
			TicketDetailsSelect ticket=li.next();
			Long ticketId=ticket.getTicketId();
			List<TicketFollowupDateSelect> followupDates=tdi.selectTicketFollowupDates(ticketId);
			ticket.setFollowupDate(followupDates);
			ltsModified.add(ticket);
		}
		lts.clear();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<TicketDetailsSelect>>(ltsModified,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<TicketDetailsSelect>>(ltsModified,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ltsModified.isEmpty())
		{
			return new ResponseEntity<List<TicketDetailsSelect>>(ltsModified,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<TicketDetailsSelect>>(ltsModified,HttpStatus.OK);
	
	}
	
	
	public ResponseEntity<List<TicketDetailsSelect>> selectTicketByFilter(TicketFilterSelect tfs)
	{
		StringBuffer stb=new StringBuffer(
				"SELECT\r\n" + 
				"		\"ticket\".\"MainTicket\".\"TicketId\",\r\n" + 
				"		\"ticket\".\"MainTicket\".\"EnquiryId\",\r\n" + 
				"		\"ticket\".\"TicketAccessList\".\"TicketAccessListId\",\r\n" + 
				"		\"ticket\".\"TicketAccessList\".\"CompanyExecutiveId\",\r\n" + 
				"		\"ticket\".\"TicketAccessList\".\"CompanyExecutiveName\",\r\n" + 
				"		\"ticket\".\"MainTicket\".\"EnquiryRemarks\",\r\n" + 
				"		\"ticket\".\"MainTicket\".\"TicketRemarks\",\r\n" + 
				"		\"ticket\".\"TicketDateAndTimelines\".\"StartDateAndTime\",\r\n" + 
				"		\"ticket\".\"TicketDateAndTimelines\".\"DeadlineDateAndTime\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"ProductId\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"ProductName\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"TicketType\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"TicketTypeName\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"TicketPriority\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"TicketPriorityName\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"CompanyId\",\r\n" + 
				"		\"ticket\".\"TicketMetaData\".\"CompanyName\",\r\n" + 
				"		(SELECT \"StatusId\" FROM \"ticket\".\"TicketStatus\" ORDER BY \"LastEditOn\" DESC LIMIT 1),\r\n" + 
				"		(SELECT \"StatusName\" FROM \"ticket\".\"TicketStatus\" ORDER BY \"LastEditOn\" DESC LIMIT 1),\r\n" + 
				"		\"ticket\".\"MainTicket\".\"CreatedBy\",\r\n" + 
				"		\"ticket\".\"MainTicket\".\"CreatedOn\",\r\n" + 
				"		\"ticket\".\"MainTicket\".\"LastEditBy\",\r\n" + 
				"		\"ticket\".\"MainTicket\".\"LastEditOn\"\r\n" + 
				"FROM \"ticket\".\"MainTicket\"\r\n" + 
				"	JOIN \"ticket\".\"TicketAccessList\" \r\n" + 
				"			ON \"ticket\".\"TicketAccessList\".\"TicketId\"=\"ticket\".\"MainTicket\".\"TicketId\"\r\n" + 
				"	JOIN \"ticket\".\"TicketDateAndTimelines\"\r\n" + 
				"			ON \"ticket\".\"TicketDateAndTimelines\".\"TicketId\"=\"ticket\".\"MainTicket\".\"TicketId\"\r\n" + 
				"	JOIN \"ticket\".\"TicketMetaData\"\r\n" + 
				"			ON \"ticket\".\"TicketMetaData\".\"TicketId\"=\"ticket\".\"MainTicket\".\"TicketId\"\r\n" + 
				"	JOIN \"ticket\".\"TicketStatus\"\r\n" + 
				"			ON \"ticket\".\"TicketStatus\".\"TicketId\"=\"ticket\".\"MainTicket\".\"TicketId\"\r\n" + 
				"WHERE \"ticket\".\"TicketAccessList\".\"CompanyExecutiveId\"=139\r\n" + 
				"AND \"ticket\".\"MainTicket\".\"MarkForDelete\"=false\r\n" + 
				"AND \"ticket\".\"TicketAccessList\".\"MarkForDelete\"=false");
		
		if(tfs.getCompanyId()!=null)
		{
		if(!tfs.getCompanyId().isEmpty())
		{
			stb.append("AND \"ticket\".\"TicketMetaData\".\"CompanyId\" IN(");
			ListIterator<Long> li=tfs.getCompanyId().listIterator();
			while(li.hasNext())
			{
				stb.append(li.next()+" ,");
			}
			stb.append("\b)\n");
		}
		}
		if(tfs.getEnquiryId()!=null)
		{
		if(!tfs.getEnquiryId().isEmpty())
		{
			stb.append("AND \"ticket\".\"MainTicket\".\"EnquiryId\" IN(");
			ListIterator<Long> li=tfs.getEnquiryId().listIterator();
			while(li.hasNext())
			{
				stb.append(li.next()+" ,");
			}
			stb.append("\b)\n");
			
		}
		}
		if(tfs.getPriorityId()!=null)
		{
		if(!tfs.getPriorityId().isEmpty())
		{
			stb.append("AND \"ticket\".\"TicketMetaData\".\"TicketPriority\" IN(");
			ListIterator<Integer> li=tfs.getPriorityId().listIterator();
			while(li.hasNext())
			{
				stb.append(li.next()+" ,");
			}
			stb.append("\b)\n");
		}
		}
		if(tfs.getProductId()!=null)
		{
		if(!tfs.getProductId().isEmpty())
		{
			stb.append("AND \"ticket\".\"TicketMetaData\".\"ProductId\" IN(");
			ListIterator<Long> li=tfs.getProductId().listIterator();
			while(li.hasNext())
			{
				stb.append(li.next()+" ,");
			}
			stb.append("\b)\n");
		}
		}
		if(tfs.getStatusId()!=null)
		{
		if(!tfs.getStatusId().isEmpty())
		{
			stb.append("AND (SELECT \"StatusId\" FROM \"ticket\".\"TicketStatus\" ORDER BY \"LastEditOn\" DESC LIMIT 1) IN(");
			ListIterator<Long> li=tfs.getStatusId().listIterator();
			while(li.hasNext())
			{
				stb.append(li.next()+" ,");
			}
			stb.append("\b)\n");
		}
		}
		if(tfs.getTicketType()!=null)
		{
		if(!tfs.getTicketType().isEmpty())
		{
			stb.append("AND \"ticket\".\"TicketMetaData\".\"TicketType\" IN(");
			ListIterator<Long> li=tfs.getProductId().listIterator();
			while(li.hasNext())
			{
				stb.append(li.next()+" ,");
			}
			stb.append("\b)\n");
		}
		}
		System.out.println(stb.toString());
		return new ResponseEntity<List<TicketDetailsSelect>>(new ArrayList<TicketDetailsSelect>(),HttpStatus.OK);
	}
	
	
}
