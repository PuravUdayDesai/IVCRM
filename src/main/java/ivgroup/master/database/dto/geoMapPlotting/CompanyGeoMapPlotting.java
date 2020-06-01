package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotEmpty;

public class CompanyGeoMapPlotting 
{
	@NotEmpty(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotEmpty(message = "Latitude cannot be NULL")
	String latitude;
	@NotEmpty(message = "Longitude cannot be NULL")
	String longitude;
	@NotEmpty(message = "CompanyName cannot be NULL")
	String companyName;
	@NotEmpty(message = "CompanyCode cannot be NULL")
	String companyCode;
	@NotEmpty(message = "MarkForDelete cannot be NULL")
	Boolean markForDelete;
	
	public CompanyGeoMapPlotting()
	{
		
	}

	public CompanyGeoMapPlotting(
			@NotEmpty(message = "CompanyId cannot be NULL") Long companyId,
			@NotEmpty(message = "Latitude cannot be NULL") String latitude,
			@NotEmpty(message = "Longitude cannot be NULL") String longitude,
			@NotEmpty(message = "CompanyName cannot be NULL") String companyName,
			@NotEmpty(message = "CompanyCode cannot be NULL") String companyCode,
			@NotEmpty(message = "MarkForDelete cannot be NULL") Boolean markForDelete) {
		super();
		this.companyId = companyId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.companyName = companyName;
		this.companyCode = companyCode;
		this.markForDelete = markForDelete;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public Boolean getMarkForDelete() {
		return markForDelete;
	}

	public void setMarkForDelete(Boolean markForDelete) {
		this.markForDelete = markForDelete;
	}
	
}
