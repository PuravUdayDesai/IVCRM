package ivgroup.master.database.dto.companyExecutiveGeoLocation;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutiveGeoLocationInsert
{
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	private Long companyExecutiveId;
	@NotNull(message = "CompanyId cannot be NULL")
	private Long companyId;
	@NotNull(message = "EntryDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp entryDateAndTime;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "CountryName cannot be NULL")
	private String countryName;
	@NotNull(message = "StateName cannot be NULL")
	private String stateName;
	@NotNull(message = "CityName cannot be NULL")
	private String cityName;
	@NotNull(message = "AreaName cannot be NULL")
	private String areaName;
	@NotNull(message = "AddressLine1 cannot be NULL")
	private String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	private String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	private String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	private String pincode;
	
	public CompanyExecutiveGeoLocationInsert()
	{
		
	}

	public CompanyExecutiveGeoLocationInsert(
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "EntryDateAndTime cannot be NULL") @PastOrPresent Timestamp entryDateAndTime,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CountryName cannot be NULL") String countryName,
			@NotNull(message = "StateName cannot be NULL") String stateName,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "AreaName cannot be NULL") String areaName,
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") String pincode) {
		super();
		this.companyExecutiveId = companyExecutiveId;
		this.companyId = companyId;
		this.entryDateAndTime = entryDateAndTime;
		this.latitude = latitude;
		this.longitude = longitude;
		this.countryName = countryName;
		this.stateName = stateName;
		this.cityName = cityName;
		this.areaName = areaName;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
	}

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Timestamp getEntryDateAndTime() {
		return entryDateAndTime;
	}

	public void setEntryDateAndTime(Timestamp entryDateAndTime) {
		this.entryDateAndTime = entryDateAndTime;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
}
