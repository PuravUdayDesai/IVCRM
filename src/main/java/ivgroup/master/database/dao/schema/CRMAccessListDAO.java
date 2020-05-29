package ivgroup.master.database.dao.schema;

import java.sql.SQLException;

public interface CRMAccessListDAO
{
	public Long 	checkExecutiveOwnerFlag(Long correspondingId)	throws SQLException,ClassNotFoundException;
}
