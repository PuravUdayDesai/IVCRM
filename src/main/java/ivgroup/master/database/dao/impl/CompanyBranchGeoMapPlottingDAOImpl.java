package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyBranchGeoMapPlottingDAO;
import ivgroup.master.database.dto.geoMapPlotting.CompanyBranchGeoMapPlotting;

@Service
public class CompanyBranchGeoMapPlottingDAOImpl implements CompanyBranchGeoMapPlottingDAO
{

	@Override
	public List<CompanyBranchGeoMapPlotting> getCompaynBranchByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyBranchByOwner\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyBranchGeoMapPlotting(
					rs.getLong("CompanyBranchId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getString("CompanyName"),
					rs.getBoolean("MarkForDelete")
												));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyBranchGeoMapPlotting> getCompanyBranchByCompanyId(Long companyId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyBranchByCompany\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyBranchGeoMapPlotting(
					rs.getLong("CompanyBranchId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getString("CompanyName"),
					rs.getBoolean("MarkForDelete")
												));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyBranchGeoMapPlotting> getCompanyBranchByCountryId(Long ownerId, Long countryId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyBranchByCountry\"(?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyBranchGeoMapPlotting(
					rs.getLong("CompanyBranchId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getString("CompanyName"),
					rs.getBoolean("MarkForDelete")
												));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyBranchGeoMapPlotting> getCompanyBranchByStateId(Long ownerId, Long countryId, Long stateId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyBranchByState\"(?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyBranchGeoMapPlotting(
					rs.getLong("CompanyBranchId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getString("CompanyName"),
					rs.getBoolean("MarkForDelete")
												));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<CompanyBranchGeoMapPlotting> getCompanyBranchByCityId(Long ownerId, Long countryId, Long stateId,Long cityId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectCompanyBranchByCity\"(?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new CompanyBranchGeoMapPlotting(
					rs.getLong("CompanyBranchId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getString("CompanyName"),
					rs.getBoolean("MarkForDelete")
												));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

}
