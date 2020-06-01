package ivgroup.master.database.dto.area;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AreaUpdate {

	private String BusinessAreaName;

	private String BusinessAreaCode;
	
	private String BusinessAreaDescription;

	private Long CountryID;
	
	private Long StateID;
	
	private Long CityID;
	
	private Integer DeviceType;
	
	private Boolean IsActive;
	
	@NotEmpty(message = "LastEditOn cannot be NULL")	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp LastEditOn;
		
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long LastEditBy;
	
	@NotEmpty(message = "LastEditDeviceType cannot be NULL")
	Integer LastEditDeviceType;

	public String getBusinessAreaName() {
		return BusinessAreaName;
	}

	public void setBusinessAreaName(String businessAreaName) {
		BusinessAreaName = businessAreaName;
	}

	public String getBusinessAreaCode() {
		return BusinessAreaCode;
	}

	public void setBusinessAreaCode(String businessAreaCode) {
		BusinessAreaCode = businessAreaCode;
	}

	public String getBusinessAreaDescription() {
		return BusinessAreaDescription;
	}

	public void setBusinessAreaDescription(String businessAreaDescription) {
		BusinessAreaDescription = businessAreaDescription;
	}

	public Long getCountryID() {
		return CountryID;
	}

	public void setCountryID(Long countryID) {
		CountryID = countryID;
	}

	public Long getStateID() {
		return StateID;
	}

	public void setStateID(Long stateID) {
		StateID = stateID;
	}

	public Long getCityID() {
		return CityID;
	}

	public void setCityID(Long cityID) {
		CityID = cityID;
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

	public Boolean getIsActive() {
		return IsActive;
	}

	public void setIsActive(Boolean isActive) {
		IsActive = isActive;
	}
	
	public AreaUpdate(String businessAreaName, String businessAreaCode, String businessAreaDescription, Long countryID,
			Long stateID, Long cityID, Integer deviceType, Boolean isActive,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		BusinessAreaName = businessAreaName;
		BusinessAreaCode = businessAreaCode;
		BusinessAreaDescription = businessAreaDescription;
		CountryID = countryID;
		StateID = stateID;
		CityID = cityID;
		DeviceType = deviceType;
		IsActive = isActive;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public AreaUpdate() {}
}
