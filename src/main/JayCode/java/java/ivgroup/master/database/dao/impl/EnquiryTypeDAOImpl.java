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
import ivgroup.master.database.dao.schema.EnquiryTypeDAO;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeInsert;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeSelect;

@Service
public class EnquiryTypeDAOImpl implements EnquiryTypeDAO
{

	@Override
	public List<EnquiryTypeSelect> selectEnquiryTypeByCompanyId(Long companyId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryTypeByCompanyId\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryTypeSelect> lct=new ArrayList<EnquiryTypeSelect>();
		while(rs.next())
		{
			lct.add(new EnquiryTypeSelect(
					rs.getLong("EnquiryTypeId"),
					rs.getString("EnquiryTypeName"),
					rs.getString("EnquiryTypeColorCode"),
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
		return lct;
	}

	@Override
	public List<EnquiryTypeSelect> selectEnquiryTypeByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryTypeByOwnerId\"(?)");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryTypeSelect> lct=new ArrayList<EnquiryTypeSelect>();
		while(rs.next())
		{
			lct.add(new EnquiryTypeSelect(
					rs.getLong("EnquiryTypeId"),
					rs.getString("EnquiryTypeName"),
					rs.getString("EnquiryTypeColorCode"),
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
		return lct;
	}
	
	@Override
	public Boolean addEnquiryType(EnquiryTypeInsert eti) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT enquiry.\"fn_insertEnquiryType\"(?, ?, ?, ?, ?);");
		stmt.setString(1, eti.getEnquiryTypeName());
		stmt.setString(2, eti.getEnquiryTypeColorCode());
		stmt.setLong(3, eti.getCompanyId());
		stmt.setLong(4, eti.getCreatedBy());
		stmt.setTimestamp(5, eti.getCreatedOn());
		System.out.println("QUERY: "+stmt);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertEnquiryType");
		}
		System.out.println("DAO IMPL RESULTS: "+rsMain);
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryTypeEnquiryTypeName(Connection c, Long enquiryTypeId, String enquiryTypeName)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryTypeEnquiryTypeName\"(?,?)");
		stmt.setLong(1, enquiryTypeId);
		stmt.setString(2, enquiryTypeName);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryTypeEnquiryTypeName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryTypeEnquiryTypeColorCode(Connection c, Long enquiryTypeId, String enquiryTypeColorCode)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryTypeEnquiryTypeColorCode\"(?,?)");
		stmt.setLong(1, enquiryTypeId);
		stmt.setString(2, enquiryTypeColorCode);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryTypeEnquiryTypeColorCode");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryTypeCompanyId(Connection c, Long enquiryTypeId, Long companyId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryTypeCompanyId\"(?,?)");
		stmt.setLong(1, enquiryTypeId);
		stmt.setLong(2, companyId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryTypeCompanyId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryTypeLastEditBy(Connection c, Long enquiryTypeId, Long lastEditBy)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryTypeLastEditBy\"(?,?)");
		stmt.setLong(1, enquiryTypeId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryTypeLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryTypeLastEditOn(Connection c, Long enquiryTypeId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryTypeLastEditOn\"(?,?)");
		stmt.setLong(1, enquiryTypeId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryTypeLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteEnquiryType(Long enquiryTypeId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_deleteEnquiryType\"(?)");
		stmt.setLong(1, enquiryTypeId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteEnquiryType");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

}
