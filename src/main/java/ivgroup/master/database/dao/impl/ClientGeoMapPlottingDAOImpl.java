package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.ClientGeoMapPlottingDAO;
import ivgroup.master.database.dto.geoMapPlotting.ClientGeoMapPlotting;

@Service
public class ClientGeoMapPlottingDAOImpl implements ClientGeoMapPlottingDAO
{

	@Override
	public List<ClientGeoMapPlotting> getClientGeoMapByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectClientByOwner\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new ClientGeoMapPlotting(
					rs.getLong("ClientId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<ClientGeoMapPlotting> getClientGeoMapByCompanyId(Long companyId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectClientByCompany\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new ClientGeoMapPlotting(
					rs.getLong("ClientId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<ClientGeoMapPlotting> getClientGeoMapByCountryId(Long ownerId, Long countryId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectClientByCountry\"(?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		ResultSet rs=stmt.executeQuery();
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new ClientGeoMapPlotting(
					rs.getLong("ClientId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<ClientGeoMapPlotting> getClientGeoMapByStateId(Long ownerId, Long countryId, Long stateId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectClientByState\"(?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		ResultSet rs=stmt.executeQuery();
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new ClientGeoMapPlotting(
					rs.getLong("ClientId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<ClientGeoMapPlotting> getClientGeoMapByCityId(Long ownerId, Long countryId, Long stateId, Long cityId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectClientByCity\"(?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		ResultSet rs=stmt.executeQuery();
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new ClientGeoMapPlotting(
					rs.getLong("ClientId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

	@Override
	public List<ClientGeoMapPlotting> getClientGeoMapByAreaId(Long ownerId, Long countryId, Long stateId, Long cityId,Long areaId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"geoMapPlotting\".\"fn_selectClientByArea\"(?,?,?,?,?);");
		stmt.setLong(1, ownerId);
		stmt.setLong(2, countryId);
		stmt.setLong(3, stateId);
		stmt.setLong(4, cityId);
		stmt.setLong(5, areaId);
		ResultSet rs=stmt.executeQuery();
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		while(rs.next())
		{
			ll.add(new ClientGeoMapPlotting(
					rs.getLong("ClientId"),
					rs.getString("Latitude"),
					rs.getString("Longitude"),
					rs.getString("ContactName"),
					rs.getString("ContactPerson"),
					rs.getString("EmailId"),
					rs.getString("ContactNumber"),
					rs.getBoolean("MarkForDelete")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return ll;
	}

}
