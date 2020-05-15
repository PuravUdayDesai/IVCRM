package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.ticket.TicketAccessListInsert;
import ivgroup.master.database.dto.ticket.TicketAccessListSelect;
import ivgroup.master.database.dto.ticket.TicketDetailsSelect;
import ivgroup.master.database.dto.ticket.TicketFollowupDateInsert;
import ivgroup.master.database.dto.ticket.TicketFollowupDateSelect;
import ivgroup.master.database.dto.ticket.TicketInsert;
import ivgroup.master.database.dto.ticket.TicketStatusInsert;

public interface TicketDAO 
{
	public List<TicketDetailsSelect>		selectTicketByFilter(String sql)																throws SQLException,ClassNotFoundException;
	public List<TicketDetailsSelect>		selectTicketDetailsByCompanyExecutiveId(Long companyExecutiveId)								throws SQLException,ClassNotFoundException;
	public Long								selectTicketIdByEnquiryAndProductId(Long enquiryId,Long productId)								throws SQLException,ClassNotFoundException;
	public List<Long>						selectTicketIdByEnquiryId(Long enquiryId)														throws SQLException,ClassNotFoundException;
	public List<TicketFollowupDateSelect> 	selectTicketFollowupDates(Long ticketId)														throws SQLException,ClassNotFoundException;
	public List<TicketAccessListSelect>		selectTicketAccessListByTicketId(Long ticketId)													throws SQLException,ClassNotFoundException;
	public Long 							checkCompanyExecutiveTicketAccessDependency(Long ticketId,Long companyExecutiveId)				throws SQLException,ClassNotFoundException;
	public Long 							addTicket(TicketInsert ti)																		throws SQLException,ClassNotFoundException;
	public Boolean 							addTicketStatus(TicketStatusInsert ti)															throws SQLException,ClassNotFoundException;
	public Boolean 							addFollowupDateInsert(TicketFollowupDateInsert ti)												throws SQLException,ClassNotFoundException;
	public Boolean 							addTicketAccessList(TicketAccessListInsert ti)													throws SQLException,ClassNotFoundException;
	public Boolean 							updateEnquiryRemarks(Connection c,Long ticketId,String enquiryRemarks)							throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketRemarks(Connection c,Long ticketId,String ticketRemarks)							throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketLastEditOn(Connection c,Long ticketId,Timestamp lastEditOn)							throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketLastEditBy(Connection c,Long ticketId,Long lastEditBy)								throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketStartDateAndTime(Connection c,Long ticketId,Timestamp startDateAndTime)				throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketDeadlineDateAndTime(Connection c,Long ticketId,Timestamp deadlineDateAndTime)		throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketType(Connection c,Long ticketId,Long ticketType)									throws SQLException,ClassNotFoundException;
	public Boolean 							updateTicketPriority(Connection c,Long ticketId,Integer ticketPriority)							throws SQLException,ClassNotFoundException;
	public Long 							checkTicketCompanyExecutiveAccess(Long ticketId,Long companyExecutiveId)						throws SQLException,ClassNotFoundException;
	public Boolean 							deleteMainTicket(Long ticketId)																	throws SQLException,ClassNotFoundException;
	public Boolean 							deleteTicketAccessList(Long ticketAccessListId)													throws SQLException,ClassNotFoundException;
	public Boolean 							deleteTicketFollowupDate(Long ticketFollowupDateId)												throws SQLException,ClassNotFoundException;
	public Timestamp 						getStartDateAndTimeOfTicket(Long ticketId)														throws SQLException,ClassNotFoundException;
	public Timestamp 						getDeadlineDateAndTimeOfTicket(Long ticketId)													throws SQLException,ClassNotFoundException;
}
