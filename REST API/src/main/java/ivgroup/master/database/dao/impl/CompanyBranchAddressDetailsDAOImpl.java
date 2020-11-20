package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyBranchAddressDetailsDAO;
import ivgroup.master.database.dto.companyBranchAddressDetails.CompanyBranchAddressDetailsSelect;

@Service
public class CompanyBranchAddressDetailsDAOImpl implements CompanyBranchAddressDetailsDAO{
	@Override
	public List<CompanyBranchAddressDetailsSelect> selectCompanyBranchAddressDetails()throws SQLException, ClassNotFoundException {
		List<CompanyBranchAddressDetailsSelect> lcs=new ArrayList<CompanyBranchAddressDetailsSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyBranchAddressDetails\"()");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyBranchAddressDetailsSelect(
					 rs.getLong("CompanyBranchAddressID"),
					 rs.getString("AddressLine1"),
					 rs.getString("AddressLine2"),
					 rs.getString("AddressLine3"),
					 rs.getLong("Pincode"),
					 rs.getLong("CityID"),
					 rs.getString("CityName"),
					 rs.getLong("StateID"),
					 rs.getString("StateName"),
					 rs.getLong("CountryID"),
					 rs.getString("CountryName"),
					 rs.getString("Latitude"),
					 rs.getString("Longitude")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}
	
	@Override
	public Boolean deleteCompanyBranchAddressDetails(Long companyBranchAddressId)throws SQLException, ClassNotFoundException  {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_deleteCompanyBranchAddressDetails\"(?)");
		stmt.setLong(1, companyBranchAddressId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteCompanyBranchAddressDetails");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateCompanyBranchAddressDetailsAddressLine1(Connection c,Long companyBranchAddressId, String addressLine1)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsAddressLine1\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setString(2, addressLine1);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsAddressLine1");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsAddressLine2(Connection c,Long companyBranchAddressId, String addressLine2)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsAddressLine2\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setString(2, addressLine2);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsAddressLine2");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsAddressLine3(Connection c,Long companyBranchAddressId, String addressLine3)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsAddressLine3\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setString(2, addressLine3);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsAddressLine3");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsCityId(Connection c,Long companyBranchAddressId, Long cityId)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsCityID\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setLong(2, cityId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsCityID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsStateId(Connection c,Long companyBranchAddressId, Long stateId)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsStateID\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setLong(2, stateId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsStateID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsCountryId(Connection c,Long companyBranchAddressId, Long countryId)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsCountryID\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsCountryID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsLatitude(Connection c,Long companyBranchAddressId, String latitude)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsLatitude\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setString(2, latitude);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsLatitude");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsLongitude(Connection c,Long companyBranchAddressId, String longitude)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsLongitude\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setString(2, longitude);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsLongitude");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateCompanyBranchAddressDetailsGeoLocation(Connection c,Long companyBranchAddressId, String geoLocation)
			throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsGeoLocation\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setString(2, geoLocation);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsGeoLocation");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateCompanyBranchAddressDetailsPincode(Connection c,Long companyBranchAddressId, Long pincode)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsPincode\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setLong(2, pincode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsPincode");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsLastEditOn(Connection c,Long companyBranchAddressId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsLastEditOn\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsLastEditOn");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsLastEditBy(Connection c,Long companyBranchAddressId, Long lastEditBy)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsLastEditBy\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsLastEditBy");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyBranchAddressDetailsLastEditDeviceType(Connection c,Long companyBranchAddressId, Integer lastEditDeviceType)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyBranchAddressDetailsLastEditDeviceType\"(?,?)");
		stmt.setLong(1, companyBranchAddressId);
		stmt.setInt(2, lastEditDeviceType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyBranchAddressDetailsLastEditDeviceType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	
	public String getLatitude(Long companyAddressDetailId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		PreparedStatement stmt=c.prepareCall("SELECT \"Latitude\" FROM company.\"CompanyBranchAddressDetails\" WHERE \"CompanyBranchAddressDetailsIdID\"=?;");
		stmt.setLong(1, companyAddressDetailId);
		ResultSet rs=stmt.executeQuery();
		String latitude=null;
		if(rs.next()) {
			latitude=rs.getString("Latitude");
		}
		rs.close();
		stmt.close();
		c.close();
		return latitude;
	}
	
	public String getLongitude(Long companyBranchAddressId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		PreparedStatement stmt=c.prepareCall("SELECT \"Longitude\" FROM company.\"CompanyBranchAddressDetails\" WHERE \"CompanyBranchAddressDetailsIdID\"=?;");
		stmt.setLong(1, companyBranchAddressId);
		ResultSet rs=stmt.executeQuery();
		String longitude=null;
		if(rs.next()) {
			longitude=rs.getString("Longitude");
		}
		rs.close();
		stmt.close();
		c.close();
		return longitude;
	}

}
