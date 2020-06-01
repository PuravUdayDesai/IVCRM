package ivgroup.master.database.dto.owner;

import javax.validation.constraints.NotEmpty;

public class OwnerLoginCredentials {

	@NotEmpty(message = "UserName cannot be NULL")
	String userName;
	@NotEmpty(message = "Password cannot be NULL")
	String password;
	@NotEmpty(message = "SecretKey cannot be NULL")
	String secretKey;
	
	public OwnerLoginCredentials() {
		
	}

	public OwnerLoginCredentials(@NotEmpty(message = "UserName cannot be NULL") String userName,
			@NotEmpty(message = "Password cannot be NULL") String password,
			@NotEmpty(message = "SecretKey cannot be NULL") String secretKey) {
		super();
		this.userName = userName;
		this.password = password;
		this.secretKey = secretKey;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecretKey() {
		return secretKey;
	}

	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}

}
