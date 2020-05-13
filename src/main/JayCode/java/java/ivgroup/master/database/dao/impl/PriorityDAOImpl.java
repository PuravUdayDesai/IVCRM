package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.PriorityDAO;
import ivgroup.master.database.dto.priority.PrioritySelect;

@Service
public class PriorityDAOImpl implements PriorityDAO
{

	@Override
	public List<PrioritySelect> selectPriority() throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"priority\".\"fn_selectPriority\"();");
		ResultSet rs=stmt.executeQuery();
		List<PrioritySelect> lps=new ArrayList<PrioritySelect>();
		while(rs.next())
		{
			lps.add(new PrioritySelect(
					rs.getLong("PriorityId"),
					rs.getString("PriorityName"),
					rs.getShort("PriorityPosition")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lps;
	}

}
