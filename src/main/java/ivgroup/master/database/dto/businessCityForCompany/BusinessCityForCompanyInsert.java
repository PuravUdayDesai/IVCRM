package ivgroup.master.database.dto.businessCityForCompany;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BusinessCityForCompanyInsert {

	@NotNull(message = "CompanyID cannot be NULL")
	private Long CompanyID;
	
	@NotNull(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotNull(message = "StateID cannot be NULL")
	private Long StateID;
	
	@NotNull(message = "CityName cannot be NULL")
	private String CityName;
	
	@NotNull(message = "CityCode cannot be NULL")
	private String CityCode;
	
	@NotNull(message = "CityDescription cannot be NULL")
	private String CityDescription;

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
	private Timestamp LastEditOn;

	private Long LastEditBy;
	
	private Integer LastEditDeviceType;

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
	
	public BusinessCityForCompanyInsert(@NotNull(message = "CompanyID cannot be NULL") Long companyID,
			@NotNull(message = "CountryID cannot be NULL") Long countryID,
			@NotNull(message = "StateID cannot be NULL") Long stateID,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "CityCode cannot be NULL") String cityCode,
			@NotNull(message = "CityDescription cannot be NULL") String cityDescription,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "DeviceType cannot be NULL") Integer deviceType,
			@PastOrPresent Timestamp lastEditOn,
			Long lastEditBy,
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

