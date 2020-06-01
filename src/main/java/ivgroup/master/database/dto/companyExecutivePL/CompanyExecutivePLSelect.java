package ivgroup.master.database.dto.companyExecutivePL;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutivePLSelect {

	@NotEmpty(message="Id cannot be NULL")
	Long id;
	@NotEmpty(message="ExecutiveId cannot be NULL")
	Long executiveId;
	@NotEmpty(message="PLRate cannot be NULL")
	Integer PLrate;
	@NotEmpty(message="TimeOfEntry cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	Timestamp dateOfEntry;
	
	public CompanyExecutivePLSelect() 
	{
		
	}

	public CompanyExecutivePLSelect(
			@NotEmpty(message = "Id cannot be NULL") Long id,
			@NotEmpty(message = "ExecutiveId cannot be NULL") Long executiveId,
			@NotEmpty(message = "PLRate cannot be NULL") Integer pLrate,
			@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST") @NotEmpty(message = "TimeOfEntry cannot be NULL") Timestamp dateOfEntry) {
		super();
		this.id = id;
		this.executiveId = executiveId;
		PLrate = pLrate;
		this.dateOfEntry = dateOfEntry;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Timestamp getDateOfEntry() {
		return dateOfEntry;
	}

	public void setDateOfEntry(Timestamp timeOfEntry) {
		this.dateOfEntry = timeOfEntry;
	}

}
