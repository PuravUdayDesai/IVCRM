package ivgroup.master.database.dto.companyExecutive;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

public class CompanyExecutiveLoginRequest 
{
	@NotNull(message="loginId cannot be NULL")
	@Email(message="Please Enter Valid EmailId")
	private String loginId;
	@NotNull(message="password cannot be NULL")
	private String password;
	
	public CompanyExecutiveLoginRequest()
	{
	}
	
	public CompanyExecutiveLoginRequest(
			@NotNull(message = "loginId cannot be NULL") String loginId,
			@NotNull(message = "password cannot be NULL") String password) {
		super();
		this.loginId = loginId;
		this.password = password;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
