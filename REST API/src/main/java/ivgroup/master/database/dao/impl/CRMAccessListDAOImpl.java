package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CRMAccessListDAO;

@Service
public class CRMAccessListDAOImpl implements CRMAccessListDAO
{

	@Override
	public Long checkExecutiveOwnerFlag(Long correspondingId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"public\".\"fn_checkExecutiveOwnerFlag\"(?);");
		stmt.setLong(1, correspondingId);
		ResultSet rs=stmt.executeQuery();
		Long count=null;
		if(rs.next())
		{
			count=rs.getLong("fn_checkExecutiveOwnerFlag");
		}
		rs.close();
		stmt.close();
		c.close();
		return count;
	}

}
