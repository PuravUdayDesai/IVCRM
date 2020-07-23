package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.ValidationDAO;

@Service
public class ValidationDAOImpl implements ValidationDAO
{

	@Override
	public Boolean checkForUserExistance(Long correspondingId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("");
		stmt.setLong(1, correspondingId);
		ResultSet rs=stmt.executeQuery();
		Boolean result=false;
		if(rs.next()) {
			result=rs.getBoolean("checkResult");
		}
		rs.close();
		stmt.close();
		c.close();
		return result;
	}

	@Override
	public Boolean checkForUserOperationValidity(Long correspondingId, Short masterId, Character operation)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("");
		stmt.setLong(1, correspondingId);
		stmt.setShort(2, masterId);
		stmt.setString(3, String.valueOf(operation));
		ResultSet rs=stmt.executeQuery();
		Boolean result=false;
		if(rs.next())
		{
			result=rs.getBoolean("checkResult");
		}
		rs.close();
		stmt.close();
		c.close();
		return result;
	}

}
