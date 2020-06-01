package ivgroup.master.database.dto.state;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

public class State {
	
	@NotEmpty(message = "StateID cannot be NULL")
	private long StateID;

	@NotEmpty(message = "StateName cannot be NULL")
	private String StateName;

	@NotEmpty(message = "StateCode cannot be NULL")
	private String StateCode;

	@NotEmpty(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotEmpty(message = "CountryName cannot be NULL")
	private String CountryName;
	
	@NotEmpty(message = "StateDescription cannot be NULL")
	private String StateDescription;

	@NotEmpty(message = "IsActive cannot be NULL")
	private Boolean IsActive;

	@NotEmpty(message = "CreatedOn cannot be NULL")	
	private Timestamp CreatedOn;

	@NotEmpty(message = "CreatedBy cannot be NULL")
	private Long CreatedBy;

	@NotEmpty(message = "DeviceType cannot be NULL")
	private Integer DeviceType;

	@NotEmpty(message = "LastEditOn cannot be NULL")	
	Timestamp LastEditOn;
	
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long LastEditBy;
	
	@NotEmpty(message = "LastEditDeviceType cannot be NULL")
	Integer LastEditDeviceType;

	public long getStateID() {
		return StateID;
	}

	public void setStateID(long stateID) {
		StateID = stateID;
	}

	public String getStateName() {
		return StateName;
	}

	public void setStateName(String stateName) {
		StateName = stateName;
	}

	public String getStateCode() {
		return StateCode;
	}

	public void setStateCode(String stateCode) {
		StateCode = stateCode;
	}

	public Long getCountryID() {
		return CountryID;
	}

	public void setCountryID(Long countryID) {
		CountryID = countryID;
	}

	public String getCountryName() {
		return CountryName;
	}

	public void setCountryName(String countryName) {
		CountryName = countryName;
	}

	public String getStateDescription() {
		return StateDescription;
	}

	public void setStateDescription(String stateDescription) {
		StateDescription = stateDescription;
	}

	public Boolean getIsActive() {
		return IsActive;
	}

	public void setIsActive(Boolean isActive) {
		IsActive = isActive;
	}

	public Timestamp getCreatedOn() {
		return CreatedOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		CreatedOn = createdOn;
	}

	public Long getCreatedBy() {
		return CreatedBy;
	}

	public void setCreatedBy(Long createdBy) {
		CreatedBy = createdBy;
	}

	public Integer getDeviceType() {
		return DeviceType;
	}

	public void setDeviceType(Integer deviceType) {
		DeviceType = deviceType;
	}

	public Timestamp getLastEditOn() {
		return LastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		LastEditOn = lastEditOn;
	}

	public Long getLastEditBy() {
		return LastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		LastEditBy = lastEditBy;
	}

	public Integer getLastEditDeviceType() {
		return LastEditDeviceType;
	}

	public void setLastEditDeviceType(Integer lastEditDeviceType) {
		LastEditDeviceType = lastEditDeviceType;
	}

	public State(@NotEmpty(message = "StateID cannot be NULL") long stateID,
			@NotEmpty(message = "StateName cannot be NULL") String stateName,
			@NotEmpty(message = "StateCode cannot be NULL") String stateCode,
			@NotEmpty(message = "CountryID cannot be NULL") Long countryID,
			@NotEmpty(message = "CountryName cannot be NULL") String countryName,
			@NotEmpty(message = "StateDescription cannot be NULL") String stateDescription,
			@NotEmpty(message = "IsActive cannot be NULL") Boolean isActive,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "DeviceType cannot be NULL") Integer deviceType,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		StateID = stateID;
		StateName = stateName;
		StateCode = stateCode;
		CountryID = countryID;
		CountryName = countryName;
		StateDescription = stateDescription;
		IsActive = isActive;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;		
	}
	
	public State() {}
	
}
