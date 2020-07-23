package ivgroup.master.database.dao.schema;

import java.sql.SQLException;

public interface ValidationDAO 
{
	public Boolean checkForUserExistance(Long correspondingId)												throws SQLException,ClassNotFoundException;
	public Boolean checkForUserOperationValidity(Long correspondingId,Short masterId,Character operation)	throws SQLException,ClassNotFoundException;
}
