package ivgroup.master.database.dto.businessAreaForCompany;

import javax.validation.constraints.NotNull;

public class BusinessAreaForCompanyByCityID {

	@NotNull
	private Long BusinessAreaForCompanyID;
	
	@NotNull
	private String BusinessAreaForCompanyName;

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

	public BusinessAreaForCompanyByCityID(@NotNull Long businessAreaForCompanyID,
			@NotNull String businessAreaForCompanyName) {
		super();
		BusinessAreaForCompanyID = businessAreaForCompanyID;
		BusinessAreaForCompanyName = businessAreaForCompanyName;
	}
	
	public BusinessAreaForCompanyByCityID() {} 
}
