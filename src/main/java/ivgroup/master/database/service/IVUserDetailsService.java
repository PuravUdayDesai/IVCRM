package ivgroup.master.database.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import ivgroup.master.database.bl.UserInformationBusinessLogic;

@Service
public class IVUserDetailsService implements UserDetailsService
{

	@Autowired
	UserInformationBusinessLogic userInformationBusinessLogic;
	
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException
    {
       return userInformationBusinessLogic.loadUserByEmailId(userName);
    }
}
