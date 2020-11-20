package ivgroup.master.database.dto.enquiry;

import javax.validation.constraints.NotNull;

public class EnquiryProductSelect 
{
	@NotNull(message = "EnquiryId cannot be NULL")
	private Long enquiryId;
	@NotNull(message = "EnquiryProductId cannot be NULL")
	private Long enquiryProductId;
	@NotNull(message = "ProductId cannot be NULL")
	private Long productId;
	@NotNull(message = "ProductName cannot be NULL")
	private String productName;
	@NotNull(message = "ProductCharges cannot be NULL")
	private Double productCharges;
	
	public EnquiryProductSelect()
	{
		
	}

	public EnquiryProductSelect(@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "EnquiryProductId cannot be NULL") Long enquiryProductId,
			@NotNull(message = "ProductId cannot be NULL") Long productId,
			@NotNull(message = "ProductName cannot be NULL") String productName,
			@NotNull(message = "ProductCharges cannot be NULL") Double productCharges) {
		super();
		this.enquiryId = enquiryId;
		this.enquiryProductId = enquiryProductId;
		this.productId = productId;
		this.productName = productName;
		this.productCharges = productCharges;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public Long getEnquiryProductId() {
		return enquiryProductId;
	}

	public void setEnquiryProductId(Long enquiryProductId) {
		this.enquiryProductId = enquiryProductId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getProductCharges() {
		return productCharges;
	}

	public void setProductCharges(Double productCharges) {
		this.productCharges = productCharges;
	}
	
}
