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
import ivgroup.master.database.dao.schema.CompanyBranchTypeDAO;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeInsert;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeSelect;

@Service
public class CompanyBranchTypeDAOImpl implements CompanyBranchTypeDAO
{

	@Override
	public List<CompanyBranchTypeSelect> selectCompanyBranchTypeByCompanyId(Long companyId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_selectCompanyBranchTypeByCompanyId\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchTypeSelect> lcs=new ArrayList<CompanyBranchTypeSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyBranchTypeSelect(
					rs.getLong("CompanyBranchTypeId"),
					rs.getString("CompanyBranchTypeName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getInt("CompanyBranchPosition"),
					rs.getLong("CreatedBy"),
					rs.getTimestamp("CreatedOn"),
					rs.getTimestamp("LastEditOn"),
					rs.getLong("LastEditBy")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}
	
	@Override
	public List<CompanyBranchTypeSelect> selectCompanyBranchTypeByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_selectCompanyBranchTypeByOwnerId\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchTypeSelect> lcs=new ArrayList<CompanyBranchTypeSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyBranchTypeSelect(
					rs.getLong("CompanyBranchTypeId"),
					rs.getString("CompanyBranchTypeName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getInt("CompanyBranchPosition"),
					rs.getLong("CreatedBy"),
					rs.getTimestamp("CreatedOn"),
					rs.getTimestamp("LastEditOn"),
					rs.getLong("LastEditBy")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public Boolean addCompanyBranchType(CompanyBranchTypeInsert cbi) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_insertCompanyBranchType\"(?, ?, ?, ?, ?);");
		stmt.setString(1, cbi.getCompanyBranchTypeName());
		stmt.setLong(2, cbi.getCompanyId());
		stmt.setInt(3, cbi.getCompanyBranchPosition());
		stmt.setLong(4, cbi.getCreatedBy());
		stmt.setTimestamp(5, cbi.getCreatedOn());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertCompanyBranchType");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchTypeCompanyBranchTypeName(Connection c, Long companyBranchTypeId,String companyBranchTypeName) throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"company\".\"fn_updateCompanyBranchTypeCompanyBranchTypeName\"(?,?);");
		stmt.setLong(1, companyBranchTypeId);
		stmt.setString(2, companyBranchTypeName);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateCompanyBranchTypeCompanyBranchTypeName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchTypeCompanyId(Connection c, Long companyBranchTypeId, Long companyId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"company\".\"fn_updateCompanyBranchTypeCompanyId\"(?,?);");
		stmt.setLong(1, companyBranchTypeId);
		stmt.setLong(2, companyId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateCompanyBranchTypeCompanyId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchTypeCompanyBranchTypePosition(Connection c, Long companyBranchTypeId,Integer companyBranchTypePosition) throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"company\".\"fn_updateCompanyBranchTypeCompanyBranchPosition\"(?,?);");
		stmt.setLong(1, companyBranchTypeId);
		stmt.setInt(2, companyBranchTypePosition);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateCompanyBranchTypeCompanyBranchPosition");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchTypeLastEditBy(Connection c, Long companyBranchTypeId,Long companyBranchTypeLastEditBy) throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"company\".\"fn_updateCompanyBranchTypeLastEditBy\"(?,?);");
		stmt.setLong(1, companyBranchTypeId);
		stmt.setLong(2, companyBranchTypeLastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateCompanyBranchTypeLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchTypeLastEditOn(Connection c, Long companyBranchTypeId,Timestamp companyBranchTypeLastEditOn) throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"company\".\"fn_updateCompanyBranchTypeLatEditOn\"(?,?);");
		stmt.setLong(1, companyBranchTypeId);
		stmt.setTimestamp(2, companyBranchTypeLastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateCompanyBranchTypeLatEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteCompanyBranchType(Long companyBranchTypeId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"company\".\"fn_deleteCompanyBranchType\"(?);");
		stmt.setLong(1, companyBranchTypeId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteCompanyBranchType");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

}
