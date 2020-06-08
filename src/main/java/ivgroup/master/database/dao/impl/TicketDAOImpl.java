package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.TicketDAO;
import ivgroup.master.database.dto.scheduler.ScheduerCompanyExecutivePLUpdateInsert;
import ivgroup.master.database.dto.scheduler.SchedulerNotificationInsert;
import ivgroup.master.database.dto.ticket.NonAccessibleExecutiveListSelect;
import ivgroup.master.database.dto.ticket.TicketAccessListInsert;
import ivgroup.master.database.dto.ticket.TicketAccessListSelect;
import ivgroup.master.database.dto.ticket.TicketDetailsSelect;
import ivgroup.master.database.dto.ticket.TicketFollowupDateInsert;
import ivgroup.master.database.dto.ticket.TicketFollowupDateSelect;
import ivgroup.master.database.dto.ticket.TicketInsert;
import ivgroup.master.database.dto.ticket.TicketStatusInsert;
import ivgroup.master.database.dto.ticket.TicketStatusLogSelect;

@Service
public class TicketDAOImpl implements TicketDAO
{
	@Override
	public List<TicketDetailsSelect> selectTicketDetailsByCompanyExecutiveId(Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectTicketDetailsByCompanyExecutiveId\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		List<TicketDetailsSelect> lts=new ArrayList<TicketDetailsSelect>();
		while(rs.next())
		{
			lts.add(new TicketDetailsSelect(
					rs.getLong("TicketId"),
					rs.getLong("EnquiryId"),
					rs.getLong("TicketAccessListId"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("EnquiryRemarks"),
					rs.getString("TicketRemarks"),
					rs.getTimestamp("StartDateAndTime"),
					rs.getTimestamp("DeadlineDateAndTime"),
					rs.getLong("ProductId"),
					rs.getString("ProductName"),
					rs.getLong("TicketType"),
					rs.getString("TicketTypeName"),
					rs.getInt("TicketPriority"),
					rs.getString("TicketPriorityName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("StatusId"),
					rs.getString("StatusName"),
					new ArrayList<TicketFollowupDateSelect>(),
					rs.getLong("CreatedBy"),
					rs.getTimestamp("CreatedOn"),
					rs.getLong("LastEditBy"),
					rs.getTimestamp("LastEditOn")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lts;
	}

	@Override
	public List<TicketFollowupDateSelect> selectTicketFollowupDates(Long ticketId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectTicketFollowupDates\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		List<TicketFollowupDateSelect> ltd=new ArrayList<TicketFollowupDateSelect>();
		while(rs.next())
		{
			ltd.add(new TicketFollowupDateSelect(
					rs.getLong("TicketFollowupDatesId"),
					rs.getLong("TicketId"),
					rs.getTimestamp("FollowupDateAndTime")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ltd;
	}
	
	@Override
	public Long addTicket(TicketInsert ti) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT ticket.\"fn_insertTicket\"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setLong(1, ti.getEnquiryId());
		stmt.setString(2, ti.getEnquiryRemarks());
		stmt.setString(3, ti.getTicketRemarks());
		stmt.setLong(4, ti.getCreatedBy());
		stmt.setTimestamp(5, ti.getCreatedOn());
		stmt.setTimestamp(6, ti.getStartDateAndTime());
		stmt.setTimestamp(7, ti.getDeadlineDateAndTime());
		stmt.setLong(8, ti.getProductId());
		stmt.setLong(9, ti.getTicketType());
		stmt.setInt(10, ti.getTicketPriority());
		stmt.setLong(11, ti.getCompanyId());
		stmt.setLong(12, ti.getStatusId());
		ResultSet rs=stmt.executeQuery();
		Long ticketId=null;
		c.commit();
		if(rs.next())
		{
			ticketId=rs.getLong("fn_insertTicket");
		}
		rs.close();
		stmt.close();
		c.close();
		return ticketId;
	}

	@Override
	public Boolean addTicketStatus(TicketStatusInsert ti) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT ticket.\"fn_insertTicketStatus\"(?,?,?,?);");
		stmt.setLong(1, ti.getTicketId());
		stmt.setLong(2, ti.getStatusId());
		stmt.setLong(3, ti.getCreatedBy());
		stmt.setTimestamp(4, ti.getCreatedOn());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertTicketStatus");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean addFollowupDateInsert(TicketFollowupDateInsert ti) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT ticket.\"fn_insertTicketFollowupDates\"(?, ?);");
		stmt.setLong(1, ti.getTicketId());
		stmt.setTimestamp(2, ti.getFollowupDate());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertTicketFollowupDates");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean addTicketAccessList(TicketAccessListInsert ti) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT ticket.\"fn_insertTicketAccessList\"(?, ?, ?);");
		stmt.setLong(1, ti.getTicketId());
		stmt.setLong(2, ti.getCompanyExecutiveId());
		stmt.setTimestamp(3, ti.getAccessApplicationTime());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertTicketAccessList");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateTicketRemarks(Connection c, Long ticketId, String ticketRemarks)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateMainTicketTicketRemarks\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setString(2, ticketRemarks);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainTicketTicketRemarks");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateTicketStartDateAndTime(Connection c, Long ticketId, Timestamp startDateAndTime)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateTicketDateAndTimelinesStartDateAndTime\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setTimestamp(2, startDateAndTime);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateTicketDateAndTimelinesStartDateAndTime");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateTicketDeadlineDateAndTime(Connection c, Long ticketId, Timestamp deadlineDateAndTime)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateTicketDateAndTimelinesDeadlineDateAndTime\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setTimestamp(2, deadlineDateAndTime);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateTicketDateAndTimelinesDeadlineDateAndTime");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateTicketPriority(Connection c, Long ticketId, Integer ticketPriority)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateTicketMetaDataTicketPriority\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setInt(2, ticketPriority);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateTicketMetaDataTicketPriority");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateTicketLastEditOn(Connection c, Long ticketId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateMainTicketLastEditOn\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainTicketLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateTicketLastEditBy(Connection c, Long ticketId, Long lastEditBy)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateMainTicketLastEditBy\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainTicketLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateEnquiryRemarks(Connection c, Long ticketId, String enquiryRemarks)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateMainTicketEnquiryRemarks\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setString(2, enquiryRemarks);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainTicketEnquiryRemarks");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateTicketType(Connection c, Long ticketId, Long ticketType)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_updateTicketMetaDataTicketType\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setLong(2, ticketType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateTicketMetaDataTicketType");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Long checkTicketCompanyExecutiveAccess(Long ticketId, Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_checkExecutiveTicketAccess\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setLong(2, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		Long count=null;
		c.commit();
		if(rs.next())
		{
			count=rs.getLong("Check");
		}
		rs.close();
		stmt.close();
		c.close();
		return count;
	}
	
	@Override
	public Boolean deleteMainTicket(Long ticketId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_deleteMainTicket\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteMainTicket");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean deleteTicketAccessList(Long ticketAccessListId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_deleteTicketAccessList\"(?);");
		stmt.setLong(1, ticketAccessListId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteTicketAccessList");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean deleteTicketFollowupDate(Long ticketFollowupDateId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"ticket\".\"fn_deleteTicketFollowupDates\"(?);");
		stmt.setLong(1, ticketFollowupDateId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteTicketFollowupDates");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Timestamp getStartDateAndTimeOfTicket(Long ticketId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_getStartDateOfTicket\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		Timestamp startDateAndTime=null;
		c.commit();
		if(rs.next())
		{
			startDateAndTime=rs.getTimestamp("StartDateAndTime");
		}
		rs.close();
		stmt.close();
		c.close();
		return startDateAndTime;
	}

	@Override
	public Timestamp getDeadlineDateAndTimeOfTicket(Long ticketId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_getDeadlineDateOfTicket\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		Timestamp startDateAndTime=null;
		c.commit();
		if(rs.next())
		{
			startDateAndTime=rs.getTimestamp("DeadlineDateAndTime");
		}
		rs.close();
		stmt.close();
		c.close();
		return startDateAndTime;
	}

	@Override
	public List<Long> selectTicketIdByEnquiryId(Long enquiryId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectMainTicketIdByEnquiryId\"(?);");
		stmt.setLong(1, enquiryId);
		List<Long> ll=new ArrayList<Long>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			ll.add(rs.getLong("TicketId"));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public Long selectTicketIdByEnquiryAndProductId(Long enquiryId, Long productId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM ticket.\"fn_selectMainTicketIdByEnquiryAndProductId\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, productId);
		Long l=null;
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			l=rs.getLong("TicketId");
		}
		rs.close();
		stmt.close();
		c.close();
		return l;
	}

	@Override
	public List<TicketDetailsSelect> selectTicketByFilter(String sql)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		Statement stmt=c.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		List<TicketDetailsSelect> lts=new ArrayList<TicketDetailsSelect>();
		while(rs.next())
		{
			lts.add(new TicketDetailsSelect(
					rs.getLong("TicketId"),
					rs.getLong("EnquiryId"),
					rs.getLong("TicketAccessListId"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("EnquiryRemarks"),
					rs.getString("TicketRemarks"),
					rs.getTimestamp("StartDateAndTime"),
					rs.getTimestamp("DeadlineDateAndTime"),
					rs.getLong("ProductId"),
					rs.getString("ProductName"),
					rs.getLong("TicketType"),
					rs.getString("TicketTypeName"),
					rs.getInt("TicketPriority"),
					rs.getString("TicketPriorityName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("StatusId"),
					rs.getString("StatusName"),
					new ArrayList<TicketFollowupDateSelect>(),
					rs.getLong("CreatedBy"),
					rs.getTimestamp("CreatedOn"),
					rs.getLong("LastEditBy"),
					rs.getTimestamp("LastEditOn")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lts;
	}
	
	@Override
	public List<TicketAccessListSelect> selectTicketAccessListByTicketId(Long ticketId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectTicketAccessListByTicketId\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		List<TicketAccessListSelect> lta=new ArrayList<TicketAccessListSelect>();
		while(rs.next())
		{
			lta.add(
					new TicketAccessListSelect(
					rs.getLong("TicketAccessListId"),
					rs.getLong("TicketId"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getBoolean("OwnerFlag"),
					rs.getTimestamp("AccessApplicationTime"))
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return lta;
	}

	@Override
	public Long checkCompanyExecutiveTicketAccessDependency(Long ticketId, Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectCompanyExecutiveTicketAccessDependency\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setLong(2, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		Long check=null;
		if(rs.next())
		{
			check=rs.getLong("Check");
		}
		rs.close();
		stmt.close();
		c.close();
		return check;
	}

	@Override
	public List<TicketStatusLogSelect> selectTicketStatusLogbyTicketId(Long ticketId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectTicketStatusLogOfTicket\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		List<TicketStatusLogSelect> lss=new ArrayList<TicketStatusLogSelect>();
		while(rs.next())
		{
			lss.add(new TicketStatusLogSelect(
					rs.getLong("TicketStatusId"),
					rs.getLong("TicketId"),
					rs.getLong("StatusId"),
					rs.getString("StatusName"),
					rs.getInt("WorkProgress"),
					rs.getString("StatusColorCode"),
					rs.getTimestamp("LastEditOn"),
					rs.getLong("LastEditBy")));
		}
		rs.close();
		stmt.close();
		c.close();
		return lss;
	}

	@Override
	synchronized public List<SchedulerNotificationInsert> selectCurrentFollowupDateExecutiveList(Date currentDate)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"ticket\".\"fn_selectCurrentFollowupDateExecutiveList\"(?);");
		stmt.setDate(1, currentDate);
		List<SchedulerNotificationInsert> ll=new ArrayList<SchedulerNotificationInsert>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			ll.add(new SchedulerNotificationInsert(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("ProductName"),
					rs.getString("ClientName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	synchronized public List<SchedulerNotificationInsert> selectCurrentDeadlineDateExecutiveList(Date currentDate)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM ticket.\"fn_selectCurrentDeadlineDateExecutiveList\"(?);");
		stmt.setDate(1, currentDate);
		List<SchedulerNotificationInsert> ll=new ArrayList<SchedulerNotificationInsert>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			ll.add(new SchedulerNotificationInsert(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("ProductName"),
					rs.getString("ClientName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	synchronized public List<SchedulerNotificationInsert> selectDeadlineDateCrossoverExecutiveList(Date currentDate)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM ticket.\"fn_selectDeadlineCrossoverExecutiveList\"(?);");
		stmt.setDate(1, currentDate);
		List<SchedulerNotificationInsert> ll=new ArrayList<SchedulerNotificationInsert>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			ll.add(new SchedulerNotificationInsert(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("ProductName"),
					rs.getString("ClientName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	synchronized public List<ScheduerCompanyExecutivePLUpdateInsert> selectCompanyExecutivePLUpdates(Date currentDate)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM ticket.\"fn_selectCompanyExecutivePLUpdateList\"(?);");
		stmt.setDate(1, currentDate);
		List<ScheduerCompanyExecutivePLUpdateInsert> ll=new ArrayList<ScheduerCompanyExecutivePLUpdateInsert>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			ll.add(new ScheduerCompanyExecutivePLUpdateInsert(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getInt("CurrentWorkProgress"),
					rs.getInt("ThresholdWorkProgress"),
					rs.getLong("TicketId")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<NonAccessibleExecutiveListSelect> selectNonAccessibleExecutivesOfTicket(Long ticketId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM ticket.\"fn_selectNonExistingCompanyExecutivesInTicket\"(?);");
		stmt.setLong(1, ticketId);
		ResultSet rs=stmt.executeQuery();
		List<NonAccessibleExecutiveListSelect> ll=new ArrayList<NonAccessibleExecutiveListSelect>();
		while(rs.next())
		{
			ll.add(new NonAccessibleExecutiveListSelect(
					rs.getString("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyID")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<NonAccessibleExecutiveListSelect> selectNonAccessibleExecutiveOfTicketByCompanyExecutive(Long ticketId,Long companyExecutiveId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM ticket.\"fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutiveId\"(?,?);");
		stmt.setLong(1, ticketId);
		stmt.setLong(2, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		List<NonAccessibleExecutiveListSelect> ll=new ArrayList<NonAccessibleExecutiveListSelect>();
		while(rs.next())
		{
			ll.add(new NonAccessibleExecutiveListSelect(
					rs.getString("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyID")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

}
