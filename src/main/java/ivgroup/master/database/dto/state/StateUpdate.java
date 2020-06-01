package ivgroup.master.database.dto.state;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StateUpdate {

	private String StateName;

	private String StateCode;

	private Long CountryID;
	
	private String StateDescription;

	private Boolean IsActive;
		
	private Integer DeviceType;

	@NotEmpty(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp LastEditOn;
	
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long LastEditBy;
	
	@NotEmpty(message = "LastEditDeviceType cannot be NULL")
	Integer LastEditDeviceType;

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

	public StateUpdate(String stateName, String stateCode, Long countryID, String stateDescription, Boolean isActive,
			Integer deviceType, @NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		StateName = stateName;
		StateCode = stateCode;
		CountryID = countryID;
		StateDescription = stateDescription;
		IsActive = isActive;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}
	
	
	
}
