package ivgroup.master.database.dao.schema;

import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.priority.PrioritySelect;

public interface PriorityDAO
{
	public List<PrioritySelect>	 selectPriority()	throws SQLException,ClassNotFoundException;
}
