package ivgroup.master.database.dto.companyExecutivePL;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutivePLInsert {

	@NotEmpty(message="ExecutiveId cannot be NULL")
	Long executiveId;
	@NotEmpty(message="PL RATE cannot be NULL")
	Integer PLrate;
	@NotEmpty(message="TimeOfEntry cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp timeOfEntry;
	
	public CompanyExecutivePLInsert()
	{
		
	}

	public CompanyExecutivePLInsert(
			@NotEmpty(message = "ExecutiveId cannot be NULL") Long executiveId,
			@NotEmpty(message = "PL RATE cannot be NULL") Integer pLrate,
			@NotEmpty(message = "TimeOfEntry cannot be NULL") Timestamp timeOfEntry) {
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
