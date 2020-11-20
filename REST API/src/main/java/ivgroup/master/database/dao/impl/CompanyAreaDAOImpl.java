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
import ivgroup.master.database.dao.schema.CompanyAreaDAO;
import ivgroup.master.database.dto.companyArea.CompanyAreaInsert;
import ivgroup.master.database.dto.companyArea.CompanyAreaSelect;

@Service
public class CompanyAreaDAOImpl implements CompanyAreaDAO{
	@Override
	public Boolean addCompanyArea(CompanyAreaInsert cri) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_insertCompanyArea\"(? ,? ,? , ?, ?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, cri.getCompanyAreaName());
		stmt.setString(2, cri.getCompanyAreaCode());
		stmt.setString(3,cri.getCompanyAreaDescription());
		stmt.setLong(4, cri.getCompanyID());
		stmt.setLong(5, cri.getCompanyRegionID());
		stmt.setTimestamp(6, cri.getCreatedOn());
		stmt.setLong(7, cri.getCreatedBy());
		stmt.setInt(8, cri.getCreatedDeviceType());
		stmt.setTimestamp(9, cri.getCreatedOn());
		stmt.setLong(10, cri.getCreatedBy());
		stmt.setInt(11, cri.getCreatedDeviceType());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_insertCompanyArea");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public List<CompanyAreaSelect> selectCompanyArea() throws SQLException, ClassNotFoundException {
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyArea\"()");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyAreaSelect(
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getString("CompanyAreaDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public CompanyAreaSelect selectCompanyAreaByCompanyAreaID(Long companyAreaId) throws SQLException, ClassNotFoundException {
		CompanyAreaSelect cs=new CompanyAreaSelect();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyAreaByCompanyAreaID\"(?)");
		stmt.setLong(1, companyAreaId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			cs=new CompanyAreaSelect(
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getString("CompanyAreaDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getBoolean("IsActive")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return cs;
	}

	@Override
	public List<CompanyAreaSelect> selectCompanyAreaByCompanyID(Long companyId) throws SQLException, ClassNotFoundException {
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyAreaByCompanyID\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyAreaSelect(
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getString("CompanyAreaDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public List<CompanyAreaSelect> selectCompanyAreaByOwnerID(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyAreaByOwnerID\"(?)");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyAreaSelect(
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getString("CompanyAreaDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}
	
	@Override
	public List<CompanyAreaSelect> selectCompanyAreaByRegionID(Long regionId) throws SQLException, ClassNotFoundException {
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyAreaByCompanyRegionID\"(?)");
		stmt.setLong(1, regionId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyAreaSelect(
					rs.getLong("CompanyAreaID"),
					rs.getString("CompanyAreaName"),
					rs.getString("CompanyAreaCode"),
					rs.getString("CompanyAreaDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public Boolean updateCompanyAreaCompanyAreaName(Connection c,Long CompanyAreaId, String CompanyAreaName)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaCompanyAreaName\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setString(2, CompanyAreaName);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaCompanyAreaName");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAreaCompanyAreaCode(Connection c,Long CompanyAreaId, String CompanyAreaCode)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaCompanyAreaCode\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setString(2, CompanyAreaCode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaCompanyAreaCode");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAreaCompanyAreaDescription(Connection c,Long CompanyAreaId, String CompanyAreaDescription)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaCompanyAreaDescription\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setString(2, CompanyAreaDescription);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaCompanyAreaDescription");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAreaCompanyID(Connection c,Long CompanyAreaId, Long companyID)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaCompanyID\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setLong(2, companyID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaCompanyID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateCompanyAreaCompanyRegionID(Connection c, Long CompanyAreaId, Long companyRegionID)
			throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaCompanyRegionID\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setLong(2, companyRegionID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaCompanyRegionID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}
	@Override
	public Boolean updateCompanyAreaIsActive(Connection c,Long CompanyAreaId, Boolean isActive)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaIsActive\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaIsActive");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAreaLastEditOn(Connection c,Long CompanyAreaId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaLastEditOn\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaLastEditOn");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAreaLastEditBy(Connection c,Long CompanyAreaId, Long lastEditBy)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaLastEditBy\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaLastEditBy");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyAreaLastEditDeviceType(Connection c,Long CompanyAreaId, Integer lastEditDeviceType)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyAreaLastEditDeviceType\"(?,?)");
		stmt.setLong(1, CompanyAreaId);
		stmt.setInt(2, lastEditDeviceType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyAreaLastEditDeviceType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteCompanyArea(Long CompanyAreaId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_deleteCompanyArea\"(?)");
		stmt.setLong(1, CompanyAreaId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteCompanyArea");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean revokeCompanyArea(Long CompanyAreaId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_revokeCompanyArea\"(?)");
		stmt.setLong(1, CompanyAreaId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_revokeCompanyArea");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Integer checkCompanyAreaDeleteStatus(Long companyAreaID) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_checkCompanyAreaDeleteStatus\"(?)");
		stmt.setLong(1, companyAreaID);
		ResultSet rs=stmt.executeQuery();
		Integer result=0;
		if(rs.next())
		{
			result=rs.getInt("check");
		}
		rs.close();
		stmt.close();
		c.close();
		return result;
	}

	@Override
	public List<Long> selectCompanyAreaIdByCompanyRegionId(Long companyRegionId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyAreaIdByCompanyRegionId\"(?)");
		stmt.setLong(1, companyRegionId);
		ResultSet rs=stmt.executeQuery();
		List<Long> companyAreaIdList =new ArrayList<Long>();
		while(rs.next())
		{
			companyAreaIdList.add(rs.getLong("CompanyAreaId"));
		}
		rs.close();
		stmt.close();
		c.close();
		return companyAreaIdList;
	}

}
