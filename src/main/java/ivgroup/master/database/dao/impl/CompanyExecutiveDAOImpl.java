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
import ivgroup.master.database.dao.schema.CompanyExecutiveDAO;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveInsert;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveLogin;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveSelect;


@Service
public class CompanyExecutiveDAOImpl implements CompanyExecutiveDAO{
	
	@Override
	public Boolean addCompanyExecutive(CompanyExecutiveInsert cei) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_insertCompanyExecutive\"(?,?,?,?,?,?,?,?,?,?);");
		stmt.setString(1, cei.getExecutiveName());
		stmt.setString(2, cei.getLoginId());
		stmt.setString(3, cei.getPassword());
		stmt.setLong(4, cei.getCompanyBranchId());
		stmt.setLong(5, cei.getBaseCityId());
		stmt.setLong(6, cei.getCompanyId());
		stmt.setString(7, cei.getContactNumber());
		stmt.setTimestamp(8, cei.getCreatedOn());
		stmt.setLong(9, cei.getCreatedBy());
		stmt.setInt(10, cei.getCreatedDeviceType());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_insertCompanyExecutive");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}
	
	
	@Override
	public List<CompanyExecutiveSelect> selectCompanyExecutive() throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutive\"()");
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			lce.add(new CompanyExecutiveSelect(
					rs.getString("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("LoginID"),
					rs.getString("Password"),
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lce;
	}

	@Override
	public CompanyExecutiveSelect selectCompanyExecutiveByCompanyExecutiveId(Long companyExecutiveID)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutiveByCompanyExecutiveId\"(?)");
		stmt.setLong(1, companyExecutiveID);
		CompanyExecutiveSelect ce=new CompanyExecutiveSelect();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			ce=new CompanyExecutiveSelect(
					rs.getString("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("LoginID"),
					rs.getString("Password"),
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					);
			
		}
		rs.close();
		stmt.close();
		c.close();
		return ce;
	}

	@Override
	public List<CompanyExecutiveSelect> selectCompanyExecutiveByCompanyId(Long companyId)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutiveByCompanyId\"(?)");
		stmt.setLong(1, companyId);
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			lce.add(new CompanyExecutiveSelect(
					rs.getString("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("LoginID"),
					rs.getString("Password"),
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lce;
	}

	@Override
	public List<CompanyExecutiveSelect> selectCompanyExecutiveByOwnerId(Long ownerId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutiveByOwnerID\"(?)");
		stmt.setLong(1, ownerId);
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			lce.add(new CompanyExecutiveSelect(
					rs.getString("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("LoginID"),
					rs.getString("Password"),
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lce;
	}
	
	@Override
	public List<CompanyExecutiveSelect> selectCompanyExecutiveByCompanyBranchId(Long companyBranchId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutiveByCompanyBranchId\"(?)");
		stmt.setLong(1, companyBranchId);
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			lce.add(new CompanyExecutiveSelect(
					rs.getString("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("LoginID"),
					rs.getString("Password"),
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lce;
	}
	
	@Override
	public List<CompanyExecutiveSelect> selectCompanyExecutiveOfSubPosition(Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutiveOfLowerPosition\"(?);");
		stmt.setLong(1, companyExecutiveId);
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			lce.add(new CompanyExecutiveSelect(
					rs.getString("ExecutiveId"),
					rs.getString("ExecutiveName"),
					rs.getString("LoginID"),
					rs.getString("Password"),
					rs.getLong("CompanyBranchID"),
					rs.getString("CompanyBranchName"),
					rs.getString("CompanyBranchCode"),
					rs.getLong("CityID"),
					rs.getString("CityName"),
					rs.getLong("CompanyID"),
					rs.getString("CompanyName"),
					rs.getString("CompanyCode"),
					rs.getString("ContactNumber"),
					rs.getBoolean("IsActive")
					));
			
		}
		rs.close();
		stmt.close();
		c.close();
		return lce;
	}

	
	@Override
	public Boolean updateCompanyExecutiveExecutiveName(Connection c, Long companyExecutiveId, String executiveName)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveExecutiveName\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setString(2, executiveName);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveExecutiveName");
	}
	c.commit();
	rs.close();
	stmt.close();
	c.close();
	return rsMain;
	}

	@Override
	public Boolean updateCompanyExecutiveLoginID(Connection c, Long companyExecutiveId, String loginID)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveLoginID\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setString(2, loginID);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveLoginID");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutivePassword(Connection c, Long companyExecutiveId, String password)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutivePassword\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setString(2, password);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutivePassword");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveCompanyBranchID(Connection c, Long companyExecutiveId, Long companyBranchID)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveCompanyBranchID\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setLong(2, companyBranchID);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveCompanyBranchID");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveBaseCityID(Connection c, Long companyExecutiveId, Long baseCityID)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveBaseCityID\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setLong(2, baseCityID);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveBaseCityID");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveCompanyID(Connection c, Long companyExecutiveId, Long companyID)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveCompanyID\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setLong(2, companyID);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveCompanyID");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveContactNumber(Connection c, Long companyExecutiveId, String contactNumber)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveContactNumber\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setString(2, contactNumber);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveContactNumber");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveIsActive(Connection c, Long companyExecutiveId, Boolean isActive)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveIsActive\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setBoolean(2, isActive);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveIsActive");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveLastEditOn(Connection c, Long companyExecutiveId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveLastEditOn\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setTimestamp(2, lastEditOn);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveLastEditOn");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveLastEditBy(Connection c, Long companyExecutiveId, Long lastEditBy)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveLastEditBy\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setLong(2, lastEditBy);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveLastEditBy");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain; 
	}

	@Override
	public Boolean updateCompanyExecutiveLastEditDeviceType(Connection c, Long companyExecutiveId, Integer lastEditDeviceType)throws SQLException, ClassNotFoundException {
	CallableStatement stmt=c.prepareCall("SELECT company.\"fn_updateCompanyExecutiveLastEditDeviceType\"(?,?);");
	stmt.setLong(1, companyExecutiveId);
	stmt.setInt(2, lastEditDeviceType);
	ResultSet rs=stmt.executeQuery();
	Boolean rsMain=false;
	if(rs.next()) {
		rsMain=rs.getBoolean("fn_updateCompanyExecutiveLastEditDeviceType");
	}
	c.commit();
	rs.close();
	stmt.close();
	return rsMain;
	}


	@Override
	public Boolean deleteCompanyExecutive(Long companyExecutiveId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_deleteCompanyExecutive\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteCompanyExecutive");
		}
		c.commit();
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Long checkCompanyExecutiveDeleteDependency(Long companyExecutiveID)throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_checkCompanyExecutiveDeleteDependency\"(?);");
		stmt.setLong(1, companyExecutiveID);
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


	@Override
	public Long checkCompanyExecutiveDeleteStatus(Long companyId) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_checkCompanyExecutiveDeleteStatus\"(?);");
		stmt.setLong(1, companyId);
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


	@Override
	public CompanyExecutiveLogin loginCompanyExecutive(String loginId, String password)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_loginCompanyExecutive\"(?,?);");
		stmt.setString(1, loginId);
		stmt.setString(2, password);
		ResultSet rs=stmt.executeQuery();
		CompanyExecutiveLogin cel=null;
		while(rs.next())
		{
			cel=new CompanyExecutiveLogin(
					rs.getLong("CompanyExecutiveId"),
					rs.getLong("OwnerId"),
					rs.getLong("CompanyId"),
					rs.getInt("Company"),
					rs.getInt("CompanyBranch"),
					rs.getInt("CompanyExecutive"),
					rs.getInt("Client"),
					rs.getInt("Product"),
					rs.getInt("Location"),
					rs.getInt("Enquiry"),
					rs.getInt("Ticket"),
					rs.getInt("Position")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return cel;
	}


	@Override
	public Long selectOwnerIdByCompanyExecutiveId(Long companyExecutiveID) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_selectOwnerIdByCompanyExecutiveId\"(?);");
		stmt.setLong(1, companyExecutiveID);
		ResultSet rs=stmt.executeQuery();
		Long ownerId=null;
		if(rs.next())
		{
			ownerId=rs.getLong("OwnerId");
		}
		rs.close();
		stmt.close();
		c.close();
		return ownerId;
	}


	@Override
	public Long getOwnerIdByCompanyExecutiveId(Long companyExecutiveId) throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_getOwnerIdByExecutiveId\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		Long ownerId=null;
		if(rs.next())
		{
			ownerId=rs.getLong("OwnerId");
		}
		rs.close();
		stmt.close();
		c.close();
		return ownerId;
	}

}
