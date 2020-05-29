package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyGeoMapPlottingDAO;
import ivgroup.master.database.dto.geoMapPlotting.CompanyGeoMapPlotting;

@Service
public class CompanyGeoMapPlottingDAOImpl implements CompanyGeoMapPlottingDAO
{

	@Override
	public List<CompanyGeoMapPlotting> getComapnyByOwnerId(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyByOwner\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyGeoMapPlotting(
					rs.getLong("CompanyId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyGeoMapPlotting> getCompanyByCountry(Long ownerId, Long countryId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyByCountry\"(?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyGeoMapPlotting(
					rs.getLong("CompanyId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyGeoMapPlotting> getCompanyByState(Long ownerId, Long countryId, Long stateId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyByState\"(?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyGeoMapPlotting(
					rs.getLong("CompanyId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyGeoMapPlotting> getCompanyByCity(Long ownerId, Long countryId, Long stateId, Long cityId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyByCity\"(?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyGeoMapPlotting(
					rs.getLong("CompanyId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

}
