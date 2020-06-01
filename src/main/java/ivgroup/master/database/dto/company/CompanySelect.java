package ivgroup.master.database.dto.company;


import javax.validation.constraints.NotEmpty;

public class CompanySelect {

	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId; 
	@NotEmpty(message = "CompanyCode cannot be NULL")
	String companyCode; 
	@NotEmpty(message = "CompanyName cannot be NULL")
	String companyName; 
	@NotEmpty(message = "OwnerContactId cannot be NULL")
	Long ownerContactId; 
	@NotEmpty(message = "CompanyAddressId cannot be NULL")
	Long companyAddressId; 
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
	@NotEmpty(message = "CityName cannot be NULL")
	String cityName;
	@NotEmpty(message = "StateId cannot be NULL")
	Long stateId;
	@NotEmpty(message = "CountryId cannot be NULL")
	Long countryId;
	@NotEmpty(message = "Latitude cannot be NULL")
	String latitude;
	@NotEmpty(message = "Longitude cannot be NULL")
	String longitude;
	@NotEmpty(message = "IsActive cannot be NULL")
	Boolean isActive; 
	
	public CompanySelect() {
		
	}

	public CompanySelect(@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "CompanyCode cannot be NULL") String companyCode,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "OwnerContactId cannot be NULL") Long ownerContactId,
			@NotEmpty(message = "CompanyAddressId cannot be NULL") Long companyAddressId,
			@NotEmpty(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotEmpty(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotEmpty(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotEmpty(message = "Pincode cannot be NULL") Long pincode,
			@NotEmpty(message = "CityId cannot be NULL") Long cityId,
			@NotEmpty(message = "CityName cannot be NULL") String cityName,
			@NotEmpty(message = "StateId cannot be NULL") Long stateId,
			@NotEmpty(message = "CountryId cannot be NULL") Long countryId,
			@NotEmpty(message = "Latitude cannot be NULL") String latitude,
			@NotEmpty(message = "Longitude cannot be NULL") String longitude,
			@NotEmpty(message = "IsActive cannot be NULL") Boolean isActive) {
		super();
		this.companyId = companyId;
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.ownerContactId = ownerContactId;
		this.companyAddressId = companyAddressId;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.cityId = cityId;
		this.cityName = cityName;
		this.stateId = stateId;
		this.countryId = countryId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.isActive = isActive;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getOwnerContactId() {
		return ownerContactId;
	}

	public void setOwnerContactId(Long ownerContactId) {
		this.ownerContactId = ownerContactId;
	}

	public Long getCompanyAddressId() {
		return companyAddressId;
	}

	public void setCompanyAddressId(Long companyAddressId) {
		this.companyAddressId = companyAddressId;
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

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
}
