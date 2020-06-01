package ivgroup.master.database.dto.businessCityForCompany;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BusinessCityForCompanyInsert {

	@NotEmpty(message = "CompanyID cannot be NULL")
	private Long CompanyID;
	
	@NotEmpty(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotEmpty(message = "StateID cannot be NULL")
	private Long StateID;
	
	@NotEmpty(message = "CityName cannot be NULL")
	private String CityName;
	
	@NotEmpty(message = "CityCode cannot be NULL")
	private String CityCode;
	
	@NotEmpty(message = "CityDescription cannot be NULL")
	private String CityDescription;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@NotEmpty(message = "CreatedOn cannot be NULL")	
	private Timestamp CreatedOn;

	@NotEmpty(message = "CreatedBy cannot be NULL")
	private Long CreatedBy;

	@NotEmpty(message = "DeviceType cannot be NULL")
	private Integer DeviceType;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp LastEditOn;

	Long LastEditBy;
	
	Integer LastEditDeviceType;

	public Long getCompanyID() {
		return CompanyID;
	}

	public void setCompanyID(Long companyID) {
		CompanyID = companyID;
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
	
	public BusinessCityForCompanyInsert(@NotEmpty(message = "CompanyID cannot be NULL") Long companyID,
			@NotEmpty(message = "CountryID cannot be NULL") Long countryID,
			@NotEmpty(message = "StateID cannot be NULL") Long stateID,
			@NotEmpty(message = "CityName cannot be NULL") String cityName,
			@NotEmpty(message = "CityCode cannot be NULL") String cityCode,
			@NotEmpty(message = "CityDescription cannot be NULL") String cityDescription,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "DeviceType cannot be NULL") Integer deviceType, Timestamp lastEditOn, Long lastEditBy,
			Integer lastEditDeviceType) {
		super();
		CompanyID = companyID;
		CountryID = countryID;
		StateID = stateID;
		CityName = cityName;
		CityCode = cityCode;
		CityDescription = cityDescription;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public BusinessCityForCompanyInsert() {}
}

