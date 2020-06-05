package ivgroup.master.database.dto.companyExecutiveGeoLocation;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutiveGeoLocationTextSelect 
{
	@NotNull(message = "CountryName cannot be NULL")
	String countryName;
	@NotNull(message = "StateName cannot be NULL")
	String stateName;
	@NotNull(message = "CityName cannot be NULL")
	String cityName;
	@NotNull(message = "AreaName cannot be NULL")
	String areaName;
	@NotNull(message = "AddressLine1 cannot be NULL")
	String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	String pincode;
	@NotNull(message = "EntryDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp entryDateAndTime;
	
	public CompanyExecutiveGeoLocationTextSelect()
	{
		
	}

	public CompanyExecutiveGeoLocationTextSelect(
			@NotNull(message = "CountryName cannot be NULL") String countryName,
			@NotNull(message = "StateName cannot be NULL") String stateName,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "AreaName cannot be NULL") String areaName,
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") String pincode,
			@NotNull(message = "EntryDateAndTime cannot be NULL") Timestamp entryDateAndTime) {
		super();
		this.countryName = countryName;
		this.stateName = stateName;
		this.cityName = cityName;
		this.areaName = areaName;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.entryDateAndTime = entryDateAndTime;
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

	public Timestamp getEntryDateAndTime() {
		return entryDateAndTime;
	}

	public void setEntryDateAndTime(Timestamp entryDateAndTime) {
		this.entryDateAndTime = entryDateAndTime;
	}
	
}
