package ivgroup.master.database.dto.companyExecutivePL;

import javax.validation.constraints.NotNull;

public class CompanyExecutivePLGeneralSelectForAllYear
{
	@NotNull(message="PL RATE cannot be NULL")
	private Double PLRate;
	@NotNull(message="Year cannot be NULL")
	private Integer dateOfEntry;
	
	public CompanyExecutivePLGeneralSelectForAllYear()
	{
		
	}

	public CompanyExecutivePLGeneralSelectForAllYear(@NotNull(message = "PL RATE cannot be NULL") Double pLRate,
			@NotNull(message = "Year cannot be NULL") Integer dateOfEntry) {
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
