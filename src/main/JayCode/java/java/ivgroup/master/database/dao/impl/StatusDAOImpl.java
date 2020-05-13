package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.StatusDAO;
import ivgroup.master.database.dto.status.StatusInsert;
import ivgroup.master.database.dto.status.StatusSelect;

@Service
public class StatusDAOImpl implements StatusDAO
{

	@Override
	public List<StatusSelect> selectStatusByCompanyId(Long companyId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"status\".\"fn_selectStatusByCompanyId\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<StatusSelect> lss=new ArrayList<StatusSelect>();
		while(rs.next())
		{
			lss.add(new StatusSelect(
					rs.getLong("StatusId"),
					rs.getString("StatusName"),
					rs.getString("StatusColorCode"),
					rs.getInt("WorkProgress"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("CreatedBy"),
					rs.getTimestamp("CreatedOn"),
					rs.getLong("LastEditBy"),
					rs.getTimestamp("LastEditOn")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lss;
	}

	@Override
	public Boolean addStatus(StatusInsert si) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT status.\"fn_insertStatus\"(?, ?, ?, ?, ?, ?);");
		stmt.setString(1, si.getStatusName());
		stmt.setString(2, si.getStatusColorCode());
		stmt.setInt(3, si.getWorkProgress());
		stmt.setLong(4, si.getCompanyId());
		stmt.setLong(5, si.getCreatedBy());
		stmt.setTimestamp(6, si.getCreatedOn());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertStatus");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean updateStatusStatusName(Connection c, Long statusId, String statusName)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_updateStatusStatusName\"(?,?);");
		stmt.setLong(1, statusId);
		stmt.setString(2, statusName);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateStatusStatusName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateStatusStatusColorCode(Connection c, Long statusId, String statusColorCode)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_updateStatusStatusColorCode\"(?,?);");
		stmt.setLong(1, statusId);
		stmt.setString(2, statusColorCode);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateStatusStatusColorCode");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateStatusWorkProgress(Connection c, Long statusId, Integer workProgress)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_updateStatusWorkProgress\"(?,?);");
		stmt.setLong(1, statusId);
		stmt.setInt(2, workProgress);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateStatusWorkProgress");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateStatusCompanyId(Connection c, Long statusId, Long companyId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_updateStatusCompanyId\"(?,?);");
		stmt.setLong(1, statusId);
		stmt.setLong(2, companyId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateStatusCompanyId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateStatusLastEditBy(Connection c, Long statusId, Long lastEditBy)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_updateStatusLastEditBy\"(?,?);");
		stmt.setLong(1, statusId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateStatusLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateStatusLastEditOn(Connection c, Long statusId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_updateStatusLastEditOn\"(?,?);");
		stmt.setLong(1, statusId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateStatusLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteStatus(Long statusId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"status\".\"fn_deleteStatus\"(?);");
		stmt.setLong(1, statusId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteStatus");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

}
