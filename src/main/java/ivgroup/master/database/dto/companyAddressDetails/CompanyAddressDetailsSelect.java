package ivgroup.master.database.dto.companyAddressDetails;

import javax.validation.constraints.NotEmpty;

public class CompanyAddressDetailsSelect {
	
	@NotEmpty(message = "CompanyAddressID cannot be NULL")
	Long companyAddressID; 
	@NotEmpty(message = "AddressLine1 cannot be NULL")
	String addressLine1; 
	@NotEmpty(message = "AddressLine2 cannot be NULL")
	String addressLine2; 
	@NotEmpty(message = "AddressLine3 cannot be NULL")
	String addressLine3; 
	@NotEmpty(message = "Pincode cannot be NULL")
	Long pincode; 
	@NotEmpty(message = "CityID cannot be NULL")
	Long cityID; 
	@NotEmpty(message = "CityName cannot be NULL")
	String cityName; 
	@NotEmpty(message = "StateID cannot be NULL")
	Long stateID; 
	@NotEmpty(message = "StateName cannot be NULL")
	String stateName;
	@NotEmpty(message = "CountryID cannot be NULL")
	Long countryID;
	@NotEmpty(message = "CountryName cannot be NULL")
	String countryName; 
	@NotEmpty(message = "Latitude cannot be NULL")
	String latitude; 
	@NotEmpty(message = "Longitude cannot be NULL")
	String longitude;
	
	public CompanyAddressDetailsSelect() {
		
	}

	public CompanyAddressDetailsSelect(
			@NotEmpty(message = "CompanyAddressID cannot be NULL") Long companyAddressID,
			@NotEmpty(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotEmpty(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotEmpty(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotEmpty(message = "Pincode cannot be NULL") Long pincode,
			@NotEmpty(message = "CityID cannot be NULL") Long cityID,
			@NotEmpty(message = "CityName cannot be NULL") String cityName,
			@NotEmpty(message = "StateID cannot be NULL") Long stateID,
			@NotEmpty(message = "StateName cannot be NULL") String stateName,
			@NotEmpty(message = "CountryID cannot be NULL") Long countryID,
			@NotEmpty(message = "CountryName cannot be NULL") String countryName,
			@NotEmpty(message = "Latitude cannot be NULL") String latitude,
			@NotEmpty(message = "Longitude cannot be NULL") String longitude) {
		super();
		this.companyAddressID = companyAddressID;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.cityID = cityID;
		this.cityName = cityName;
		this.stateID = stateID;
		this.stateName = stateName;
		this.countryID = countryID;
		this.countryName = countryName;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public Long getCompanyAddressID() {
		return companyAddressID;
	}

	public void setCompanyAddressID(Long companyAddressID) {
		this.companyAddressID = companyAddressID;
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

	public Long getCityID() {
		return cityID;
	}

	public void setCityID(Long cityID) {
		this.cityID = cityID;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Long getStateID() {
		return stateID;
	}

	public void setStateID(Long stateID) {
		this.stateID = stateID;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public Long getCountryID() {
		return countryID;
	}

	public void setCountryID(Long countryID) {
		this.countryID = countryID;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
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
}
