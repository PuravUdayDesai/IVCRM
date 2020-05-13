package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.PositionDAO;
import ivgroup.master.database.dto.position.PositionCompanyExecutiveMasterListInsert;
import ivgroup.master.database.dto.position.PositionInsert;
import ivgroup.master.database.dto.position.PositionSelect;

@Service
public class PositionDAOImpl implements PositionDAO
{

	public Long getExecutivePriority(Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_selectCompanyExecutivePositionPriority\"(?);");
		stmt.setLong(1, companyExecutiveId);
		Long previousPosition=null;
		ResultSet rs=stmt.executeQuery();
		if(rs.next())
		{
			previousPosition=rs.getLong("PositionPriority");
		}
		rs.close();
		stmt.close();
		c.close();
		return previousPosition;
	}
	
	@Override
	public List<PositionSelect> selectPosition(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"position\".\"fn_selectPositions\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		List<PositionSelect> lps=new ArrayList<PositionSelect>();
		while(rs.next())
		{
			lps.add(new PositionSelect(
					 rs.getLong("id"),
					 rs.getString("PositionName"),
					 rs.getInt("PositionPriority"),
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyName"),
					 rs.getLong("CreatedBy"),
					 rs.getTimestamp("CreatedOn"),
					 rs.getLong("LastEditBy"),
					 rs.getTimestamp("LastEditOn"),
					 rs.getBoolean("isActive"),
					 rs.getString("Company"),
					 rs.getString("CompanyBranch"),
					 rs.getString("CompanyExecutive"),
					 rs.getString("Client"),
					 rs.getString("Product"),
					 rs.getString("Location"),
					 rs.getString("Enquiry"),
					 rs.getString("Ticket"),
					 rs.getString("Position")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lps;
	}

	@Override
	public PositionSelect selectPositionByPositionId(Long positionId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"position\".\"fn_selectPositionsByPositionId\"(?,?);");
		stmt.setLong(1, positionId);
		ResultSet rs=stmt.executeQuery();
		PositionSelect ps=null;
		while(rs.next())
		{
			ps=new PositionSelect(
					 rs.getLong("id"),
					 rs.getString("PositionName"),
					 rs.getInt("PositionPriority"),
					 rs.getLong("CompanyId"),
					 rs.getString("CompanyName"),
					 rs.getLong("CreatedBy"),
					 rs.getTimestamp("CreatedOn"),
					 rs.getLong("LastEditBy"),
					 rs.getTimestamp("LastEditOn"),
					 rs.getBoolean("isActive"),
					 rs.getString("Company"),
					 rs.getString("CompanyBranch"),
					 rs.getString("CompanyExecutive"),
					 rs.getString("Client"),
					 rs.getString("Product"),
					 rs.getString("Location"),
					 rs.getString("Enquiry"),
					 rs.getString("Ticket"),
					 rs.getString("Position")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return ps;
	}

	@Override
	public Boolean addPosition(PositionInsert pi) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"position\".\"fn_insertPositions\"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, pi.getPositionName());
		stmt.setInt(2, pi.getPositionPriority());
		stmt.setLong(3, pi.getCompanyId());
		stmt.setLong(4, pi.getCreatedBy());
		stmt.setTimestamp(5, pi.getCreatedOn());
		stmt.setString(6, pi.getCompany().toUpperCase());
		stmt.setString(7, pi.getCompanyBranch().toUpperCase());
		stmt.setString(8, pi.getCompanyExecutive().toUpperCase());
		stmt.setString(9, pi.getClient().toUpperCase());
		stmt.setString(10, pi.getProduct().toUpperCase());
		stmt.setString(11, pi.getLocation().toUpperCase());
		stmt.setString(12, pi.getEnquiry().toUpperCase());
		stmt.setString(13, pi.getTicket().toUpperCase());
		stmt.setString(14, pi.getPosition().toUpperCase());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertPositions");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Long addCompanyExecutiveMasterList(PositionCompanyExecutiveMasterListInsert pei)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"position\".\"fn_insertCompanyExecutiveMasterList\"(?, ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, pei.getCompany().toUpperCase());
		stmt.setString(2, pei.getCompanyBranch().toUpperCase());
		stmt.setString(3, pei.getCompanyExecutive().toUpperCase());
		stmt.setString(4, pei.getClient().toUpperCase());
		stmt.setString(5, pei.getProduct().toUpperCase());
		stmt.setString(6, pei.getLocation().toUpperCase());
		stmt.setString(7, pei.getEnquiry().toUpperCase());
		stmt.setString(8, pei.getTicket().toUpperCase());
		stmt.setString(9, pei.getPosition().toUpperCase());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Long idForAccess=null;
		if(rs.next())
		{
			idForAccess=rs.getLong("idForAccess");
		}
		rs.close();
		stmt.close();
		c.close();
		return idForAccess;
	}

	@Override
	public Boolean updatePositionName(Connection c, Long positionId, String positionName)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsPositionName\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setString(2, positionName);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsPositionName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updatePositionPriority(Connection c, Long positionId, Integer positionPriority)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsPositionPriority\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setInt(2, positionPriority);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsPositionPriority");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updatePositionCompanyId(Connection c, Long positionId, Long companyId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsCompanyId\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setLong(2, companyId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsCompanyId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updatePositionExecutiveMasterId(Connection c, Long positionId, Long companyExecutiveMasterId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsExecutiveMasterId\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setLong(2, companyExecutiveMasterId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsExecutiveMasterId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updatePositionIsActive(Connection c, Long positionId, Boolean isActive)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsisActive\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsisActive");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updatePositionLastEditBy(Connection c, Long positionId, Long lastEditBy)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsLastEditBy\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updatePositionLastEditOn(Connection c, Long positionId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_updatePositionsLastEditOn\"(?,?)");
		stmt.setLong(1, positionId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_updatePositionsLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}	

	@Override
	public Boolean deletePosition(Long positionId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"position\".\"fn_deletePositions\"(?);");
		stmt.setLong(1, positionId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_deletePositions");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Integer checkPositionDeleteStatus(Long positionId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"position\".\"fn_checkPositionDeleteStatus\"(?);");
		stmt.setLong(1, positionId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Integer check=null;
		if(rs.next())
		{
			check=rs.getInt("Check");
		}
		rs.close();
		stmt.close();
		return check;
	}

}
