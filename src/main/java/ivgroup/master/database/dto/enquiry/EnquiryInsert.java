package ivgroup.master.database.dto.enquiry;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EnquiryInsert 
{
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "EnquiryRemarks cannot be NULL")
	String enquiryRemarks;
	@NotNull(message = "EnquiryType cannot be NULL")
	Long enquiryType;
	@NotNull(message = "ClientId cannot be NULL")
	Long clientId;
	@NotNull(message = "CountryId cannot be NULL")
	Long countryId;
	@NotNull(message = "StateId cannot be NULL")
	Long stateId;
	@NotNull(message = "CityId cannot be NULL")
	Long cityId;
	@NotNull(message = "AreaId cannot be NULL")
	Long areaId;
	@NotNull(message = "AddressLine1 cannot be NULL")
	String addressLine1;
	@NotNull(message = "AddressLine2 cannot be NULL")
	String addressLine2;
	@NotNull(message = "AddressLine3 cannot be NULL")
	String addressLine3;
	@NotNull(message = "Pincode cannot be NULL")
	String pincode;
	@NotNull(message = "Latitude cannot be NULL")
	String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	@NotNull(message = "StatusId cannot be NULL")
	Long statusId;
	@NotNull(message = "StartDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp startDateAndTime;
	@NotNull(message = "DeadlineDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp deadlineDateAndTime;
	@NotNull(message = "Prioirty cannot be NULL")
	Integer prioirty;
	@NotNull(message = "Product cannot be NULL")
	List<Long> productId;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public EnquiryInsert()
	{
		
	}

	public EnquiryInsert(@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "EnquiryRemarks cannot be NULL") String enquiryRemarks,
			@NotNull(message = "EnquiryType cannot be NULL") Long enquiryType,
			@NotNull(message = "ClientId cannot be NULL") Long clientId,
			@NotNull(message = "CountryId cannot be NULL") Long countryId,
			@NotNull(message = "StateId cannot be NULL") Long stateId,
			@NotNull(message = "CityId cannot be NULL") Long cityId,
			@NotNull(message = "AreaId cannot be NULL") Long areaId,
			@NotNull(message = "AddressLine1 cannot be NULL") String addressLine1,
			@NotNull(message = "AddressLine2 cannot be NULL") String addressLine2,
			@NotNull(message = "AddressLine3 cannot be NULL") String addressLine3,
			@NotNull(message = "Pincode cannot be NULL") String pincode,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "StatusId cannot be NULL") Long statusId,
			@NotNull(message = "StartDateAndTime cannot be NULL") Timestamp startDateAndTime,
			@NotNull(message = "DeadlineDateAndTime cannot be NULL") Timestamp deadlineDateAndTime,
			@NotNull(message = "Prioirty cannot be NULL") Integer prioirty,
			@NotNull(message = "Product cannot be NULL") List<Long> productId,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.companyId = companyId;
		this.enquiryRemarks = enquiryRemarks;
		this.enquiryType = enquiryType;
		this.clientId = clientId;
		this.countryId = countryId;
		this.stateId = stateId;
		this.cityId = cityId;
		this.areaId = areaId;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.pincode = pincode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.statusId = statusId;
		this.startDateAndTime = startDateAndTime;
		this.deadlineDateAndTime = deadlineDateAndTime;
		this.prioirty = prioirty;
		this.productId = productId;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getEnquiryRemarks() {
		return enquiryRemarks;
	}

	public void setEnquiryRemarks(String enquiryRemarks) {
		this.enquiryRemarks = enquiryRemarks;
	}

	public Long getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(Long enquiryType) {
		this.enquiryType = enquiryType;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
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

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}

	public Timestamp getStartDateAndTime() {
		return startDateAndTime;
	}

	public void setStartDateAndTime(Timestamp startDateAndTime) {
		this.startDateAndTime = startDateAndTime;
	}

	public Timestamp getDeadlineDateAndTime() {
		return deadlineDateAndTime;
	}

	public void setDeadlineDateAndTime(Timestamp deadlineDateAndTime) {
		this.deadlineDateAndTime = deadlineDateAndTime;
	}

	public Integer getPrioirty() {
		return prioirty;
	}

	public void setPrioirty(Integer prioirty) {
		this.prioirty = prioirty;
	}

	public List<Long> getProductId() {
		return productId;
	}

	public void setProductId(List<Long> productId) {
		this.productId = productId;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

}
