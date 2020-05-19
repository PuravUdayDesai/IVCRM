package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyDAO;
import ivgroup.master.database.dto.company.CompanyInsert;
import ivgroup.master.database.dto.company.CompanyInsertWithCompanyBranchType;
import ivgroup.master.database.dto.company.CompanyInsetWithCompanyBranchTypeAndExecutivePosition;
import ivgroup.master.database.dto.company.CompanySelect;

@Service
public class CompanyDAOImpl implements CompanyDAO{
	
	@Override
	public Long deleteCompany(Long companyId) throws ClassNotFoundException, SQLException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_deleteCompany\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Long companyAddressId=(long)-1;
		while(rs.next()) {
			companyAddressId=rs.getLong("CompanyAddressId");
		}
		rs.close();
		stmt.close();
		c.close();
		return companyAddressId;
	}
	
	@Override
	public Long checkCompanyDeleteStatus(Long companyId) throws ClassNotFoundException, SQLException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_checkCompanyDeleteStatus\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		Long check=(long) -1;
		while(rs.next()) {
			check=rs.getLong("Check");
		}
		rs.close();
		stmt.close();
		c.close();
		return check;
	}
	
	@Override
	public HashMap<Long,Long> addCompany(CompanyInsert ci) throws ClassNotFoundException, SQLException
	{	
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_insertCompany\"(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, ci.getAddressLine1());
		stmt.setString(2, ci.getAddressLine2());
		stmt.setString(3, ci.getAddressLine3());
		stmt.setLong(4, ci.getPincode());
		stmt.setLong(5, ci.getCityID());
		stmt.setLong(6, ci.getStateID());
		stmt.setLong(7, ci.getCountryID());
		stmt.setString(8, ci.getLatitude());
		stmt.setString(9, ci.getLongitude());
		stmt.setString(10, (ci.getLatitude()+","+ci.getLongitude()));
		stmt.setString(11, ci.getCompanyCode());
		stmt.setString(12, ci.getCompanyName());
		stmt.setLong(13, ci.getOwnerContactId());
		stmt.setString(14, ci.getCompanyRegionName());
		stmt.setString(15, ci.getCompanyRegionCode());
		stmt.setString(16, ci.getCompanyRegionDescription());
		stmt.setString(17, ci.getCompanyAreaName());
		stmt.setString(18, ci.getCompanyAreaCode());
		stmt.setString(19, ci.getCompanyAreaDescription());
		stmt.setString(20, ci.getCompanyBranchName());
		stmt.setString(21, ci.getCompanyBranchCode());
		stmt.setInt(22, ci.getCompanyBranchType());
		stmt.setString(23, ci.getExecutiveName());
		stmt.setString(24, ci.getLoginID());
		stmt.setString(25, ci.getPassword());
		stmt.setString(26, ci.getContactNumber());
		stmt.setTimestamp(27, ci.getCreatedOn());
		stmt.setLong(28, ci.getCreatedBy());
		stmt.setInt(29, ci.getDeviceType());
		stmt.setTimestamp(30, ci.getCreatedOn());
		stmt.setLong(31, ci.getCreatedBy());
		stmt.setInt(32, ci.getDeviceType());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		while(rs.next()) {
			value.put(rs.getLong("ExecutiveID"), rs.getLong("CompanyBranchID") );
		}
		rs.close();
		stmt.close();
		c.close();
		return value;
	}

	@Override
	public HashMap<Long, Long> addCompanyWithCompanyBranchType(CompanyInsertWithCompanyBranchType ci)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_insertCompanyWithCompanyBranchType\"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, ci.getAddressLine1());
		stmt.setString(2, ci.getAddressLine2());
		stmt.setString(3, ci.getAddressLine3());
		stmt.setLong(4, ci.getPincode());
		stmt.setLong(5, ci.getCityID());
		stmt.setLong(6, ci.getStateID());
		stmt.setLong(7, ci.getCountryID());
		stmt.setString(8, ci.getLatitude());
		stmt.setString(9, ci.getLongitude());
		stmt.setString(10, (ci.getLatitude()+","+ci.getLongitude()));
		stmt.setString(11, ci.getCompanyCode());
		stmt.setString(12, ci.getCompanyName());
		stmt.setLong(13, ci.getOwnerContactId());
		stmt.setString(14, ci.getCompanyRegionName());
		stmt.setString(15, ci.getCompanyRegionCode());
		stmt.setString(16, ci.getCompanyRegionDescription());
		stmt.setString(17, ci.getCompanyAreaName());
		stmt.setString(18, ci.getCompanyAreaCode());
		stmt.setString(19, ci.getCompanyAreaDescription());
		stmt.setString(20, ci.getCompanyBranchName());
		stmt.setString(21, ci.getCompanyBranchCode());
		stmt.setString(22, ci.getCompanyBranchTypeName());
		stmt.setInt(23, ci.getCompanyBranchPosition());
		stmt.setString(24, ci.getExecutiveName());
		stmt.setString(25, ci.getLoginID());
		stmt.setString(26, ci.getPassword());
		stmt.setString(27, ci.getContactNumber());
		stmt.setTimestamp(28, ci.getCreatedOn());
		stmt.setLong(29, ci.getCreatedBy());
		stmt.setInt(30, ci.getDeviceType());
		stmt.setTimestamp(31, ci.getCreatedOn());
		stmt.setLong(32, ci.getCreatedBy());
		stmt.setInt(33, ci.getDeviceType());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		while(rs.next()) {
			value.put(rs.getLong("ExecutiveID"), rs.getLong("CompanyBranchID") );
		}
		rs.close();
		stmt.close();
		c.close();
		return value;
	}
	

	@Override
	public HashMap<Long, Long> addCompanyWithCompanyBranchTypeAndPosition(CompanyInsetWithCompanyBranchTypeAndExecutivePosition ci) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition\"(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
		stmt.setString(1, ci.getAddressLine1());
		stmt.setString(2, ci.getAddressLine2());
		stmt.setString(3, ci.getAddressLine3());
		stmt.setLong(4, ci.getPincode());
		stmt.setLong(5, ci.getCityID());
		stmt.setLong(6, ci.getStateID());
		stmt.setLong(7, ci.getCountryID());
		stmt.setString(8, ci.getLatitude());
		stmt.setString(9, ci.getLongitude());
		stmt.setString(10, (ci.getLatitude()+","+ci.getLongitude()));
		stmt.setString(11, ci.getCompanyCode());
		stmt.setString(12, ci.getCompanyName());
		stmt.setLong(13, ci.getOwnerContactId());
		stmt.setString(14, ci.getCompanyRegionName());
		stmt.setString(15, ci.getCompanyRegionCode());
		stmt.setString(16, ci.getCompanyRegionDescription());
		stmt.setString(17, ci.getCompanyAreaName());
		stmt.setString(18, ci.getCompanyAreaCode());
		stmt.setString(19, ci.getCompanyAreaDescription());
		stmt.setString(20, ci.getCompanyBranchName());
		stmt.setString(21, ci.getCompanyBranchCode());
		stmt.setString(22, ci.getCompanyBranchTypeName());
		stmt.setInt(23, ci.getCompanyBranchPosition());
		stmt.setString(24, ci.getExecutiveName());
		stmt.setString(25, ci.getLoginID());
		stmt.setString(26, ci.getPassword());
		stmt.setString(27, ci.getContactNumber());
		stmt.setString(28, ci.getPositionName());
		stmt.setInt(29, ci.getPositionPriority());
		stmt.setString(30, ci.getCompanyGrant());
		stmt.setString(31, ci.getCompanyBranchGrant());
		stmt.setString(32, ci.getCompanyExecutiveGrant());
		stmt.setString(33, ci.getClientGrant());
		stmt.setString(34, ci.getProductGrant());
		stmt.setString(35, ci.getLocationGrant());
		stmt.setString(36, ci.getEnquiryGrant());
		stmt.setString(37, ci.getTicketGrant());
		stmt.setString(38, ci.getPositionGrant());
		stmt.setTimestamp(39, ci.getCreatedOn());
		stmt.setLong(40, ci.getCreatedBy());
		stmt.setInt(41, ci.getDeviceType());
		stmt.setTimestamp(42, ci.getCreatedOn());
		stmt.setLong(43, ci.getCreatedBy());
		stmt.setInt(44, ci.getDeviceType());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		while(rs.next()) {
			value.put(rs.getLong("ExecutiveID"), rs.getLong("CompanyBranchID") );
		}
		rs.close();
		stmt.close();
		c.close();
		return value;
	}
	
	@Override
	public List<CompanySelect> selectCompany() throws ClassNotFoundException, SQLException {
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompany\"()");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanySelect(
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyCode"),
					 rs.getString("CompanyName"),
					 rs.getLong("OwnerContactId"),
					 rs.getLong("CompanyAddressId"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityId"),
					 rs.getString("CityName"),
					 rs.getLong("StateId"),
					 rs.getLong("CountryId"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude"),
					 rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public CompanySelect selectCompanyByCompanyId(Long companyId) throws ClassNotFoundException, SQLException {
		CompanySelect cs=new CompanySelect();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyByCompanyID\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			cs=new CompanySelect(
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyCode"),
					 rs.getString("CompanyName"),
					 rs.getLong("OwnerContactId"),
					 rs.getLong("CompanyAddressId"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityId"),
					 rs.getString("CityName"),
					 rs.getLong("StateId"),
					 rs.getLong("CountryId"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude"),
					 rs.getBoolean("IsActive")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return cs;
	}
	@Override
	public List<CompanySelect> selectCompanyByOwnerId(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyByOwnerID\"(?)");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanySelect(
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyCode"),
					 rs.getString("CompanyName"),
					 rs.getLong("OwnerContactId"),
					 rs.getLong("CompanyAddressId"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityId"),
					 rs.getString("CityName"),
					 rs.getLong("StateId"),
					 rs.getLong("CountryId"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude"),
					 rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanySelect> selectCompanyByCountryId(Long countryId) throws ClassNotFoundException, SQLException {
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyByCountryID\"(?)");
		stmt.setLong(1, countryId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanySelect(
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyCode"),
					 rs.getString("CompanyName"),
					 rs.getLong("OwnerContactId"),
					 rs.getLong("CompanyAddressId"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityId"),
					 rs.getString("CityName"),
					 rs.getLong("StateId"),
					 rs.getLong("CountryId"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude"),
					 rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanySelect> selectCompanyByStateId(Long countryId, Long stateId)
			throws ClassNotFoundException, SQLException {
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyByStateID\"(?,?)");
		stmt.setLong(1, countryId);
		stmt.setLong(2, stateId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanySelect(
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyCode"),
					 rs.getString("CompanyName"),
					 rs.getLong("OwnerContactId"),
					 rs.getLong("CompanyAddressId"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityId"),
					 rs.getString("CityName"),
					 rs.getLong("StateId"),
					 rs.getLong("CountryId"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude"),
					 rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanySelect> selectCompanyByCityId(Long countryId, Long stateId, Long cityId)
			throws ClassNotFoundException, SQLException {
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyByCityID\"(?,?,?)");
		stmt.setLong(1, countryId);
		stmt.setLong(2, stateId);
		stmt.setLong(3, cityId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanySelect(
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyCode"),
					 rs.getString("CompanyName"),
					 rs.getLong("OwnerContactId"),
					 rs.getLong("CompanyAddressId"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityId"),
					 rs.getString("CityName"),
					 rs.getLong("StateId"),
					 rs.getLong("CountryId"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude"),
					 rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}


	
	@Override
	public Boolean updateCompanyCityId(Connection c, Long companyId, Long cityId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyCityId\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setLong(2, cityId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyCityId");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyCompanyAddress(Connection c, Long companyId, Long companyAddress)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyCompanyAddress\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setLong(2, companyAddress);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyCompanyAddress");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyCompanyCode(Connection c, Long companyId, String companyCode)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyCompanyCode\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setString(2, companyCode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyCompanyCode");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyCompanyName(Connection c, Long companyId, String companyName)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyCompanyName\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setString(2, companyName);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyCompanyName");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyIsActive(Connection c, Long companyId, Boolean isActive)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyIsActive\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyIsActive");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyLastEditedDeviceType(Connection c, Long companyId, Integer lastEditedDeviceType)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyLastEditDeviceType\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setInt(2, lastEditedDeviceType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyLastEditDeviceType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyLastEditedBy(Connection c, Long companyId, Long lastEditedBy)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyLastEditedBy\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setLong(2, lastEditedBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyLastEditedBy");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyLastEditedOn(Connection c, Long companyId, Timestamp lastEditedOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyLastEditedOn\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setTimestamp(2, lastEditedOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyLastEditedOn");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyOwnerContactId(Connection c, Long companyId, Long ownerContactId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyOwnerContactId\"(?,?);");
		stmt.setLong(1,companyId);
		stmt.setLong(2, ownerContactId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyOwnerContactId");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

}
