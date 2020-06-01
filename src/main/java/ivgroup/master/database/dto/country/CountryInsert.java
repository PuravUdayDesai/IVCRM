package ivgroup.master.database.dto.country;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CountryInsert {

	@NotEmpty(message = "CountryName cannot be NULL")
	private String CountryName;

	@NotEmpty(message = "CountryCode cannot be NULL")
	private String CountryCode;

	@NotEmpty(message = "CountryDescription cannot be NULL")
	private String CountryDescription;

	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp CreatedOn;

	@NotEmpty(message = "CreatedBy cannot be NULL")
	private Long CreatedBy;

	@NotEmpty(message = "DeviceType cannot be NULL")
	private Integer DeviceType;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp LastEditOn;
	
	Long LastEditBy;
	
	Integer LastEditDeviceType;

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

	public CountryInsert() {}
	
	public CountryInsert(@NotEmpty(message = "CountryName cannot be NULL") String countryName,
			@NotEmpty(message = "CountryCode cannot be NULL") String countryCode,
			@NotEmpty(message = "CountryDescription cannot be NULL") String countryDescription,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "DeviceType cannot be NULL") Integer deviceType) {
		super();
		CountryName = countryName;
		CountryCode = countryCode;
		CountryDescription = countryDescription;
		CreatedOn = createdOn;
		CreatedBy = createdBy;
		DeviceType = deviceType;
	}	

}
