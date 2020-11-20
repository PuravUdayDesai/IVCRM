package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyExecutiveGeoLocationDAO;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationInsert;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationSelect;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationTextSelect;

@Service
public class CompanyExecutiveGeoLocationDAOImpl implements CompanyExecutiveGeoLocationDAO
{

	@Override
	public List<CompanyExecutiveGeoLocationSelect>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveId(
															Long companyExecutiveId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"companyExecutiveGeoLocation\".\"fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoLocationSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyExecutiveGeoLocationSelect(
					rs.getLong("CompanyExecutiveGeoLocationId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getTimestamp("EntryDateAndTime")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanyExecutiveGeoLocationSelect> 
	selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(
																Long companyExecutiveId,
																Date dateOfSearch) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"companyExecutiveGeoLocation\".\"fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate\"(?,?);");
		stmt.setLong(1, companyExecutiveId);
		stmt.setDate(2, dateOfSearch);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoLocationSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyExecutiveGeoLocationSelect(
					rs.getLong("CompanyExecutiveGeoLocationId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getTimestamp("EntryDateAndTime")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanyExecutiveGeoLocationSelect> 
	selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndBetweenDate(
																		Long companyExecutiveId, 
																		Timestamp startDate, 
																		Timestamp endDate)throws SQLException, ClassNotFoundException
	{
		
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"companyExecutiveGeoLocation\".\"fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate\"(?,?,?);");
		stmt.setLong(1, companyExecutiveId);
		stmt.setTimestamp(2, startDate);
		stmt.setTimestamp(3, endDate);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoLocationSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyExecutiveGeoLocationSelect(
					rs.getLong("CompanyExecutiveGeoLocationId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getLong("CompanyId"),
					rs.getString("CompanyName"),
					rs.getTimestamp("EntryDateAndTime")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanyExecutiveGeoLocationTextSelect> 
	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndDate(
																	Long companyExecutiveId, 
																	Date dateOfSearch) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"companyExecutiveGeoLocation\".\"fn_selectCompanyExecutiveGeoLocationAddressByDate\"(?,?);");
		stmt.setLong(1, companyExecutiveId);
		stmt.setDate(2, dateOfSearch);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoLocationTextSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationTextSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyExecutiveGeoLocationTextSelect(
					rs.getString("Country"),
					rs.getString("State"),
					rs.getString("City"),
					rs.getString("Area"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("Pincode"),
					rs.getTimestamp("EntryDateAndTime")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanyExecutiveGeoLocationTextSelect> 
	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndBetweenDate(
																			Long companyExecutiveId, 
																			Timestamp startDate, 
																			Timestamp endDate)throws SQLException, ClassNotFoundException 
	{
		
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"companyExecutiveGeoLocation\".\"fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate\"(?,?,?);");
		stmt.setLong(1, companyExecutiveId);
		stmt.setTimestamp(2, startDate);
		stmt.setTimestamp(3, endDate);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoLocationTextSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationTextSelect>();
		while(rs.next())
		{
			lcs.add(new CompanyExecutiveGeoLocationTextSelect(
					rs.getString("Country"),
					rs.getString("State"),
					rs.getString("City"),
					rs.getString("Area"),
					rs.getString("AddressLine1"),
					rs.getString("AddressLine2"),
					rs.getString("AddressLine3"),
					rs.getString("Pincode"),
					rs.getTimestamp("EntryDateAndTime")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public Boolean addCompanyExecutiveGeoLocation(CompanyExecutiveGeoLocationInsert cgi)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"companyExecutiveGeoLocation\".\"fn_insertCompanyExecutiveGeoLocation\"(?,?,?,?,?,?,?,?,?,?,?,?,?);");
		stmt.setLong(1, cgi.getCompanyExecutiveId());
		stmt.setLong(2, cgi.getCompanyId());
		stmt.setTimestamp(3, cgi.getEntryDateAndTime());
		stmt.setString(4, cgi.getLatitude());
		stmt.setString(5, cgi.getLongitude());
		stmt.setString(6, cgi.getCountryName());
		stmt.setString(7, cgi.getStateName());
		stmt.setString(8, cgi.getCityName());
		stmt.setString(9, cgi.getAreaName());
		stmt.setString(10, cgi.getAddressLine1());
		stmt.setString(11, cgi.getAddressLine2());
		stmt.setString(12, cgi.getAddressLine3());
		stmt.setString(13, cgi.getPincode());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertCompanyExecutiveGeoLocation");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

}
