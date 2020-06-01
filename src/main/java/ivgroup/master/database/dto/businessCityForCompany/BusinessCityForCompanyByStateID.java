package ivgroup.master.database.dto.businessCityForCompany;

import javax.validation.constraints.NotEmpty;

public class BusinessCityForCompanyByStateID {
	
	@NotEmpty
	Long BusinessCityForCompanyID;
	
	@NotEmpty
	String BusinessCityForCompanyName;

	public Long getBusinessCityForCompanyID() {
		return BusinessCityForCompanyID;
	}

	public void setBusinessCityForCompanyID(Long businessCityForCompanyID) {
		BusinessCityForCompanyID = businessCityForCompanyID;
	}

	public String getBusinessCityForCompanyName() {
		return BusinessCityForCompanyName;
	}

	public void setBusinessCityForCompanyName(String businessCityForCompanyName) {
		BusinessCityForCompanyName = businessCityForCompanyName;
	}

	public BusinessCityForCompanyByStateID(@NotEmpty Long businessCityForCompanyID,
			@NotEmpty String businessCityForCompanyName) {
		super();
		BusinessCityForCompanyID = businessCityForCompanyID;
		BusinessCityForCompanyName = businessCityForCompanyName;
	}
	
	public BusinessCityForCompanyByStateID() {}
	
}
