package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.UserInformationDAOImpl;
import ivgroup.master.database.dto.crmAccessList.UserInformation;

@Service
public class UserInformationBusinessLogic 
{
	@Autowired
	UserInformationDAOImpl userInformationDaoImpl;
	
	Logger logger =LoggerFactory.getLogger(UserInformationBusinessLogic.class);
	
	public User loadUserByEmailId(String emailId)
	{
		User user=new User("null","null",new ArrayList<>());
		try {
			UserInformation userInformation=userInformationDaoImpl.loadUserByEmailId(emailId);
			if(userInformation!=null)
			{
				user=new User(
						userInformation.getCorrespondingEmailId(),
						userInformation.getCorrespondingPassword(),
						new ArrayList<>());
			}
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return user;
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return user;
		}
		return user;
	}
}
