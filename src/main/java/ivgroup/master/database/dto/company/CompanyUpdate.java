package ivgroup.master.database.dto.company;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyUpdate {

	String companyCode; 
	String companyName; 
	Long ownerContactId; 
	Long companyAddress; 
	Long cityId; 
	Boolean isActive; 
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@PastOrPresent
	Timestamp lastEditOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditDeviceType cannot be NULL")
	Integer lastEditDeviceType;
	
	public CompanyUpdate() {
		
	}

	public CompanyUpdate(String companyCode, String companyName, Long ownerContactId, Long companyAddress, Long cityId,
			Boolean isActive, @NotNull(message = "LastEditOn cannot be NULL") @PastOrPresent Timestamp lastEditOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditDeviceType cannot be NULL") Integer lastEditDeviceType) {
		super();
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.ownerContactId = ownerContactId;
		this.companyAddress = companyAddress;
		this.cityId = cityId;
		this.isActive = isActive;
		this.lastEditOn = lastEditOn;
		this.lastEditBy = lastEditBy;
		this.lastEditDeviceType = lastEditDeviceType;
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

	public Long getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(Long companyAddress) {
		this.companyAddress = companyAddress;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
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
