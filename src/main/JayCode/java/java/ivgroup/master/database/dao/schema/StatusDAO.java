package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.status.StatusInsert;
import ivgroup.master.database.dto.status.StatusSelect;

public interface StatusDAO
{
	public List<StatusSelect> 	selectStatusByCompanyId(Long companyId)											throws SQLException,ClassNotFoundException;
	public Boolean 				addStatus(StatusInsert si)														throws SQLException,ClassNotFoundException;
	public Boolean 				updateStatusStatusName(Connection c,Long statusId,String statusName)			throws SQLException,ClassNotFoundException;
	public Boolean 				updateStatusStatusColorCode(Connection c,Long statusId,String statusColorCode)	throws SQLException,ClassNotFoundException;
	public Boolean 				updateStatusWorkProgress(Connection c,Long statusId,Integer workProgress)		throws SQLException,ClassNotFoundException;
	public Boolean 				updateStatusCompanyId(Connection c,Long statusId,Long companyId)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateStatusLastEditBy(Connection c,Long statusId,Long lastEditBy)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateStatusLastEditOn(Connection c,Long statusId,Timestamp lastEditOn)			throws SQLException,ClassNotFoundException;
	public Boolean 				deleteStatus(Long statusId)														throws SQLException,ClassNotFoundException;
}
