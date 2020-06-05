package ivgroup.master.database.dto.area;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

public class Area {

	@NotNull(message = "BusinessAreaID cannot be NULL")
	private long BusinessAreaID;

	@NotNull(message = "BusinessAreaName cannot be NULL")
	private String BusinessAreaName;

	@NotNull(message = "BusinessAreaCode cannot be NULL")
	private String BusinessAreaCode;
	
	@NotNull(message = "BusinessAreaDescription cannot be NULL")
	private String BusinessAreaDescription;

	@NotNull(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotNull(message = "CountryName cannot be NULL")
	private String CountryName;
	
	@NotNull(message = "StateID cannot be NULL")
	private Long StateID;
	
	@NotNull(message = "StateName cannot be NULL")
	private String StateName;
	
	@NotNull(message = "CityID cannot be NULL")
	private Long CityID;
	
	@NotNull(message = "CityName cannot be NULL")
	private String CityName;

	@NotNull(message = "IsActive cannot be NULL")
	private Boolean IsActive;

	@NotNull(message = "CreatedOn cannot be NULL")	
	private Timestamp CreatedOn;

	@NotNull(message = "CreatedBy cannot be NULL")
	private Long CreatedBy;

	@NotNull(message = "DeviceType cannot be NULL")
	private Integer DeviceType;

	@NotNull(message = "LastEditOn cannot be NULL")	
	Timestamp LastEditOn;
	
	@NotNull(message = "LastEditBy cannot be NULL")
	Long LastEditBy;
	
	@NotNull(message = "LastEditDeviceType cannot be NULL")
	Integer LastEditDeviceType;
	
	public long getBusinessAreaID() {
		return BusinessAreaID;
	}



	public void setBusinessAreaID(long businessAreaID) {
		BusinessAreaID = businessAreaID;
	}



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



	public String getCountryName() {
		return CountryName;
	}



	public void setCountryName(String countryName) {
		CountryName = countryName;
	}



	public Long getStateID() {
		return StateID;
	}



	public void setStateID(Long stateID) {
		StateID = stateID;
	}



	public String getStateName() {
		return StateName;
	}



	public void setStateName(String stateName) {
		StateName = stateName;
	}



	public Long getCityID() {
		return CityID;
	}



	public void setCityID(Long cityID) {
		CityID = cityID;
	}



	public String getCityName() {
		return CityName;
	}



	public void setCityName(String cityName) {
		CityName = cityName;
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

	

	public Area(@NotNull(message = "BusinessAreaID cannot be NULL") long businessAreaID,
			@NotNull(message = "BusinessAreaName cannot be NULL") String businessAreaName,
			@NotNull(message = "BusinessAreaCode cannot be NULL") String businessAreaCode,
			@NotNull(message = "BusinessAreaDescription cannot be NULL") String businessAreaDescription,
			@NotNull(message = "CountryID cannot be NULL") Long countryID,
			@NotNull(message = "CountryName cannot be NULL") String countryName,
			@NotNull(message = "StateID cannot be NULL") Long stateID,
			@NotNull(message = "StateName cannot be NULL") String stateName,
			@NotNull(message = "CityID cannot be NULL") Long cityID,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "DeviceType cannot be NULL") Integer deviceType,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		BusinessAreaID = businessAreaID;
		BusinessAreaName = businessAreaName;
		BusinessAreaCode = businessAreaCode;
		BusinessAreaDescription = businessAreaDescription;
		CountryID = countryID;
		CountryName = countryName;
		StateID = stateID;
		StateName = stateName;
		CityID = cityID;
		CityName = cityName;
		IsActive = isActive;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}



	public Area() {}

}
