package ivgroup.master.database.dto.companyExecutivePL;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyExecutivePLSelect {

	@NotNull(message="Id cannot be NULL")
	private Long id;
	@NotNull(message="ExecutiveId cannot be NULL")
	private Long executiveId;
	@NotNull(message="PLRate cannot be NULL")
	private Integer PLrate;
	@NotNull(message="TimeOfEntry cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp dateOfEntry;
	
	public CompanyExecutivePLSelect() 
	{
		
	}

	public CompanyExecutivePLSelect(
			@NotNull(message = "Id cannot be NULL") Long id,
			@NotNull(message = "ExecutiveId cannot be NULL") Long executiveId,
			@NotNull(message = "PLRate cannot be NULL") Integer pLrate,
			@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST") @NotNull(message = "TimeOfEntry cannot be NULL") Timestamp dateOfEntry) {
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
