package ivgroup.master.database.dto.businessCityForCompany;

import javax.validation.constraints.NotNull;

public class BusinessCityForCompanyByStateID {
	
	@NotNull
	Long BusinessCityForCompanyID;
	
	@NotNull
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

	public BusinessCityForCompanyByStateID(@NotNull Long businessCityForCompanyID,
			@NotNull String businessCityForCompanyName) {
		super();
		BusinessCityForCompanyID = businessCityForCompanyID;
		BusinessCityForCompanyName = businessCityForCompanyName;
	}
	
	public BusinessCityForCompanyByStateID() {}
	
}
