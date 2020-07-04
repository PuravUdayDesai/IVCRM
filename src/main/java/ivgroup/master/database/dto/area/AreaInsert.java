package ivgroup.master.database.dto.area;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AreaInsert {

	@NotNull(message = "BusinessAreaName cannot be NULL")
	private String BusinessAreaName;

	@NotNull(message = "BusinessAreaCode cannot be NULL")
	private String BusinessAreaCode;
	
	@NotNull(message = "BusinessAreaDescription cannot be NULL")
	private String BusinessAreaDescription;

	@NotNull(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotNull(message = "StateID cannot be NULL")
	private Long StateID;
	
	@NotNull(message = "CityID cannot be NULL")
	private Long CityID;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@NotNull(message = "CreatedOn cannot be NULL")	
	@PastOrPresent
	private Timestamp CreatedOn;

	@NotNull(message = "CreatedBy cannot be NULL")
	private Long CreatedBy;

	@NotNull(message = "DeviceType cannot be NULL")
	private Integer DeviceType;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp LastEditOn;
	
	private Long LastEditBy;
	
	private Integer LastEditDeviceType;

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

	public AreaInsert(@NotNull(message = "BusinessAreaName cannot be NULL") String businessAreaName,
			@NotNull(message = "BusinessAreaCode cannot be NULL") String businessAreaCode,
			@NotNull(message = "BusinessAreaDescription cannot be NULL") String businessAreaDescription,
			@NotNull(message = "CountryID cannot be NULL") Long countryID,
			@NotNull(message = "StateID cannot be NULL") Long stateID,
			@NotNull(message = "CityID cannot be NULL") Long cityID,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "DeviceType cannot be NULL") Integer deviceType,
			@PastOrPresent Timestamp lastEditOn, 
			Long lastEditBy,
			Integer lastEditDeviceType) {
		super();
		BusinessAreaName = businessAreaName;
		BusinessAreaCode = businessAreaCode;
		BusinessAreaDescription = businessAreaDescription;
		CountryID = countryID;
		StateID = stateID;
		CityID = cityID;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}
	
	public AreaInsert() {}
	
}
