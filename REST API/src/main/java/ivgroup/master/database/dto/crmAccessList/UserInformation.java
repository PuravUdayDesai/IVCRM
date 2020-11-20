package ivgroup.master.database.dto.crmAccessList;

import javax.validation.constraints.NotNull;

public class UserInformation 
{
	@NotNull(message = "CorrespondingName cannot be NULL")
	private String correspondingName;
	@NotNull(message = "CorrespondingEmailId cannot be NULL")
	private String correspondingEmailId;
	@NotNull(message = "CorrespondingPassword cannot be NULL")
	private String correspondingPassword;
	@NotNull(message = "CorrespondingContactNumber cannot be NULL")
	private String correspondingContactNumber;
	@NotNull(message = "CorrespondingPosition cannot be NULL")
	private Integer correspondingPosition;
	@NotNull(message = "OwnerFlag cannot be NULL")
	private Boolean ownerFlag;
	
	public UserInformation() {
		
	}

	public UserInformation(
			@NotNull(message = "CorrespondingName cannot be NULL") String correspondingName,
			@NotNull(message = "CorrespondingEmailId cannot be NULL") String correspondingEmailId,
			@NotNull(message = "CorrespondingPassword cannot be NULL") String correspondingPassword,
			@NotNull(message = "CorrespondingContactNumber cannot be NULL") String correspondingContactNumber,
			@NotNull(message = "CorrespondingPosition cannot be NULL") Integer correspondingPosition,
			@NotNull(message = "OwnerFlag cannot be NULL") Boolean ownerFlag) {
		super();
		this.correspondingName = correspondingName;
		this.correspondingEmailId = correspondingEmailId;
		this.correspondingPassword = correspondingPassword;
		this.correspondingContactNumber = correspondingContactNumber;
		this.correspondingPosition = correspondingPosition;
		this.ownerFlag = ownerFlag;
	}

	public String getCorrespondingName() {
		return correspondingName;
	}

	public void setCorrespondingName(String correspondingName) {
		this.correspondingName = correspondingName;
	}

	public String getCorrespondingEmailId() {
		return correspondingEmailId;
	}

	public void setCorrespondingEmailId(String correspondingEmailId) {
		this.correspondingEmailId = correspondingEmailId;
	}

	public String getCorrespondingPassword() {
		return correspondingPassword;
	}

	public void setCorrespondingPassword(String correspondingPassword) {
		this.correspondingPassword = correspondingPassword;
	}

	public String getCorrespondingContactNumber() {
		return correspondingContactNumber;
	}

	public void setCorrespondingContactNumber(String correspondingContactNumber) {
		this.correspondingContactNumber = correspondingContactNumber;
	}

	public Integer getCorrespondingPosition() {
		return correspondingPosition;
	}

	public void setCorrespondingPosition(Integer correspondingPosition) {
		this.correspondingPosition = correspondingPosition;
	}

	public Boolean getOwnerFlag() {
		return ownerFlag;
	}

	public void setOwnerFlag(Boolean ownerFlag) {
		this.ownerFlag = ownerFlag;
	}
	
}
