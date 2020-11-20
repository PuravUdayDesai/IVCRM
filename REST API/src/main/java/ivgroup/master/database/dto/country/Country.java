package ivgroup.master.database.dto.country;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

public class Country {

	@NotNull(message = "CountryID cannot be NULL")
	private long CountryID;

	@NotNull(message = "CountryName cannot be NULL")
	private String CountryName;

	@NotNull(message = "CountryCode cannot be NULL")
	private String CountryCode;

	@NotNull(message = "CountryDescription cannot be NULL")
	private String CountryDescription;

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

	public Country() {
	}

	public Country(@NotNull(message = "CountryID cannot be NULL") long countryID,
			@NotNull(message = "CountryName cannot be NULL") String countryName,
			@NotNull(message = "CountryCode cannot be NULL") String countryCode,
			@NotNull(message = "CountryDescription cannot be NULL") String countryDescription,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "DeviceType cannot be NULL") Integer deviceType,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		CountryID = countryID;
		CountryName = countryName;
		CountryCode = countryCode;
		CountryDescription = countryDescription;
		IsActive = isActive;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
		LastEditOn = lastEditOn;
		LastEditBy = lastEditBy;
		LastEditDeviceType = lastEditDeviceType;
	}

	public long getCountryID() {
		return CountryID;
	}

	public void setCountryID(long countryID) {
		CountryID = countryID;
	}

	public String getCountryName() {
		return CountryName;
	}

	public void setCountryName(String countryName) {
		CountryName = countryName;
	}

	public String getCountryCode() {
		return CountryCode;
	}

	public void setCountryCode(String countryCode) {
		CountryCode = countryCode;
	}

	public String getCountryDescription() {
		return CountryDescription;
	}

	public void setCountryDescription(String countryDescription) {
		CountryDescription = countryDescription;
	}

	public Boolean isIsActive() {
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

}
