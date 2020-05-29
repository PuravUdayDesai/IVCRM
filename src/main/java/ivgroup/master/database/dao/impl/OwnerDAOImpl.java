package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import ivgroup.master.database.bl.OwnerBusinessLogic;
import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.OwnerDAO;
import ivgroup.master.database.dto.owner.OwnerCredentials;
import ivgroup.master.database.dto.owner.OwnerInsert;
import ivgroup.master.database.dto.owner.OwnerSelect;

@Service
public class OwnerDAOImpl implements OwnerDAO{

	@Override
	public OwnerSelect selectOwnerById(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"owner\".\"fn_selectOwnerContactByOwnerId\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		OwnerSelect os=null;
		while(rs.next())
		{
			os=new OwnerSelect(
					rs.getLong("id"),
					rs.getString("ownerName"),
					rs.getString("ownerContact"),
					rs.getString("ownerEmail"),
					rs.getString("UserName"),
					rs.getString("Password"),
					rs.getBoolean("isActive"),
					rs.getTimestamp("CreatedOn"),
					rs.getTimestamp("LastEditOn")
							);
		}
		rs.close();
		stmt.close();
		c.close();
		return os;
	}
	
	@Override
	public OwnerCredentials selectOwnerCredentials(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"owner\".\"fn_selectOwnerContactCredentials\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		OwnerCredentials os=null;
		while(rs.next())
		{
			os=new OwnerCredentials(
					rs.getString("ownerContact"),
					rs.getString("ownerEmail"),
					rs.getString("UserName")
									);
		}
		rs.close();
		stmt.close();
		c.close();
		return os;
	}

	@Override
	public Long loginOwner(String userName, String password, String secretKey)throws SQLException, ClassNotFoundException 
	{
		Long ownerId=null;
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"owner\".\"fn_loginOwnerContact\"(?,?,?);");
		stmt.setString(1, userName);
		stmt.setString(2, password);
		stmt.setString(3, secretKey);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()) {
			ownerId=rs.getLong("OwnerId");
		}
		rs.close();
		stmt.close();
		c.close();
		return ownerId;
	}
	
	@Override
	public Boolean updateOwnerOwnerName(Connection c, Long ownerId, String ownerName)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactownerName\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setString(2, ownerName);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactownerName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateOwnerOwnerContact(Connection c, Long ownerId, String ownerContact)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactownerContact\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setString(2, ownerContact);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactownerContact");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateOwnerOwnerEmail(Connection c, Long ownerId, String ownerEmail)throws SQLException, ClassNotFoundException
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactownerEmail\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setString(2, ownerEmail);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactownerEmail");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateOwnerOwnerSecretKey(Connection c, Long ownerId,String secretkey) throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactSecretKey\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setString(2, secretkey);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactSecretKey");
		}
		c.close();
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateOwnerIsActive(Connection c, Long ownerId, Boolean isActive)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactisActive\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setBoolean(2, isActive);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactisActive");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}
	
	@Override
	public Boolean updateOwnerOwnerUserName(Connection c, Long ownerId, String userName)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactUserName\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setString(2, userName);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactUserName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateOwnerOwnerPassword(Connection c, Long ownerId, String password)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactPassword\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setString(2, password);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactPassword");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateOwnerLastEditOn(Connection c, Long ownerId, Timestamp lastEditOn)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_updateOwnerContactLastEditOn\"(?,?)");
		stmt.setLong(1, ownerId);
		stmt.setTimestamp(2, lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateOwnerContactLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public String addOwner(OwnerInsert oi) throws SQLException, ClassNotFoundException 
	{
		String secretKey=OwnerBusinessLogic.generateSecretCode(oi.getOwnerContact());
		if(secretKey==null) {
			return secretKey;
		}
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"owner\".\"fn_insertOwnerContact\"(?, ?, ?, ?, ?, ?, ?);");
		stmt.setString(1, oi.getOwnerName());
		stmt.setString(2, oi.getOwnerContact());
		stmt.setString(3, oi.getOwnerEmail());
		stmt.setString(4, secretKey);
		stmt.setString(5, oi.getOwnerUserName());
		stmt.setString(6, oi.getOwnerPassword());
		stmt.setTimestamp(7, oi.getCreatedOn());
		System.out.println(stmt);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_insertOwnerContact");
		}
		if(!rsMain) {
			secretKey=null;
		}
		rs.close();
		stmt.close();
		return secretKey;
	}

	@Override
	public Boolean deleteOwner(Long ownerId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT  \"owner\".\"fn_deleteOwnerContact\"(?)");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteOwnerContact");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Long checkOwnerDeleteStatus(Long ownerId) throws SQLException, ClassNotFoundException {
		Long count=null;
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM owner.\"fn_checkOwnerDeleteStatus\"(?);");
		stmt.setLong(1, ownerId);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()) {
			count=rs.getLong("fn_checkOwnerDeleteStatus");
		}
		rs.close();
		stmt.close();
		c.close();
		return count;
	}


}
