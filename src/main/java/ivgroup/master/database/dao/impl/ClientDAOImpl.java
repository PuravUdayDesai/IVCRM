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
import ivgroup.master.database.dao.schema.ClientDAO;
import ivgroup.master.database.dto.client.ClientContactCheckSelect;
import ivgroup.master.database.dto.client.ClientInsert;
import ivgroup.master.database.dto.client.ClientSelect;

@Service
public class ClientDAOImpl implements ClientDAO
{

	@Override
	public List<ClientSelect> selectClientByCompanyId(Long companyId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"client\".\"fn_selectClientByCompany\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		while(rs.next())
		{
			lcs.add(new ClientSelect(
					rs.getLong("ClientId"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("Country"),
					rs.getString("CountryName"),
					rs.getLong("State"),
					rs.getString("StateName"),
					rs.getLong("City"),
					rs.getString("CityName"),
					rs.getLong("Area"),
					rs.getString("AreaName"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("pincode"),
					rs.getString("latitude"),
					rs.getString("longitude"),
					rs.getTimestamp("ClientCreatedOn"),
					rs.getLong("ClientCreatedBy"),
					rs.getTimestamp("ClientLastEditOn"),
					rs.getLong("ClientLastEditBy"),
					rs.getBoolean("ClientisActive"),
					rs.getTimestamp("ClientLocationCreatedOn"),
					rs.getLong("ClientLocationCreatedBy"),
					rs.getTimestamp("ClientLocationLastEditOn"),
					rs.getLong("ClientLocationLastEditBy"),
					rs.getBoolean("ClientLocationisActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<ClientSelect> selectClientByCountryId(Long countryId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"client\".\"fn_selectClientByCountry\"(?);");
		stmt.setLong(1, countryId);
		ResultSet rs=stmt.executeQuery();
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		while(rs.next())
		{
			lcs.add(new ClientSelect(
					rs.getLong("ClientId"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("Country"),
					rs.getString("CountryName"),
					rs.getLong("State"),
					rs.getString("StateName"),
					rs.getLong("City"),
					rs.getString("CityName"),
					rs.getLong("Area"),
					rs.getString("AreaName"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("pincode"),
					rs.getString("latitude"),
					rs.getString("longitude"),
					rs.getTimestamp("ClientCreatedOn"),
					rs.getLong("ClientCreatedBy"),
					rs.getTimestamp("ClientLastEditOn"),
					rs.getLong("ClientLastEditBy"),
					rs.getBoolean("ClientisActive"),
					rs.getTimestamp("ClientLocationCreatedOn"),
					rs.getLong("ClientLocationCreatedBy"),
					rs.getTimestamp("ClientLocationLastEditOn"),
					rs.getLong("ClientLocationLastEditBy"),
					rs.getBoolean("ClientLocationisActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<ClientSelect> selectClientByStateId(Long stateId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  \"client\".\"fn_selectClientByState\"(?);");
		stmt.setLong(1, stateId);
		ResultSet rs=stmt.executeQuery();
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		while(rs.next())
		{
			lcs.add(new ClientSelect(
					rs.getLong("ClientId"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("Country"),
					rs.getString("CountryName"),
					rs.getLong("State"),
					rs.getString("StateName"),
					rs.getLong("City"),
					rs.getString("CityName"),
					rs.getLong("Area"),
					rs.getString("AreaName"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("pincode"),
					rs.getString("latitude"),
					rs.getString("longitude"),
					rs.getTimestamp("ClientCreatedOn"),
					rs.getLong("ClientCreatedBy"),
					rs.getTimestamp("ClientLastEditOn"),
					rs.getLong("ClientLastEditBy"),
					rs.getBoolean("ClientisActive"),
					rs.getTimestamp("ClientLocationCreatedOn"),
					rs.getLong("ClientLocationCreatedBy"),
					rs.getTimestamp("ClientLocationLastEditOn"),
					rs.getLong("ClientLocationLastEditBy"),
					rs.getBoolean("ClientLocationisActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<ClientSelect> selectClientByCityId(Long cityId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  \"client\".\"fn_selectClientByCity\"(?);");
		stmt.setLong(1, cityId);
		ResultSet rs=stmt.executeQuery();
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		while(rs.next())
		{
			lcs.add(new ClientSelect(
					rs.getLong("ClientId"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("Country"),
					rs.getString("CountryName"),
					rs.getLong("State"),
					rs.getString("StateName"),
					rs.getLong("City"),
					rs.getString("CityName"),
					rs.getLong("Area"),
					rs.getString("AreaName"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("pincode"),
					rs.getString("latitude"),
					rs.getString("longitude"),
					rs.getTimestamp("ClientCreatedOn"),
					rs.getLong("ClientCreatedBy"),
					rs.getTimestamp("ClientLastEditOn"),
					rs.getLong("ClientLastEditBy"),
					rs.getBoolean("ClientisActive"),
					rs.getTimestamp("ClientLocationCreatedOn"),
					rs.getLong("ClientLocationCreatedBy"),
					rs.getTimestamp("ClientLocationLastEditOn"),
					rs.getLong("ClientLocationLastEditBy"),
					rs.getBoolean("ClientLocationisActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<ClientSelect> selectClientByAreaId(Long areaId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  \"client\".\"fn_selectClientByArea\"(?);");
		stmt.setLong(1, areaId);
		ResultSet rs=stmt.executeQuery();
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		while(rs.next())
		{
			lcs.add(new ClientSelect(
					rs.getLong("ClientId"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("Country"),
					rs.getString("CountryName"),
					rs.getLong("State"),
					rs.getString("StateName"),
					rs.getLong("City"),
					rs.getString("CityName"),
					rs.getLong("Area"),
					rs.getString("AreaName"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("pincode"),
					rs.getString("latitude"),
					rs.getString("longitude"),
					rs.getTimestamp("ClientCreatedOn"),
					rs.getLong("ClientCreatedBy"),
					rs.getTimestamp("ClientLastEditOn"),
					rs.getLong("ClientLastEditBy"),
					rs.getBoolean("ClientisActive"),
					rs.getTimestamp("ClientLocationCreatedOn"),
					rs.getLong("ClientLocationCreatedBy"),
					rs.getTimestamp("ClientLocationLastEditOn"),
					rs.getLong("ClientLocationLastEditBy"),
					rs.getBoolean("ClientLocationisActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<ClientSelect> selectClientByOwnerId(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  \"client\".\"fn_selectClientByOwner\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		while(rs.next())
		{
			lcs.add(new ClientSelect(
					rs.getLong("ClientId"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getLong("Country"),
					rs.getString("CountryName"),
					rs.getLong("State"),
					rs.getString("StateName"),
					rs.getLong("City"),
					rs.getString("CityName"),
					rs.getLong("Area"),
					rs.getString("AreaName"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("pincode"),
					rs.getString("latitude"),
					rs.getString("longitude"),
					rs.getTimestamp("ClientCreatedOn"),
					rs.getLong("ClientCreatedBy"),
					rs.getTimestamp("ClientLastEditOn"),
					rs.getLong("ClientLastEditBy"),
					rs.getBoolean("ClientisActive"),
					rs.getTimestamp("ClientLocationCreatedOn"),
					rs.getLong("ClientLocationCreatedBy"),
					rs.getTimestamp("ClientLocationLastEditOn"),
					rs.getLong("ClientLocationLastEditBy"),
					rs.getBoolean("ClientLocationisActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public Boolean addClient(ClientInsert ci) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT client.\"fn_insertClient\"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, ci.getContactName());
		stmt.setString(2, ci.getContactPerson());
		stmt.setString(3, ci.getEmailId());
		stmt.setString(4, ci.getContactNumber());
		stmt.setLong(5, ci.getCompanyId());
		stmt.setLong(6, ci.getCountryId());
		stmt.setLong(7, ci.getStateId());
		stmt.setLong(8, ci.getCityId());
		stmt.setLong(9, ci.getAreaId());
		stmt.setString(10, ci.getAddressLine1());
		stmt.setString(11, ci.getAddressLine2());
		stmt.setString(12, ci.getAddressLine3());
		stmt.setString(13, ci.getPincode());
		stmt.setString(14, ci.getLatitude());
		stmt.setString(15, ci.getLongitude());
		stmt.setTimestamp(16, ci.getCreatedOn());
		stmt.setLong(17, ci.getCreatedBy());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertClient");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Long selectClientLocationIdByClientId(Long clientId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"client\".\"fn_getClientLocationIdByClientId\"(?);");
		stmt.setLong(1, clientId);
		ResultSet rs=stmt.executeQuery();
		Long clientLocationId=null;
		if(rs.next())
		{
			clientLocationId=rs.getLong("fn_getClientLocationIdByClientId");
		}
		rs.close();
		stmt.close();
		c.close();
		return clientLocationId;
	}

	
	@Override
	public Boolean deleteClient(Long clientId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_deleteClient\"(?)");
		stmt.setLong(1, clientId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteClient");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean deleteClientLocation(Long clientLocationId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_deleteClientLocation\"(?)");
		stmt.setLong(1, clientLocationId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deleteClientLocation");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientClientContactName(Connection c, Long clientId, String contactNumber)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientContactName\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setString(2, contactNumber);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientContactName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientClientContactPerson(Connection c, Long clientId, String contactPerson)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientContactPerson\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setString(2, contactPerson);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientContactPerson");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientEmailId(Connection c, Long clientId, String emailId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientEmailId\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setString(2, emailId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientEmailId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientContactNumber(Connection c, Long clientId, String contactNumber)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientContactNumber\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setString(2, contactNumber);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientContactNumber");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientCompany(Connection c, Long clientId, Long companyId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientCompanyId\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setLong(2, companyId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientCompanyId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientIsActive(Connection c, Long clientId, Boolean isActive)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientIsActive\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientIsActive");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLastEditOn(Connection c, Long clientId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLastEditOn\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLastEditBy(Connection c, Long clientId, Long lastEditBy)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLastEditBy\"(?,?);");
		stmt.setLong(1, clientId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationContry(Connection c, Long clientLocationId, Long countryId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationCountry\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationCountry");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationState(Connection c, Long clientLocationId, Long stateId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationState\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setLong(2, stateId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationState");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationCity(Connection c, Long clientLocationId, Long cityId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationCity\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setLong(2, cityId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationCity");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationArea(Connection c, Long clientLocationId, Long areaId)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationArea\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setLong(2, areaId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationArea");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationAddressLine1(Connection c, Long clientLocationId, String addressLine1)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationAddressLine1\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setString(2, addressLine1);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationAddressLine1");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationAddressLine2(Connection c, Long clientLocationId, String addressLine2)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationAddressLine2\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setString(2, addressLine2);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationAddressLine2");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationAddressLine3(Connection c, Long clientLocationId, String addressLine3)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationAddressLine3\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setString(2, addressLine3);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationAddressLine3");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationPincode(Connection c, Long clientLocationId, String pincode)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationpincode\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setString(2, pincode);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationpincode");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationLatitude(Connection c, Long clientLocationId, String latitude)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationlatitude\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setString(2, latitude);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationlatitude");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationLongitude(Connection c, Long clientLocationId, String longitude)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationlongitude\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setString(2, longitude);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationlongitude");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationIsActive(Connection c, Long clientLocationId, Boolean isActive)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationisActive\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationisActive");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationLastEditOn(Connection c, Long clientLocationId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationLastEditOn\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateClientLocationLastEditBy(Connection c, Long clientLocationId, Long lastEditBy)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"client\".\"fn_updateClientLocationLastEditBy\"(?,?);");
		stmt.setLong(1, clientLocationId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updateClientLocationLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public ClientContactCheckSelect checkForClientContactNumber(String contactNumber, Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM client.\"fn_checkClientContactNumber\"(?,?);");
		stmt.setString(1, contactNumber);
		stmt.setLong(2, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		ClientContactCheckSelect contactBody=null;
		if(rs.next())
		{
			contactBody=new ClientContactCheckSelect(
					rs.getLong("check")!=0?true:false,
					rs.getLong("ClientId"),
					rs.getString("ContactName")
					); 
		}
		else
		{
			contactBody=new ClientContactCheckSelect(
					false,
					0L,
					"NA"
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return contactBody;
	}

}
