package ivgroup.master.database.dto.google.people.api;

import javax.validation.constraints.NotNull;

public class GooglePeopleAPICredentials 
{
	@NotNull(message="ResouceName cannot be NULL")
	private String resourceName;
	@NotNull(message="ResouceName cannot be NULL")
	private String eTag;
	
	public GooglePeopleAPICredentials() {
		
	}

	public GooglePeopleAPICredentials(
			@NotNull(message = "ResouceName cannot be NULL") String resourceName,
			@NotNull(message = "ResouceName cannot be NULL") String eTag) {
		super();
		this.resourceName = resourceName;
		this.eTag = eTag;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String geteTag() {
		return eTag;
	}

	public void seteTag(String eTag) {
		this.eTag = eTag;
	}
	
}
