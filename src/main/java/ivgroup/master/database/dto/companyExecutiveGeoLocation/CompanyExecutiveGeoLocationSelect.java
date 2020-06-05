package ivgroup.master.database.dto.companyExecutiveGeoLocation;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutiveGeoLocationSelect 
{
	@NotNull(message = "CompanyExecutiveGeoLocationId cannot be NULL")
	Long companyExecutiveGeoLocationId;
	@NotNull(message = "Latitude cannot be NULL")
	String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotNull(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "EntryDateAndTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp entryDateAndTime;
	
	public CompanyExecutiveGeoLocationSelect()
	{
		
	}

	public CompanyExecutiveGeoLocationSelect(
			@NotNull(message = "CompanyExecutiveGeoLocationId cannot be NULL") Long companyExecutiveGeoLocationId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "EntryDateAndTime cannot be NULL") Timestamp entryDateAndTime) {
		super();
		this.companyExecutiveGeoLocationId = companyExecutiveGeoLocationId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.companyId = companyId;
		this.companyName = companyName;
		this.entryDateAndTime = entryDateAndTime;
	}

	public Long getCompanyExecutiveGeoLocationId() {
		return companyExecutiveGeoLocationId;
	}

	public void setCompanyExecutiveGeoLocationId(Long companyExecutiveGeoLocationId) {
		this.companyExecutiveGeoLocationId = companyExecutiveGeoLocationId;
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

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Timestamp getEntryDateAndTime() {
		return entryDateAndTime;
	}

	public void setEntryDateAndTime(Timestamp entryDateAndTime) {
		this.entryDateAndTime = entryDateAndTime;
	}

}
