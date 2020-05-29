package ivgroup.master.database.dto.companyExecutivePL;

import javax.validation.constraints.NotNull;

public class CompanyExecutivePLGeneralSelectForYear {

	@NotNull(message="PL RATE cannot be NULL")
	Double PLRate;
	@NotNull(message="DateOfEntry cannot be NULL")
	Integer dateOfEntry;
	
	public CompanyExecutivePLGeneralSelectForYear()
	{

	}

	public CompanyExecutivePLGeneralSelectForYear(@NotNull(message = "PL RATE cannot be NULL") Double pLRate,
			@NotNull(message = "DateOfEntry cannot be NULL") Integer dateOfEntry) {
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
