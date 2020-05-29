package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import java.util.ArrayList;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.EmailLogDAO;
import ivgroup.master.database.dto.logs.EmailLogInsert;
import ivgroup.master.database.dto.logs.EmailLogSelect;

public class EmailLogDAOImpl implements EmailLogDAO
{

	@Override
	public Boolean addEmailLog(EmailLogInsert eli) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT logs.\"fn_insertEmailLog\"(?, ?, ?, ?, ?, ?); ");
		stmt.setLong(1, eli.getCompanyExecutiveId());
		stmt.setString(2, eli.getSubject());
		stmt.setString(3, eli.getBodyContent());
		stmt.setString(4, eli.getBodyContentType());
		stmt.setString(5, eli.getMailToType());
		stmt.setLong(6, eli.getPurposeId());
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertEmailLog");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public List<EmailLogSelect> selectPendingEmailLogs() throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM logs.\"fn_selectEmailLog\"();");
		List<EmailLogSelect> les=new ArrayList<EmailLogSelect>();
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			les.add(new EmailLogSelect(
					rs.getLong("EmailLogId"),
					rs.getLong("CompanyExecutiveId"),
					rs.getString("CompanyExecutiveName"),
					rs.getString("CompanyExecutiveEmailId"),
					rs.getString("Subject"),
					rs.getString("BodyContent"),
					rs.getString("BodyContentType"),
					rs.getString("MailToType"),
					rs.getLong("PurposeId"),
					rs.getString("PurposeTitle")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return les;
	}

}
