package ivgroup.master.database.dto.product;

import java.sql.Timestamp;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductUpdate {
	
	String productName;
	String productDescription;
	Long companyId;
	Double cost;
	@NotNull(message = "LastEditBy cannot be NULL")
	Long lastEditBy;
	@NotNull(message = "LastEditOn cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	@FutureOrPresent
	Timestamp lastEditOn;
	Boolean isActive;
	
	public ProductUpdate() {
		
	}

	public ProductUpdate(String productName, String productDescription, Long companyId, Double cost,
			@NotNull(message = "LastEditBy cannot be NULL") Long lastEditBy,
			@NotNull(message = "LastEditOn cannot be NULL") @FutureOrPresent Timestamp lastEditOn, Boolean isActive) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.companyId = companyId;
		this.cost = cost;
		this.lastEditBy = lastEditBy;
		this.lastEditOn = lastEditOn;
		this.isActive = isActive;
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
