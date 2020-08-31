package ivgroup.master.database.dto.businessAreaForCompany;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BusinessAreaForCompanyUpdate {
	
	private Long CompanyID;
	
	private Long CityID;

	private Integer DeviceType;
	
	private Boolean IsActive;
	
	private Long StateID;
	
	private Long CountryID;
	
	private String AreaName;
	
	private String AreaCode;
	
	private String AreaDescription;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@NotNull(message = "LastEditOn cannot be NULL")
	private Timestamp LastEditOn;
	
	@NotNull(message = "LastEditBy cannot be NULL")
	private Long LastEditBy;
	
	@NotNull(message = "LastEditDeviceType cannot be NULL")
	private Integer LastEditDeviceType;
	
	public Long getStateID() {
		return StateID;
	}

	public void setStateID(Long stateID) {
		StateID = stateID;
	}

	public Long getCountryID() {
		return CountryID;
	}

	public void setCountryID(Long countryID) {
		CountryID = countryID;
	}

	public Long getCompanyID() {
		return CompanyID;
	}

	public void setCompanyID(Long companyID) {
		CompanyID = companyID;
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

	public Boolean getIsActive() {
		return IsActive;
	}

	public void setIsActive(Boolean isActive) {
		IsActive = isActive;
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

	public String getAreaName() {
		return AreaName;
	}

	public void setAreaName(String areaName) {
		AreaName = areaName;
	}

	public String getAreaCode() {
		return AreaCode;
	}

	public void setAreaCode(String areaCode) {
		AreaCode = areaCode;
	}

	public String getAreaDescription() {
		return AreaDescription;
	}

	public void setAreaDescription(String areaDescription) {
		AreaDescription = areaDescription;
	}

	public BusinessAreaForCompanyUpdate(
			Long companyID, 
			Long cityID, 
			Integer deviceType, 
			Boolean isActive, 
			Long stateID,
			Long countryID,
			String areaName, 
			String areaCode,
			String areaDescription,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		CompanyID = companyID;
		CityID = cityID;
		DeviceType = deviceType;
		IsActive = isActive;
		StateID = stateID;
		CountryID = countryID;
		AreaName = areaName;
		AreaCode = areaCode;
		AreaDescription = areaDescription;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public BusinessAreaForCompanyUpdate() {}
}
