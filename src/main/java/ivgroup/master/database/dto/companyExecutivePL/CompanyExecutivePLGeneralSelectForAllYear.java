package ivgroup.master.database.dto.companyExecutivePL;

import javax.validation.constraints.NotEmpty;

public class CompanyExecutivePLGeneralSelectForAllYear
{
	@NotEmpty(message="PL RATE cannot be NULL")
	Double PLRate;
	@NotEmpty(message="Year cannot be NULL")
	Integer dateOfEntry;
	
	public CompanyExecutivePLGeneralSelectForAllYear()
	{
		
	}

	public CompanyExecutivePLGeneralSelectForAllYear(@NotEmpty(message = "PL RATE cannot be NULL") Double pLRate,
			@NotEmpty(message = "Year cannot be NULL") Integer dateOfEntry) {
		super();
		PLRate = pLRate;
		this.dateOfEntry = dateOfEntry;
	}

	public Double getPLRate() {
		return PLRate;
	}

	public void setPLRate(Double pLRate) {
		PLRate = pLRate;
	}

	public Integer getDateOfEntry() {
		return dateOfEntry;
	}

	public void getDateOfEntry(Integer dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}

}
