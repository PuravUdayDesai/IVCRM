package ivgroup.master.database.dto.businessAreaForCompany;

import javax.validation.constraints.NotEmpty;

public class BusinessAreaForCompanyByCityID {

	@NotEmpty
	Long BusinessAreaForCompanyID;
	
	@NotEmpty
	String BusinessAreaForCompanyName;

	public Long getBusinessAreaForCompanyID() {
		return BusinessAreaForCompanyID;
	}

	public void setBusinessAreaForCompanyID(Long businessAreaForCompanyID) {
		BusinessAreaForCompanyID = businessAreaForCompanyID;
	}

	public String getBusinessAreaForCompanyName() {
		return BusinessAreaForCompanyName;
	}

	public void setBusinessAreaForCompanyName(String businessAreaForCompanyName) {
		BusinessAreaForCompanyName = businessAreaForCompanyName;
	}

	public BusinessAreaForCompanyByCityID(@NotEmpty Long businessAreaForCompanyID,
			@NotEmpty String businessAreaForCompanyName) {
		super();
		BusinessAreaForCompanyID = businessAreaForCompanyID;
		BusinessAreaForCompanyName = businessAreaForCompanyName;
	}
	
	public BusinessAreaForCompanyByCityID() {} 
}
