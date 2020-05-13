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
import ivgroup.master.database.dao.schema.CompanyRegionDAO;
import ivgroup.master.database.dto.companyRegion.CompanyRegionInsert;
import ivgroup.master.database.dto.companyRegion.CompanyRegionSelect;

@Service
public class CompanyRegionDAOImpl implements CompanyRegionDAO{

	@Override
	public Boolean addCompanyRegion(CompanyRegionInsert cri) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_insertCompanyRegion\"(? ,? ,? , ?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, cri.getCompanyRegionName());
		stmt.setString(2, cri.getCompanyRegionCode());
		stmt.setString(3,cri.getCompanyRegionDescription());
		stmt.setLong(4, cri.getCompanyID());
		stmt.setTimestamp(5, cri.getCreatedOn());
		stmt.setLong(6, cri.getCreatedBy());
		stmt.setInt(7, cri.getCreatedDeviceType());
		stmt.setTimestamp(8, cri.getCreatedOn());
		stmt.setLong(9, cri.getCreatedBy());
		stmt.setInt(10, cri.getCreatedDeviceType());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_insertCompanyRegion");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}
	
	@Override
	public List<CompanyRegionSelect> selectCompanyRegion() throws SQLException, ClassNotFoundException {
		List<CompanyRegionSelect> lcs=new ArrayList<CompanyRegionSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyRegion\"()");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyRegionSelect(
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getString("CompanyRegionDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}

	@Override
	public CompanyRegionSelect selectCompanyRegionByCompanyRegionID(Long companyRegionId) throws SQLException, ClassNotFoundException {
		CompanyRegionSelect cs=new CompanyRegionSelect();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyRegionByCompanyRegionID\"(?)");
		stmt.setLong(1, companyRegionId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			cs=new CompanyRegionSelect(
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getString("CompanyRegionDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("IsActive")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return cs;
	}

	@Override
	public List<CompanyRegionSelect> selectCompanyRegionByCompanyID(Long companyId) throws SQLException, ClassNotFoundException {
		List<CompanyRegionSelect> lcs=new ArrayList<CompanyRegionSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyRegionByCompanyID\"(?)");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyRegionSelect(
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getString("CompanyRegionDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}
	
	
	@Override
	public List<CompanyRegionSelect> selectCompanyRegionByOwnerID(Long ownerId)throws SQLException, ClassNotFoundException 
	{
		List<CompanyRegionSelect> lcs=new ArrayList<CompanyRegionSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyRegionByOwnerID\"(?)");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			lcs.add(new CompanyRegionSelect(
					rs.getLong("CompanyRegionID"),
					rs.getString("CompanyRegionName"),
					rs.getString("CompanyRegionCode"),
					rs.getString("CompanyRegionDescription"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getBoolean("IsActive")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcs;
	}
	
	@Override
	public Boolean updateCompanyRegionCompanyRegionName(Connection c,Long companyRegionId, String companyRegionName)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionCompanyRegionName\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setString(2, companyRegionName);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionCompanyRegionName");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionCompanyRegionCode(Connection c,Long companyRegionId, String companyRegionCode)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionCompanyRegionCode\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setString(2, companyRegionCode);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionCompanyRegionCode");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionCompanyRegionDescription(Connection c,Long companyRegionId, String companyRegionDescription)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionCompanyRegionDescription\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setString(2, companyRegionDescription);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionCompanyRegionDescription");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionCompanyID(Connection c,Long companyRegionId, Long companyID)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionCompanyID\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setLong(2, companyID);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionCompanyID");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionIsActive(Connection c,Long companyRegionId, Boolean isActive)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionIsActive\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionIsActive");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionLastEditOn(Connection c,Long companyRegionId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionLastEditOn\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionLastEditOn");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionLastEditBy(Connection c,Long companyRegionId, Long lastEditBy)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionLastEditBy\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setLong(2, lastEditBy);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionLastEditBy");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateCompanyRegionLastEditDeviceType(Connection c,Long companyRegionId, Integer lastEditDeviceType)throws SQLException, ClassNotFoundException {
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyRegionLastEditDeviceType\"(?,?)");
		stmt.setLong(1, companyRegionId);
		stmt.setInt(2, lastEditDeviceType);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateCompanyRegionLastEditDeviceType");
		}
		c.commit();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean deleteCompanyRegion(Long companyRegionId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_deleteCompanyRegion\"(?)");
		stmt.setLong(1, companyRegionId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteCompanyRegion");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean revokeCompanyRegion(Long companyRegionId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_revokeCompanyRegion\"(?)");
		stmt.setLong(1, companyRegionId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_revokeCompanyRegion");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Long checkCompanyRegionDeleteStatus(Long companyRegionId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_checkCompanyRegionDeleteStatus\"(?)");
		stmt.setLong(1, companyRegionId);
		Long check=(long)-1;
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			check=rs.getLong("Check");
		}
		rs.close();
		stmt.close();
		c.close();
		return check;
	}
}
