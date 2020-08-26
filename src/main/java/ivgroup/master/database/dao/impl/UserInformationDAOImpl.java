package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.UserInformationDAO;
import ivgroup.master.database.dto.crmAccessList.UserInformation;

@Service
public class UserInformationDAOImpl implements UserInformationDAO{

	public UserInformation loadUserByEmailId(String emailId) throws SQLException,ClassNotFoundException
	{
		UserInformation userInformation = new UserInformation();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM public.\"fn_loadUserByEmailId\"(?)");
		stmt.setString(1, emailId);
		ResultSet rs=stmt.executeQuery();
		System.out.println(stmt);
		if(rs.next())
		{
			userInformation=new UserInformation(
					rs.getString("CorrespondingName"),
					rs.getString("CorrespondingEmailId"),
					rs.getString("CorrespondingPassword"),
					rs.getString("CorrespondingContactNumber"),
					rs.getInt("CorrespondingPosition"),
					rs.getBoolean("OwnerFlag")
					);
		}
		rs.close();
		stmt.close();
		c.close();
		return userInformation;
	}
	
}
