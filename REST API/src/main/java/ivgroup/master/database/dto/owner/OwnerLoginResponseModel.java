package ivgroup.master.database.dto.owner;

import javax.validation.constraints.NotNull;

public class OwnerLoginResponseModel 
{
	@NotNull(message="OwnerId cannot be NULL")
	private Long ownerId;
	@NotNull(message="AccessToken cannot Be NULL")
	private String accessToken;
	
	public OwnerLoginResponseModel()
	{
		
	}
	
	public OwnerLoginResponseModel(Long ownerId, String accessToken) {
		super();
		this.ownerId = ownerId;
		this.accessToken = accessToken;
	}

	public Long getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	
}
