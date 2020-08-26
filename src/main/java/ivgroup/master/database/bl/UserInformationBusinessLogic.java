package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public User loadUserByEmailId(String emailId)
	{
		User user=new User("null","null",new ArrayList<>());
		try {
			UserInformation userInformation=userInformationDaoImpl.loadUserByEmailId(emailId);
			if(userInformation!=null)
			{
				System.out.println("hello I came in");
				user=new User(
						userInformation.getCorrespondingEmailId(),
						userInformation.getCorrespondingPassword(),
						new ArrayList<>());
			}
		} catch (ClassNotFoundException e) {
			return user;
		} catch (SQLException e) {
			return user;
		}
		return user;
	}
}
