package ivgroup.master.database.dto.businessCityForCompany;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BusinessCityForCompanyUpdate {
	
	private Long CompanyID;
	
	private Long CountryID;
	
	private Long StateID;
	
	private String CityName;
	
	private String CityCode;
	
	private String CityDescription;

	private Integer DeviceType;
	
	private Boolean IsActive;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@NotEmpty(message = "LastEditOn cannot be NULL")
	Timestamp LastEditOn;
	
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long LastEditBy;
	
	@NotEmpty(message = "LastEditDeviceType cannot be NULL")
	Integer LastEditDeviceType;
	
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

	public Long getCompanyID() {
		return CompanyID;
	}

	public void setCompanyID(Long companyID) {
		CompanyID = companyID;
	}

	public String getCityName() {
		return CityName;
	}

	public void setCityName(String cityName) {
		CityName = cityName;
	}

	public String getCityCode() {
		return CityCode;
	}

	public void setCityCode(String cityCode) {
		CityCode = cityCode;
	}

	public String getCityDescription() {
		return CityDescription;
	}

	public void setCityDescription(String cityDescription) {
		CityDescription = cityDescription;
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

	public BusinessCityForCompanyUpdate(Long companyID, Long countryID, Long stateID, String cityName, String cityCode,
			String cityDescription, Integer deviceType, Boolean isActive,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		CompanyID = companyID;
		CountryID = countryID;
		StateID = stateID;
		CityName = cityName;
		CityCode = cityCode;
		CityDescription = cityDescription;
		DeviceType = deviceType;
		IsActive = isActive;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public BusinessCityForCompanyUpdate() {}
}
