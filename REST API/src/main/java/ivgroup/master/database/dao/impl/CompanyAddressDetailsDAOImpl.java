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
import ivgroup.master.database.dao.schema.CompanyAddressDetailsDAO;
import ivgroup.master.database.dto.companyAddressDetails.CompanyAddressDetailsSelect;

@Service
public class CompanyAddressDetailsDAOImpl implements CompanyAddressDetailsDAO {


	@Override
	public List<CompanyAddressDetailsSelect> selectCompanyAddressDetails() throws SQLException, ClassNotFoundException {
		List<CompanyAddressDetailsSelect> lcs=new ArrayList<CompanyAddressDetailsSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyAddressDetails\"()");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyAddressDetailsSelect(
					 rs.getLong("CompanyAddressID"),
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
	public Boolean deleteCompanyAddressDetails(Long companyAddressId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_deleteCompanyAddressDetails\"(?)");
		stmt.setLong(1, companyAddressId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteCompanyAddressDetails");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}


	@Override
	public Boolean updateCompanyAddressDetailsAddressLine1(Connection c,Long companyAddressId, String addressLine1)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsAddressLine1\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setString(2, addressLine1);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsAddressLine1");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsAddressLine2(Connection c,Long companyAddressId, String addressLine2)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsAddressLine2\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setString(2, addressLine2);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsAddressLine2");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsAddressLine3(Connection c,Long companyAddressId, String addressLine3)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsAddressLine3\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setString(2, addressLine3);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsAddressLine3");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsCityId(Connection c,Long companyAddressId, Long cityId)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsCityID\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setLong(2, cityId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsCityID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsStateId(Connection c,Long companyAddressId, Long stateId)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsStateID\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setLong(2, stateId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsStateID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsCountryId(Connection c,Long companyAddressId, Long countryId)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsCountryID\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsCountryID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsLatitude(Connection c,Long companyAddressId, String latitude)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsLatitude\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setString(2, latitude);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsLatitude");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsLongitude(Connection c,Long companyAddressId, String longitude)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsLongitude\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setString(2, longitude);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsLongitude");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateCompanyAddressDetailsGeoLocation(Connection c,Long companyAddressId, String geoLocation)
			throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsGeoLocation\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setString(2, geoLocation);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsGeoLocation");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateCompanyAddressDetailsPincode(Connection c,Long companyAddressId, Long pincode)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsPincode\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setLong(2, pincode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsPincode");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsLastEditOn(Connection c,Long companyAddressId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException {

		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsLastEditOn\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsLastEditOn");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsLastEditBy(Connection c,Long companyAddressId, Long lastEditBy)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsLastEditBy\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsLastEditBy");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAddressDetailsLastEditDeviceType(Connection c,Long companyAddressId, Integer lastEditDeviceType)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAddressDetailsLastEditDeviceType\"(?,?)");
		stmt.setLong(1, companyAddressId);
		stmt.setInt(2, lastEditDeviceType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAddressDetailsLastEditDeviceType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	public String getLatitude(Long companyAddressDetailId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		PreparedStatement stmt=c.prepareCall("SELECT \"Latitude\" FROM company.\"CompanyAddressDetails\" WHERE \"CompanyAddressID\"=?;");
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
	
	public String getLongitude(Long companyAddressId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		PreparedStatement stmt=c.prepareCall("SELECT \"Longitude\" FROM company.\"CompanyAddressDetails\" WHERE \"CompanyAddressID\"=?;");
		stmt.setLong(1, companyAddressId);
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

