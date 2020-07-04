package ivgroup.master.database.dto.businessAreaForCompany;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BusinessAreaForCompanyInsert {

	@NotNull(message = "CompanyID cannot be NULL")
	private Long CompanyID;
	
	@NotNull(message = "CountryID cannot be NULL")
	private Long CountryID;
	
	@NotNull(message = "StateID cannot be NULL")
	private Long StateID;
	
	@NotNull(message = "CityID cannot be NULL")
	private Long CityID;
	
	@NotNull(message = "AreaName cannot be NULL")
	private String AreaName;
	
	@NotNull(message = "AreaCode cannot be NULL")
	private String AreaCode;
	
	@NotNull(message = "AreaDescription cannot be NULL")
	private String AreaDescription;

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

	public Long getCityID() {
		return CityID;
	}

	public void setCityID(Long cityID) {
		CityID = cityID;
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
	
	public BusinessAreaForCompanyInsert(@NotNull(message = "CompanyID cannot be NULL") Long companyID,
			@NotNull(message = "CountryID cannot be NULL") Long countryID,
			@NotNull(message = "StateID cannot be NULL") Long stateID,
			@NotNull(message = "CityID cannot be NULL") Long cityID,
			@NotNull(message = "AreaName cannot be NULL") String areaName,
			@NotNull(message = "AreaCode cannot be NULL") String areaCode,
			@NotNull(message = "AreaDescription cannot be NULL") String areaDescription,
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
		CityID = cityID;
		AreaName = areaName;
		AreaCode = areaCode;
		AreaDescription = areaDescription;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public BusinessAreaForCompanyInsert() {}
}
