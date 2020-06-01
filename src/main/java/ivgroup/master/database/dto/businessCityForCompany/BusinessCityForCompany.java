package ivgroup.master.database.dto.businessCityForCompany;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

public class BusinessCityForCompany {

	@NotEmpty(message = "BusinessCityForCompanyID cannot be NULL")
	private Long BusinessCityForCompanyID;

	@NotEmpty(message = "CompanyID cannot be NULL")
	private Long CompanyID;
	
	@NotEmpty(message = "CompanyName cannot be NULL")
	private String CompanyName;
	
	@NotEmpty(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotEmpty(message = "CountryName cannot be NULL")
	private String CountryName;
	
	@NotEmpty(message = "StateID cannot be NULL")
	private Long StateID;
	
	@NotEmpty(message = "StateName cannot be NULL")
	private String StateName;
	
	@NotEmpty(message = "CityID cannot be NULL")
	private Long CityID;
	
	@NotEmpty(message = "CityName cannot be NULL")
	private String CityName;
	
	@NotEmpty(message = "CityCode cannot be NULL")
	private String CityCode;
	
	@NotEmpty(message = "CityDescription cannot be NULL")
	private String CityDescription;

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

	public Long getBusinessCityForCompanyID() {
		return BusinessCityForCompanyID;
	}

	public void setBusinessCityForCompanyID(Long businessCityForCompanyID) {
		BusinessCityForCompanyID = businessCityForCompanyID;
	}

	public Long getCompanyID() {
		return CompanyID;
	}

	public void setCompanyID(Long companyID) {
		CompanyID = companyID;
	}

	public String getCompanyName() {
		return CompanyName;
	}

	public void setCompanyName(String companyName) {
		CompanyName = companyName;
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
	
	public BusinessCityForCompany(
			@NotEmpty(message = "BusinessCityForCompanyID cannot be NULL") Long businessCityForCompanyID,
			@NotEmpty(message = "CompanyID cannot be NULL") Long companyID,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "CountryID cannot be NULL") Long countryID,
			@NotEmpty(message = "CountryName cannot be NULL") String countryName,
			@NotEmpty(message = "StateID cannot be NULL") Long stateID,
			@NotEmpty(message = "StateName cannot be NULL") String stateName,
			@NotEmpty(message = "CityID cannot be NULL") Long cityID,
			@NotEmpty(message = "CityName cannot be NULL") String cityName,
			@NotEmpty(message = "CityCode cannot be NULL") String cityCode,
			@NotEmpty(message = "CityDescription cannot be NULL") String cityDescription,
			@NotEmpty(message = "IsActive cannot be NULL") Boolean isActive,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "DeviceType cannot be NULL") Integer deviceType,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		BusinessCityForCompanyID = businessCityForCompanyID;
		CompanyID = companyID;
		CompanyName = companyName;
		CountryID = countryID;
		CountryName = countryName;
		StateID = stateID;
		StateName = stateName;
		CityID = cityID;
		CityName = cityName;
		CityCode = cityCode;
		CityDescription = cityDescription;
		IsActive = isActive;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public BusinessCityForCompany() {}
}
