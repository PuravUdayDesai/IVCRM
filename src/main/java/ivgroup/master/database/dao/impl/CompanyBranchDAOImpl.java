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
import ivgroup.master.database.dao.schema.CompanyBranchDAO;
import ivgroup.master.database.dto.companyBranch.CompanyBranchInsert;
import ivgroup.master.database.dto.companyBranch.CompanyBranchSelect;

@Service
public class CompanyBranchDAOImpl implements CompanyBranchDAO 
{

	@Override
	public HashMap<Long,Long> addCompanyBranch(CompanyBranchInsert cbi) throws SQLException, ClassNotFoundException {
	Connection c=ConnectionProvider.getConnection();
	CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_insertCompanyBranch\"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
	stmt.setString(1,cbi.getAddressLine1());
	stmt.setString(2, cbi.getAddressLine2());
	stmt.setString(3, cbi.getAddressLine3());
	stmt.setLong(4, cbi.getPincode());
	stmt.setLong(5,cbi.getCityID());
	stmt.setLong(6, cbi.getStateID());
	stmt.setLong(7, cbi.getCountryID());
	stmt.setString(8, cbi.getLatitude());
	stmt.setString(9, cbi.getLongitude());
	stmt.setString(10, cbi.getLatitude()+","+cbi.getLongitude());
	stmt.setLong(11, cbi.getCompanyId());
	stmt.setLong(12,cbi.getCompanyRegionId());
	stmt.setLong(13, cbi.getCompanyAreaId());
	stmt.setString(14, cbi.getCompanyBranchName());
	stmt.setString(15, cbi.getCompanyBranchCode());
	stmt.setInt(16, cbi.getCompanyBranchType());
	stmt.setString(17, cbi.getExecutiveName());
	stmt.setString(18, cbi.getLoginID());
	stmt.setString(19, cbi.getPassword());
	stmt.setString(20, cbi.getContactNumber());
	stmt.setTimestamp(21, cbi.getCreatedOn());
	stmt.setLong(22, cbi.getCreatedBy());
	stmt.setInt(23, cbi.getDeviceType());
	stmt.setTimestamp(24, cbi.getCreatedOn());
	stmt.setLong(25, cbi.getCreatedBy());
	stmt.setInt(26, cbi.getDeviceType());
	
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
	public List<CompanyBranchSelect> selectCompanyBranch() throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranch\"()");
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		while(rs.next()) {
			lcbs.add(new CompanyBranchSelect(
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getInt("CompanyBranchType"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getLong("Pincode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("StateID"),
					rs.getLong("CountryID"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcbs;
	}

	@Override
	public CompanyBranchSelect selectCompanyBranchByCompanyBranchID(Long companyBranchId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranchByCompanyBranchId\"(?)");
		stmt.setLong(1, companyBranchId);
		ResultSet rs=stmt.executeQuery();
		CompanyBranchSelect cbs=new CompanyBranchSelect();
		while(rs.next()) {
			cbs=new CompanyBranchSelect(
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getInt("CompanyBranchType"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getLong("Pincode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("StateID"),
					rs.getLong("CountryID"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return cbs;
	}

	@Override
	public List<CompanyBranchSelect> selectCompanyBranchByCompanyID(Long companyId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranchByCompanyId\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		while(rs.next()) {
			lcbs.add(new CompanyBranchSelect(
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getInt("CompanyBranchType"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getLong("Pincode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("StateID"),
					rs.getLong("CountryID"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcbs;
	}

	@Override
	public List<CompanyBranchSelect> selectCompanyBranchByOwnerID(Long ownerId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranchByOwnerID\"(?)");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		while(rs.next()) {
			lcbs.add(new CompanyBranchSelect(
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getInt("CompanyBranchType"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getLong("Pincode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("StateID"),
					rs.getLong("CountryID"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcbs;
	}
	
	@Override
	public List<CompanyBranchSelect> selectCompanyBranchByCompanyRegionID(Long companyRegionID)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranchByCompanyRegionId\"(?)");
		stmt.setLong(1, companyRegionID);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		while(rs.next()) {
			lcbs.add(new CompanyBranchSelect(
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getInt("CompanyBranchType"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getLong("Pincode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("StateID"),
					rs.getLong("CountryID"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcbs;
	}

	@Override
	public List<CompanyBranchSelect> selectCompanyBranchByCompanyAreaID(Long companyAreaID)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranchByCompanyAreaId\"(?)");
		stmt.setLong(1, companyAreaID);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		while(rs.next()) {
			lcbs.add(new CompanyBranchSelect(
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getInt("CompanyBranchType"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getLong("Pincode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("StateID"),
					rs.getLong("CountryID"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcbs;
	}

	@Override
	public Boolean updateCompanyBranchCompanyBranchName(Connection c, Long companyBranchId, String companyBranchName)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyBranchName\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setString(2, companyBranchName);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyBranchName");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyBranchCode(Connection c, Long companyBranchId, String companyBranchCode)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyBranchCode\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setString(2, companyBranchCode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyBranchCode");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyRegionID(Connection c, Long companyBranchId, Long companyRegionID)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyRegionID\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setLong(2,companyRegionID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyRegionID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyAreaID(Connection c, Long companyBranchId, Long companyAreaID)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyAreaID\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setLong(2,companyAreaID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyAreaID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyID(Connection c, Long companyBranchId, Long companyID)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyID\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setLong(2, companyID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyBranchType(Connection c, Long companyBranchId, Integer companyBranchType)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyBranchType\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setInt(2, companyBranchType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyBranchType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyBranchAddressID(Connection c, Long companyBranchId,Long companyBranchAddressID) throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyBranchAddressID\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setLong(2, companyBranchAddressID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyBranchAddressID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchCompanyBranchPrimaryContactID(Connection c, Long companyBranchId,Long companyBranchPrimaryContactID) throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchCompanyBranchPrimaryContactID\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setLong(2, companyBranchPrimaryContactID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchCompanyBranchPrimaryContactID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchIsActive(Connection c, Long companyBranchId, Boolean isActive)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchIsActive\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchIsActive");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchLastEditOn(Connection c, Long companyBranchId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchLastEditOn\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchLastEditOn");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchLastEditBy(Connection c, Long companyBranchId, Long lastEditBy)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchLastEditBy\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchLastEditBy");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchLastEditDeviceType(Connection c, Long companyBranchId, Integer lastEditDeviceType)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchLastEditDeviceType\"(?,?);");
		stmt.setLong(1, companyBranchId);
		stmt.setInt(2, lastEditDeviceType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchLastEditDeviceType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteCompanyBranch(Long companyBranchId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_deleteCompanyBranch\"(?)");
		stmt.setLong(1, companyBranchId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteCompanyBranch");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}
	
	@Override
	public Long checkCompanyBranchDeleteStatus(Long companyBranchId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_checkCompanyBranchDeleteStatus\"(?);");
		stmt.setLong(1, companyBranchId);
		ResultSet rs=stmt.executeQuery();
		Long check=(long)-1;
		while(rs.next())
		{
			check=rs.getLong("Check");
		}
		rs.close();
		stmt.close();
		c.close();
		return check;
	}

	@Override
	public Boolean revokeCompanyBranch(Long companyBranchId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_revokeCompanyBranch\"(?)");
		stmt.setLong(1, companyBranchId);
		Boolean rs=stmt.execute();
		c.commit();
		stmt.close();
		c.close();
		return rs;
	}

}
