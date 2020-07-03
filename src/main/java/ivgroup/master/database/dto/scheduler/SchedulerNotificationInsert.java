package ivgroup.master.database.dto.scheduler;

import javax.validation.constraints.NotNull;

public class SchedulerNotificationInsert
{
	@NotNull(message = "CompanyExecutiveId cannot be NULL")
	private Long companyExecutiveId;
	@NotNull(message = "CompanyExecutiveName cannot be NULL")
	private String companyExecutiveName;
	@NotNull(message = "ProductName cannot be NULL")
	private String productName;
	@NotNull(message = "ClientName cannot be NULL")
	private String clientName;
	
	public SchedulerNotificationInsert()
	{
		
	}

	public SchedulerNotificationInsert(@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "CompanyExecutiveName cannot be NULL") String companyExecutiveName,
			@NotNull(message = "ProductName cannot be NULL") String productName,
			@NotNull(message = "ClientName cannot be NULL") String clientName) {
		super();
		this.companyExecutiveId = companyExecutiveId;
		this.companyExecutiveName = companyExecutiveName;
		this.productName = productName;
		this.clientName = clientName;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

}
