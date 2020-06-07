package ivgroup.master.database.dto.companyAddressDetails;

import java.sql.Timestamp;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;

public class CompanyAddressDetailsUpdate {

	String addressLine1;
	String addressLine2;
	String addressLine3;
	Long pincode;
	Long cityId;
	Long stateId;
	Long countryId;
	String latitude;
	String longitude;
	@NotNull(message = "LastEditOn cannot be NULL")
	@FutureOrPresent
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditDeviceType cannot be NULL")
	Integer lastEditDeviceType;
	
	public CompanyAddressDetailsUpdate() {
		
	}



	public CompanyAddressDetailsUpdate(String addressLine1, String addressLine2, String addressLine3, Long pincode,
			Long cityId, Long stateId, Long countryId, String latitude, String longitude,
			@NotNull(message = "LastEditOn cannot be NULL") @FutureOrPresent Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
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
