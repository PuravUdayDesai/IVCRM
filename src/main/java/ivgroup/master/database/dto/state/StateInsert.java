package ivgroup.master.database.dto.state;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StateInsert {
	
	@NotEmpty(message = "StateName cannot be NULL")
	private String StateName;

	@NotEmpty(message = "StateCode cannot be NULL")
	private String StateCode;

	@NotEmpty(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotEmpty(message = "StateDescription cannot be NULL")
	private String StateDescription;

	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp CreatedOn;

	@NotEmpty(message = "CreatedBy cannot be NULL")
	private Long CreatedBy;

	@NotEmpty(message = "DeviceType cannot be NULL")
	private Integer DeviceType;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp LastEditOn;
	
	private Long LastEditBy;
		
	private Integer LastEditDeviceType;

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

	public StateInsert(@NotEmpty(message = "StateName cannot be NULL") String stateName,
			@NotEmpty(message = "StateCode cannot be NULL") String stateCode,
			@NotEmpty(message = "CountryID cannot be NULL") Long countryID,
			@NotEmpty(message = "StateDescription cannot be NULL") String stateDescription,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "DeviceType cannot be NULL") Integer deviceType) {
		super();
		StateName = stateName;
		StateCode = stateCode;
		CountryID = countryID;
		StateDescription = stateDescription;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
	}
	
	public StateInsert() {}
}	
