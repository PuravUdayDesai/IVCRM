package ivgroup.master.database.dto.companyAddressDetails;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyAddressDetailsInsert {
	
	@NotEmpty(message = "AddressLine1 cannot be NULL")
	String addressLine1;
	@NotEmpty(message = "AddressLine2 cannot be NULL")
	String addressLine2;
	@NotEmpty(message = "AddressLine3 cannot be NULL")
	String addressLine3;
	@NotEmpty(message = "Pincode cannot be NULL")
	Long pincode;
	@NotEmpty(message = "CityId cannot be NULL")
	Long cityId;
	@NotEmpty(message = "StateId cannot be NULL")
	Long stateId;
	@NotEmpty(message = "CountryId cannot be NULL")
	Long countryId;
	@NotEmpty(message = "Latitude cannot be NULL")
	String latitude;
	@NotEmpty(message = "Longitude cannot be NULL")
	String longitude;
	@NotEmpty(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	@NotEmpty(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotEmpty(message = "CreatedDeviceType cannot be NULL")
	Integer createdDeviceType;
	@NotEmpty(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp lastEditOn;
	@NotEmpty(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotEmpty(message = "LastEditDeviceType cannot be NULL")
	Integer lastEditDeviceType;
	
	public CompanyAddressDetailsInsert() {
		
	}

	public CompanyAddressDetailsInsert(@NotEmpty(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotEmpty(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotEmpty(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotEmpty(message = "Pincode cannot be NULL") Long pincode,
			@NotEmpty(message = "CityId cannot be NULL") Long cityId,
			@NotEmpty(message = "StateId cannot be NULL") Long stateId,
			@NotEmpty(message = "CountryId cannot be NULL") Long countryId,
			@NotEmpty(message = "Latitude cannot be NULL") String latitude,
			@NotEmpty(message = "Longitude cannot be NULL") String longitude,
			@NotEmpty(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotEmpty(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotEmpty(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType,
			@NotEmpty(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotEmpty(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotEmpty(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.cityId = cityId;
		this.stateId = stateId;
		this.countryId = countryId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
		this.createdDeviceType = createdDeviceType;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
		this.lastEditDeviceType = lastEditDeviceType;
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

	public Long getPincode() {
		return pincode;
	}

	public void setPincode(Long pincode) {
		this.pincode = pincode;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
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

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getCreatedDeviceType() {
		return createdDeviceType;
	}

	public void setCreatedDeviceType(Integer createdDeviceType) {
		this.createdDeviceType = createdDeviceType;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Integer getLastEditDeviceType() {
		return lastEditDeviceType;
	}

	public void setLastEditDeviceType(Integer lastEditDeviceType) {
		this.lastEditDeviceType = lastEditDeviceType;
	}
	
	

}
