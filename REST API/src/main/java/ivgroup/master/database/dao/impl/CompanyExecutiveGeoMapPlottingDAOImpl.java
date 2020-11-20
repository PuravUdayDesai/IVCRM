package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyExecutiveGeoMapPlottingDAO;
import ivgroup.master.database.dto.geoMapPlotting.CompanyExecutiveGeoMapPlotting;

@Service
public class CompanyExecutiveGeoMapPlottingDAOImpl implements CompanyExecutiveGeoMapPlottingDAO
{

	@Override
	public List<CompanyExecutiveGeoMapPlotting> getCompanyExecutiveGeoMapByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyExecutiveGeoByOwner\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyExecutiveGeoMapPlotting(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ExecutiveName"),
					rs.getString("CompanyName"),
					rs.getString("CompanyBranchName"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyExecutiveGeoMapPlotting> getCompanyExecutiveGeoMapByCompanyId(Long companyId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyExecutiveGeoByCompany\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyExecutiveGeoMapPlotting(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ExecutiveName"),
					rs.getString("CompanyName"),
					rs.getString("CompanyBranchName"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyExecutiveGeoMapPlotting> getCompanyExecutiveGeoMapByCountryId(Long ownerId, Long countryId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyExecutiveGeoByCountry\"(?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyExecutiveGeoMapPlotting(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ExecutiveName"),
					rs.getString("CompanyName"),
					rs.getString("CompanyBranchName"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyExecutiveGeoMapPlotting> getCompanyExecutiveGeoMapByStateId(Long ownerId, Long countryId,Long stateId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyExecutiveGeoByState\"(?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyExecutiveGeoMapPlotting(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ExecutiveName"),
					rs.getString("CompanyName"),
					rs.getString("CompanyBranchName"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyExecutiveGeoMapPlotting> getCompanyExecutiveGeoMapByCityId(Long ownerId, Long countryId,Long stateId, Long cityId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyExecutiveGeoByCity\"(?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyExecutiveGeoMapPlotting(
					rs.getLong("CompanyExecutiveId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ExecutiveName"),
					rs.getString("CompanyName"),
					rs.getString("CompanyBranchName"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

}
