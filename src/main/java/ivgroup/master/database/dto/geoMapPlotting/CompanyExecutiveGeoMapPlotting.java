package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotNull;

public class CompanyExecutiveGeoMapPlotting 
{
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	Long companyExecutiveId;
	@NotNull(message = "Latitude cannot be NULL")
	String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	String longitude;
	@NotNull(message = "CompanyExecutiveName cannot be NULL")
	String companyExecutiveName;
	@NotNull(message = "CompanyName cannot be NULL")
	String companyName;
	@NotNull(message = "CompanyBranchName cannot be NULL")
	String companyBranchName;
	@NotNull(message = "MarkForDelete cannot be NULL")
	Boolean markForDelete;
	
	public CompanyExecutiveGeoMapPlotting()
	{
		
	}

	
	
	public CompanyExecutiveGeoMapPlotting(
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "CompanyBranchName cannot be NULL") String companyBranchName,
			@NotNull(message = "MarkForDelete cannot be NULL") Boolean markForDelete) {
		super();
		this.companyExecutiveId = companyExecutiveId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.companyExecutiveName = companyExecutiveName;
		this.companyName = companyName;
		this.companyBranchName = companyBranchName;
		this.markForDelete = markForDelete;
	}



	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
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

	public String getCompanyExecutiveName() {
		return companyExecutiveName;
	}

	public void setCompanyExecutiveName(String companyExecutiveName) {
		this.companyExecutiveName = companyExecutiveName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyBranchName() {
		return companyBranchName;
	}

	public void setCompanyBranchName(String companyBranchName) {
		this.companyBranchName = companyBranchName;
	}

	public Boolean getMarkForDelete() {
		return markForDelete;
	}

	public void setMarkForDelete(Boolean markForDelete) {
		this.markForDelete = markForDelete;
	}

}
