package ivgroup.master.database.dto.companyExecutivePL;

import javax.validation.constraints.NotEmpty;

public class CompanyExecutivePLGeneralSelectForYear {

	@NotEmpty(message="PL RATE cannot be NULL")
	Double PLRate;
	@NotEmpty(message="DateOfEntry cannot be NULL")
	Integer dateOfEntry;
	
	public CompanyExecutivePLGeneralSelectForYear()
	{

	}

	public CompanyExecutivePLGeneralSelectForYear(@NotEmpty(message = "PL RATE cannot be NULL") Double pLRate,
			@NotEmpty(message = "DateOfEntry cannot be NULL") Integer dateOfEntry) {
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

	public void setDateOfEntry(Integer dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}

}
