package ivgroup.master.database.dto.product;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductInsert {

	@NotNull(message = "ProductName cannot be NULL")	
	String productName;
	@NotNull(message = "ProductDescription cannot be NULL")
	String productDescription;
	@NotNull(message = "CompanyId cannot be NULL")
	Long companyId;
	@NotNull(message = "Cost cannot be NULL")
	Double cost;
	@NotNull(message = "CreatedBy cannot be NULL")
	Long createdBy;
	@NotNull(message = "CreatedOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp createdOn;
	
	public ProductInsert() {
		
	}

	public ProductInsert(@NotNull(message = "ProductName cannot be NULL") String productName,
			@NotNull(message = "ProductDescription cannot be NULL") String productDescription,
			@NotNull(message = "CompanyId cannot be NULL") Long companyId,
			@NotNull(message = "Cost cannot be NULL") Double cost,
			@NotNull(message = "CreatedBy cannot be NULL") Long createdBy,
			@NotNull(message = "CreatedOn cannot be NULL") Timestamp createdOn) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.companyId = companyId;
		this.cost = cost;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
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
	
	
}
