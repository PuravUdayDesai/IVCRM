package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.EnquiryGeoMapPlottingDAO;
import ivgroup.master.database.dto.geoMapPlotting.EnquiryGeoMapPlotting;

@Service
public class EnquiryGeoMapPlottingDAOImpl implements EnquiryGeoMapPlottingDAO
{

	@Override
	public List<EnquiryGeoMapPlotting> getEnquiryGeoMapPlottingByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByOwner\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<EnquiryGeoMapPlotting> getEnquryGeoMapPlottingByCompanyId(Long companyId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByCompany\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<EnquiryGeoMapPlotting> getEnquiryGeoMapPlottingByCountry(Long ownerId, Long countryId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByCountry\"(?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<EnquiryGeoMapPlotting> getEnquiryGeoMapPlottingByState(Long ownerId, Long countryId, Long stateId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByState\"(?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<EnquiryGeoMapPlotting> getEnquiryGeoMapPlottingByCity(Long ownerId, Long countryId, Long stateId,Long cityId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByCity\"(?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<EnquiryGeoMapPlotting> getEnquiryGeoMapPlottingByCompanyExecutive(Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByCompanyExecutive\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;	
	}

	@Override
	public List<EnquiryGeoMapPlotting> getEnquiryGeoMapPlottingByArea(Long ownerId, Long countryId, Long stateId,Long cityId, Long areaId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectEnquiryByArea\"(?,?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		stmt.setLong(5, areaId);
		ResultSet rs=stmt.executeQuery();
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new EnquiryGeoMapPlotting(
					rs.getLong("EnquiryId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("ClientName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getString("EnquiryTypeName")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

}
