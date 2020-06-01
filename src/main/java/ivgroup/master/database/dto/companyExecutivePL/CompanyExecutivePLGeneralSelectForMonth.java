package ivgroup.master.database.dto.companyExecutivePL;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutivePLGeneralSelectForMonth {

	@NotEmpty(message="PL RATE cannot be NULL")
	Double PLRate;
	@NotEmpty(message="date cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "IST")
	Date dateOfEntry;
	
	public CompanyExecutivePLGeneralSelectForMonth()
	{
		
	}

	public CompanyExecutivePLGeneralSelectForMonth(
			@NotEmpty(message = "PL RATE cannot be NULL") Double pLRate,
			@JsonFormat(pattern = "yyyy-MM-dd", timezone = "IST") @NotEmpty(message = "date cannot be NULL") Date dateOfEntry) {
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

	public Date getDateOfEntry() {
		return dateOfEntry;
	}

	public void setDateOfEntry(Date dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}
	
	
}
