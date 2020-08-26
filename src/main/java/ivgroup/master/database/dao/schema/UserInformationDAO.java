package ivgroup.master.database.dao.schema;

import java.sql.SQLException;

import ivgroup.master.database.dto.crmAccessList.UserInformation;

public interface UserInformationDAO {

	public UserInformation loadUserByEmailId(String emailId)	throws SQLException,ClassNotFoundException;
	
}
