package ivgroup.master.database.dto.companyBranchAddressDetails;

import javax.validation.constraints.NotNull;

public class CompanyBranchAddressDetailsSelect {

	@NotNull(message = "CompanyBranchAddressID cannot be NULL")
	Long companyBranchAddressID; 
	@NotNull(message = "AddressLine1 cannot be NULL")
	String addressLine1; 
	@NotNull(message = "AddressLine2 cannot be NULL")
	String addressLine2; 
	@NotNull(message = "AddressLine3 cannot be NULL")
	String addressLine3; 
	@NotNull(message = "Pincode cannot be NULL")
	Long pincode; 
	@NotNull(message = "CityID cannot be NULL")
	Long cityID; 
	@NotNull(message = "CityName cannot be NULL")
	String cityName; 
	@NotNull(message = "StateID cannot be NULL")
	Long stateID; 
	@NotNull(message = "StateName cannot be NULL")
	String stateName;
	@NotNull(message = "CountryID cannot be NULL")
	Long countryID;
	@NotNull(message = "CountryName cannot be NULL")
	String countryName; 
	@NotNull(message = "Latitude cannot be NULL")
	String latitude; 
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	
	public CompanyBranchAddressDetailsSelect() {
		
	}

	public CompanyBranchAddressDetailsSelect(
			@NotNull(message = "CompanyBranchAddressID cannot be NULL") Long companyBranchAddressID,
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") Long pincode,
			@NotNull(message = "CityID cannot be NULL") Long cityID,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "StateID cannot be NULL") Long stateID,
			@NotNull(message = "StateName cannot be NULL") String stateName,
			@NotNull(message = "CountryID cannot be NULL") Long countryID,
			@NotNull(message = "CountryName cannot be NULL") String countryName,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude) {
		super();
		this.companyBranchAddressID = companyBranchAddressID;
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

	public Long getCompanyBranchAddressID() {
		return companyBranchAddressID;
	}

	public void setCompanyBranchAddressID(Long companyBranchAddressID) {
		this.companyBranchAddressID = companyBranchAddressID;
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
