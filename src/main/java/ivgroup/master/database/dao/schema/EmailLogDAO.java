package ivgroup.master.database.dao.schema;

import java.sql.SQLException;

import java.util.List;

import ivgroup.master.database.dto.logs.EmailLogInsert;
import ivgroup.master.database.dto.logs.EmailLogSelect;

public interface EmailLogDAO 
{
	public Boolean 			addEmailLog(EmailLogInsert eli)		throws SQLException,ClassNotFoundException;
	public List<EmailLogSelect> 	selectPendingEmailLogs()			throws SQLException,ClassNotFoundException;
}
