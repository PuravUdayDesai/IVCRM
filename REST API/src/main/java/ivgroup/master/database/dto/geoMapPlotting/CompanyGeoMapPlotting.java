package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotNull;

public class CompanyGeoMapPlotting 
{
	@NotNull(message = "CompanyId cannot be NULL")
	private Long companyId;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "CompanyName cannot be NULL")
	private String companyName;
	@NotNull(message = "CompanyCode cannot be NULL")
	private String companyCode;
	@NotNull(message = "MarkForDelete cannot be NULL")
	private Boolean markForDelete;
	
	public CompanyGeoMapPlotting()
	{
		
	}

	public CompanyGeoMapPlotting(
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CompanyCode cannot be NULL") String companyCode,
			@NotNull(message = "MarkForDelete cannot be NULL") Boolean markForDelete) {
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
