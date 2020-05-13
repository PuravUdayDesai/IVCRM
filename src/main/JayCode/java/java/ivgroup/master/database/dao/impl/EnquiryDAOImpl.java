package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.EnquiryDAO;
import ivgroup.master.database.dto.enquiry.EnquiryDetailsForNewProductTicketInsert;
import ivgroup.master.database.dto.enquiry.EnquiryInsert;
import ivgroup.master.database.dto.enquiry.SelectEnquiryDetailsByProductListId;

@Service
public class EnquiryDAOImpl implements EnquiryDAO
{

	@Override
	public Long addEnquiry(EnquiryInsert ei) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM enquiry.\"fn_insertEnquiry\"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setLong(1, ei.getCompanyId());
		stmt.setString(2, ei.getEnquiryRemarks());
		stmt.setLong(3, ei.getEnquiryType());
		stmt.setLong(4, ei.getClientId());
		stmt.setLong(5, ei.getCountryId());
		stmt.setLong(6, ei.getStateId());
		stmt.setLong(7, ei.getCityId());
		stmt.setLong(8, ei.getAreaId());
		stmt.setString(9, ei.getAddressLine1());
		stmt.setString(10, ei.getAddressLine2());
		stmt.setString(11, ei.getAddressLine3());
		stmt.setString(12, ei.getPincode());
		stmt.setString(13, ei.getLatitude());
		stmt.setString(14, ei.getLongitude());
		stmt.setTimestamp(15, ei.getStartDateAndTime());
		stmt.setTimestamp(16, ei.getDeadlineDateAndTime());
		stmt.setLong(17, ei.getCreatedBy());
		stmt.setTimestamp(18, ei.getCreatedOn());
		ResultSet rs=stmt.executeQuery();
		Long enquiryId=null;
		c.commit();
		if(rs.next())
		{
			enquiryId=rs.getLong("EnquiryId");
		}
		rs.close();
		stmt.close();
		c.close();
		return enquiryId;
	}

	@Override
	public Boolean addEnquiryProduct(Long enquiryId, Long productId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT enquiry.\"fn_insertEnquiryProductList\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, productId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertEnquiryProductList");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public EnquiryDetailsForNewProductTicketInsert selectEnquiryForNewProductTicketInsert(Long enquiryId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryDetailsForProductTicketInsert\"(?)");
		stmt.setLong(1, enquiryId);
		ResultSet rs=stmt.executeQuery();
		EnquiryDetailsForNewProductTicketInsert eData=null;
		if(rs.next()) {
			eData=new EnquiryDetailsForNewProductTicketInsert(
					 rs.getString("EnquiryRemarks"),
					 rs.getLong("EnquiryType"),
					 rs.getTimestamp("startDateAndTime"),
					 rs.getTimestamp("deadlineDateAndTime"),
					 rs.getLong("CompanyId")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return eData;
	}

	@Override
	public Boolean updateEnquiryClient(Connection c, Long enquiryId, Long clientId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryClient\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setLong(2, enquiryId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryClient");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryCountry(Connection c, Long enquiryId, Long countryId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationCountryId\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationCountryId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryState(Connection c, Long enquiryId, Long stateId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationStateId\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, stateId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationStateId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryCity(Connection c, Long enquiryId, Long cityId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationCityId\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, cityId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationCityId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryArea(Connection c, Long enquiryId, Long areaId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationAreaId\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, areaId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationAreaId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryAddressLine1(Connection c, Long enquiryId, String addressLine1)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationAddressLine1\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, addressLine1);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationAddressLine1");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryAddressLine2(Connection c, Long enquiryId, String addressLine2)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationAddressLine2\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, addressLine2);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationAddressLine2");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryAddressLine3(Connection c, Long enquiryId, String addressLine3)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationAddressLine3\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, addressLine3);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationAddressLine3");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryLatitude(Connection c, Long enquiryId, String latitude)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationLatitude\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, latitude);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationLatitude");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryLongitude(Connection c, Long enquiryId, String longitude)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationLongitude\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, longitude);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationLongitude");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryPincode(Connection c, Long enquiryId, String pincode)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateEnquiryLocationPincode\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, pincode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateEnquiryLocationPincode");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryEnquiryRemarks(Connection c, Long enquiryId, String enquiryRemarks)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateMainEnquiryEnquiryRemarks\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setString(2, enquiryRemarks);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainEnquiryEnquiryRemarks");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryEnquiryType(Connection c, Long enquiryId, Long enquiryType)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateMainEnquiryEnquiryType\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, enquiryType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainEnquiryEnquiryType");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryLastEditBy(Connection c, Long enquiryId, Long lastEditBy)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateMainEnquiryLastEditBy\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainEnquiryLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateEnquiryLastEditOn(Connection c, Long enquiryId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_updateMainEnquiryLastEditOn\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateMainEnquiryLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteEnquiryProduct(Long productId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT enquiry.\"fn_deleteEnquiryProductList\"(?);");
		stmt.setLong(1, productId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteEnquiryProductList");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean deleteEnquiry(Long enquiryId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"enquiry\".\"fn_deleteMainEnquiry\"(?);");
		stmt.setLong(1, enquiryId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteMainEnquiry");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public SelectEnquiryDetailsByProductListId selectEnquiryAndProductIdByProductListId(Long productListId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  \"enquiry\".\"fn_selectEnquiryAndProductIdByProductListId\"(?);");
		stmt.setLong(1, productListId);
		ResultSet rs=stmt.executeQuery();
		SelectEnquiryDetailsByProductListId sed=null;
		if(rs.next())
		{
			sed=new SelectEnquiryDetailsByProductListId(rs.getLong("EnquiryId"),rs.getLong("ProductId"));
		}
		rs.close();
		stmt.close();
		c.close();
		return sed;
	}
	
}
