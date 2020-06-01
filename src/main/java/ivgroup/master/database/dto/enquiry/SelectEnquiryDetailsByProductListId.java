package ivgroup.master.database.dto.enquiry;

import javax.validation.constraints.NotEmpty;

public class SelectEnquiryDetailsByProductListId
{
	@NotEmpty(message = "EnquiryId cannot be NULL")
	Long enquiryId;
	@NotEmpty(message = "ProductId cannot be NULL")
	Long productId;
	
	public SelectEnquiryDetailsByProductListId()
	{
		
	}

	public SelectEnquiryDetailsByProductListId(@NotEmpty(message = "EnquiryId cannot be NULL") Long enquiryId,
			@NotEmpty(message = "ProductId cannot be NULL") Long productId) {
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
