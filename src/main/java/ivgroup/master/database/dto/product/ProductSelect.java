package ivgroup.master.database.dto.product;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductSelect {
	@NotNull(message = "Id cannot be NULL")
	private Long id;
	@NotNull(message = "ProductName cannot be NULL")	
	private String productName;
	@NotNull(message = "ProductDescription cannot be NULL")
	private String productDescription;
	@NotNull(message = "CompanyId cannot be NULL")
	private Long companyId;
	@NotNull(message = "CompanyName cannot be NULL")
	private String companyName;
	@NotNull(message = "Cost cannot be NULL")
	private Double cost;
	@NotNull(message = "CreatedBy cannot be NULL")
	private Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp createdOn;
	@NotNull(message = "LastEditBy cannot be NULL")
	private Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp lastEditOn;
	@NotNull(message = "IsActive cannot be NULL")
	private Boolean isActive;
	
	public ProductSelect() {
		
	}

	public ProductSelect(
			@NotNull(message = "Id cannot be NULL") Long id,
			@NotNull(message = "ProductName cannot be NULL") String productName,
			@NotNull(message = "ProductDescription cannot be NULL") String productDescription,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "CompanyName cannot be NULL") String companyName,
			@NotNull(message = "Cost cannot be NULL") Double cost,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") Timestamp lastEditOn,
			@NotNull(message = "IsActive cannot be NULL") Boolean isActive) {
		super();
		this.id = id;
		this.productName = productName;
		this.productDescription = productDescription;
		this.companyId = companyId;
		this.companyName = companyName;
		this.cost = cost;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
		this.isActive = isActive;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
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

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
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

	public Long getLastEditBy() {
		return lastEditBy;
	}

	public void setLastEditBy(Long lastEditBy) {
		this.lastEditBy = lastEditBy;
	}

	public Timestamp getLastEditOn() {
		return lastEditOn;
	}

	public void setLastEditOn(Timestamp lastEditOn) {
		this.lastEditOn = lastEditOn;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
}
