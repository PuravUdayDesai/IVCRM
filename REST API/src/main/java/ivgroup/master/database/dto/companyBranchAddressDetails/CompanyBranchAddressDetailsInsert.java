package ivgroup.master.database.dto.companyBranchAddressDetails;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyBranchAddressDetailsInsert {

	@NotNull(message = "AddressLine1 cannot be NULL")
	private String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	private String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	private String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	private Long pincode;
	@NotNull(message = "CityId cannot be NULL")
	private Long cityId;
	@NotNull(message = "StateId cannot be NULL")
	private Long stateId;
	@NotNull(message = "CountryId cannot be NULL")
	private Long countryId;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	private Timestamp createdOn;
	@NotNull(message = "CreatedBy cannot be NULL")
	private Long createdBy;
	@NotNull(message = "CreatedDeviceType cannot be NULL")
	private Integer createdDeviceType;

	
	public CompanyBranchAddressDetailsInsert() {
		
	}

	public CompanyBranchAddressDetailsInsert(
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") Long pincode,
			@NotNull(message = "CityId cannot be NULL") Long cityId,
			@NotNull(message = "StateId cannot be NULL") Long stateId,
			@NotNull(message = "CountryId cannot be NULL") Long countryId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CreatedOn cannot be NULL") @PastOrPresent Timestamp createdOn,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedDeviceType cannot be NULL") Integer createdDeviceType) {
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

}
