package ivgroup.master.database.dto.enquiry;

import javax.validation.constraints.NotNull;

public class SelectEnquiryDetailsByProductListId
{
	@NotNull(message = "EnquiryId cannot be NULL")
	private Long enquiryId;
	@NotNull(message = "ProductId cannot be NULL")
	private Long productId;
	
	public SelectEnquiryDetailsByProductListId()
	{
		
	}

	public SelectEnquiryDetailsByProductListId(@NotNull(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotNull(message = "ProductId cannot be NULL") Long productId) {
		super();
		this.enquiryId = enquiryId;
		this.productId = productId;
	}

	public Long getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Long enquiryId) {
		this.enquiryId = enquiryId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}
	
}
