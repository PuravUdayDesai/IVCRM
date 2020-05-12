package ivgroup.master.database.dto.companyExecutivePL;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutivePLInsert {

	@NotNull(message="ExecutiveId cannot be NULL")
	Long executiveId;
	@NotNull(message="PL RATE cannot be NULL")
	Integer PLrate;
	@NotNull(message="TimeOfEntry cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp timeOfEntry;
	
	public CompanyExecutivePLInsert()
	{
		
	}

	public CompanyExecutivePLInsert(@NotNull(message = "ExecutiveId cannot be NULL") Long executiveId,
			@NotNull(message = "PL RATE cannot be NULL") Integer pLrate,
			@NotNull(message = "TimeOfEntry cannot be NULL") Timestamp timeOfEntry) {
		super();
		this.executiveId = executiveId;
		PLrate = pLrate;
		this.timeOfEntry = timeOfEntry;
	}

	public Long getExecutiveId() {
		return executiveId;
	}

	public void setExecutiveId(Long executiveId) {
		this.executiveId = executiveId;
	}

	public Integer getPLrate() {
		return PLrate;
	}

	public void setPLrate(Integer pLrate) {
		PLrate = pLrate;
	}

	public Timestamp getTimeOfEntry() {
		return timeOfEntry;
	}

	public void setTimeOfEntry(Timestamp timeOfEntry) {
		this.timeOfEntry = timeOfEntry;
	}

}
