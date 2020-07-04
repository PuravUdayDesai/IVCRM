package ivgroup.master.database.dto.geoMapPlotting;

import javax.validation.constraints.NotNull;

public class CompanyBranchGeoMapPlotting 
{
	@NotNull(message = "CompanyBranchId cannot be NULL")
	private Long companyBranchId;
	@NotNull(message = "Latitude cannot be NULL")
	private String latitude;
	@NotNull(message = "Longitude cannot be NULL")
	private String longitude;
	@NotNull(message = "CompanyBranchName cannot be NULL")
	private String companyBranchName;
	@NotNull(message = "CompanyBranchCode cannot be NULL")
	private String companyBranchCode;
	@NotNull(message = "companyName cannot be NULL")
	private String companyName;
	@NotNull(message = "MarkForDelete cannot be NULL")
	private Boolean markForDelete;
	
	public CompanyBranchGeoMapPlotting()
	{
		
	}

	public CompanyBranchGeoMapPlotting(
			@NotNull(message = "CompanyBranchId cannot be NULL") Long companyBranchId,
			@NotNull(message = "Latitude cannot be NULL") String latitude,
			@NotNull(message = "Longitude cannot be NULL") String longitude,
			@NotNull(message = "CompanyBranchName cannot be NULL") String companyBranchName,
			@NotNull(message = "CompanyBranchCode cannot be NULL") String companyBranchCode,
			@NotNull(message = "companyName cannot be NULL") String companyName,
			@NotNull(message = "MarkForDelete cannot be NULL") Boolean markForDelete) {
		super();
		this.companyBranchId = companyBranchId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.companyBranchName = companyBranchName;
		this.companyBranchCode = companyBranchCode;
		this.companyName = companyName;
		this.markForDelete = markForDelete;
	}

	public Long getCompanyBranchId() {
		return companyBranchId;
	}

	public void setCompanyBranchId(Long companyBranchId) {
		this.companyBranchId = companyBranchId;
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

	public String getCompanyBranchName() {
		return companyBranchName;
	}

	public void setCompanyBranchName(String companyBranchName) {
		this.companyBranchName = companyBranchName;
	}

	public String getCompanyBranchCode() {
		return companyBranchCode;
	}

	public void setCompanyBranchCode(String companyBranchCode) {
		this.companyBranchCode = companyBranchCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Boolean getMarkForDelete() {
		return markForDelete;
	}

	public void setMarkForDelete(Boolean markForDelete) {
		this.markForDelete = markForDelete;
	}

}
