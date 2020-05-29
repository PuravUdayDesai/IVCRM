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
import ivgroup.master.database.dao.schema.EnquiryDAO;
import ivgroup.master.database.dto.enquiry.EnquiryAccessListInsert;
import ivgroup.master.database.dto.enquiry.EnquiryAccessListSelect;
import ivgroup.master.database.dto.enquiry.EnquiryDetailsForNewProductTicketInsert;
import ivgroup.master.database.dto.enquiry.EnquiryInsert;
import ivgroup.master.database.dto.enquiry.EnquiryNonAddedProductSelect;
import ivgroup.master.database.dto.enquiry.EnquiryProductSelect;
import ivgroup.master.database.dto.enquiry.EnquirySelect;
import ivgroup.master.database.dto.enquiry.NonAccessibleExecutiveListSelect;
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

	@Override
	public Boolean addEnquiryAccessList(EnquiryAccessListInsert eai) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT enquiry.\"fn_insertEnquiryAccessList\"(? , ? , ?);");
		stmt.setLong(1, eai.getEnquiryId());
		stmt.setLong(2, eai.getCompanyExecutiveId());
		stmt.setTimestamp(3, eai.getAccessApplicationTime());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertEnquiryAccessList");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public List<EnquiryAccessListSelect> selectEnquiryAccessListByEnquiryId(Long enquiryId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryAccessListByEnquiryId\"(?);");
		stmt.setLong(1, enquiryId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryAccessListSelect> lea=new ArrayList<EnquiryAccessListSelect>();
		while(rs.next())
		{
			lea.add(
					new EnquiryAccessListSelect(
							rs.getLong("EnquiryAccessListId"),
							rs.getLong("EnquiryId"),
							rs.getLong("CompanyExecutiveId"),
							rs.getString("CompanyExecutiveName"),
							rs.getBoolean("OwnerFlag"),
							rs.getTimestamp("AccessApplicationTime")
											   ));
		}
		rs.close();
		stmt.close();
		c.close();
		return lea;
	}

	@Override
	public Boolean deleteEnquiryAccessListExecutive(Long companyExecutiveAccessId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_deleteEnquiryAccessList\"(?);");
		stmt.setLong(1, companyExecutiveAccessId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteEnquiryAccessList");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Long checkCompanyExecutiveByEnquiryId(Long enquiryId, Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM enquiry.\"fn_checkExecutiveEnquiryAccess\"(?,?);");
		stmt.setLong(1, enquiryId);
		stmt.setLong(2, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		Long count=null;
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
	public List<EnquiryNonAddedProductSelect> selectEnquiryNonAddedProducts(Long enquiryId)throws SQLException, ClassNotFoundException 
	{
		List<EnquiryNonAddedProductSelect> lps=new ArrayList<EnquiryNonAddedProductSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM enquiry.\"fn_selectEnquiryNonAddedProducts\"(?);");
		stmt.setLong(1, enquiryId);
		ResultSet rs=stmt.executeQuery();
		
		while(rs.next())
		{
		lps.add(new EnquiryNonAddedProductSelect(
				rs.getLong("id"),
				rs.getString("productName"),
				rs.getString("productDescription"),
				rs.getLong("companyId"),
				rs.getString("companyName"),
				rs.getDouble("cost"),
				rs.getLong("createdBy"),
				rs.getTimestamp("createdOn"),
				rs.getLong("lastEditBy"),
				rs.getTimestamp("lastEditOn"),
				rs.getBoolean("isActive")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
				
		return lps;
	}

	@Override
	public List<EnquiryProductSelect> selectEnquiryProduct(Long enquiryId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM enquiry.\"fn_selectEnquiryProductList\"(?);");
		stmt.setLong(1, enquiryId);
		List<EnquiryProductSelect> lep=new ArrayList<EnquiryProductSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			lep.add(new EnquiryProductSelect(
					rs.getLong("EnquiryId"),
					rs.getLong("EnquiryProductListId"),
					rs.getLong("ProductId"),
					rs.getString("productName"),
					rs.getDouble("ProductCharges")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lep;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByCountry(Long companyExecutiveId, Long countryId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByCountry\"(?,?);");
		stmt.setLong(1, countryId);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			System.out.println("Country: "+rs.getLong("EnquiryId"));
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByState(Long companyExecutiveId, Long stateId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByState\"(?,?);");
		stmt.setLong(1, stateId);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByCity(Long companyExecutiveId, Long cityId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByCity\"(?,?);");
		stmt.setLong(1, cityId);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByArea(Long companyExecutiveId, Long areaId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByArea\"(?,?);");
		stmt.setLong(1, areaId);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByCompanyExecutiveId(Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByCompanyExecutiveId\"(?);");
		stmt.setLong(1, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByClient(Long companyExecutiveId, Long clientId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByClientId\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByProduct(Long companyExecutiveId, Long product)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByProductId\"(?,?);");
		stmt.setLong(1, product);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public List<EnquirySelect> selectEnquiryByEnquiryType(Long companyExecutiveId, Long enquiryTypeId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectEnquiryByEnquiryTypeId\"(?,?);");
		stmt.setLong(1, enquiryTypeId);
		stmt.setLong(2, companyExecutiveId);
		List<EnquirySelect> les=new ArrayList<EnquirySelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		les.add(new EnquirySelect(
				rs.getLong("EnquiryAccessListId"),
				rs.getLong("EnquiryId"),
				rs.getLong("CompanyId"),
				rs.getString("CompanyName"),
				rs.getString("EnquiryRemarks"),
				rs.getLong("EnquiryType"),
				rs.getString("EnquiryTypeName"),
				rs.getLong("EnquiryLocationId"),
				rs.getLong("CountryId"),
				rs.getString("CountryName"),
				rs.getLong("StateId"),
				rs.getString("StateName"),
				rs.getLong("CityId"),
				rs.getString("CityName"),
				rs.getLong("AreaId"),
				rs.getString("AreaName"),
				rs.getString("AddressLine1"),
				rs.getString("AddressLine2"),
				rs.getString("AddressLine3"),
				rs.getString("Pincode"),
				rs.getString("Latitude"),
				rs.getString("Longitude"),
				rs.getTimestamp("StartDateAndTime"),
				rs.getTimestamp("DeadlineDateAndTime"),
				rs.getLong("EnquiryClientId"),
				rs.getLong("ClientId"),
				rs.getString("ClientName"),
				rs.getString("ContactPerson"),
				rs.getString("EmailId"),
				rs.getString("ContactNumber"),
				new ArrayList<EnquiryProductSelect>(),
				rs.getLong("CreatedBy"),
				rs.getTimestamp("CreatedOn"),
				rs.getLong("LastEditBy"),
				rs.getTimestamp("LastEditOn")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

	@Override
	public Long checkCompanyExecutiveEnquiryAccessDependency(Long enquiryId, Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"enquiry\".\"fn_selectCompanyExecutiveEnquiryAccessDependency\"(?,?);");
		stmt.setLong(1, enquiryId);
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
	public List<NonAccessibleExecutiveListSelect> selectNonAccessibleExecutivesOfEnquiry(Long enquiryId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM enquiry.\"fn_selectNonExistingCompanyExecutivesInEnquiry\"(?);");
		stmt.setLong(1, enquiryId);
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
