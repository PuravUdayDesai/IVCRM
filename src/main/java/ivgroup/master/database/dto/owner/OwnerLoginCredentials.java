package ivgroup.master.database.dto.owner;

import javax.validation.constraints.NotNull;

public class OwnerLoginCredentials {

	@NotNull(message = "UserName cannot be NULL")
	String userName;
	@NotNull(message = "Password cannot be NULL")
	String password;
	@NotNull(message = "SecretKey cannot be NULL")
	String secretKey;
	
	public OwnerLoginCredentials() {
		
	}

	public OwnerLoginCredentials(@NotNull(message = "UserName cannot be NULL") String userName,
			@NotNull(message = "Password cannot be NULL") String password,
			@NotNull(message = "SecretKey cannot be NULL") String secretKey) {
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
