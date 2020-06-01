package ivgroup.master.database.dto.priority;

import javax.validation.constraints.NotEmpty;

public class PrioritySelect
{
	@NotEmpty(message = "PriorityId cannot be NULL")
	Long priorityId;
	@NotEmpty(message = "PriorityName cannot be NULL")
	String priorityName;
	@NotEmpty(message = "PriorityPosition cannot be NULL")
	Short priorityPosition;
	
	public PrioritySelect()
	{
		
	}

	public PrioritySelect(
			@NotEmpty(message = "PriorityId cannot be NULL") Long priorityId,
			@NotEmpty(message = "PriorityName cannot be NULL") String priorityName,
			@NotEmpty(message = "PriorityPosition cannot be NULL") Short priorityPosition) {
		super();
		this.priorityId = priorityId;
		this.priorityName = priorityName;
		this.priorityPosition = priorityPosition;
	}

	public Long getPriorityId() {
		return priorityId;
	}

	public void setPriorityId(Long priorityId) {
		this.priorityId = priorityId;
	}

	public String getPriorityName() {
		return priorityName;
	}

	public void setPriorityName(String priorityName) {
		this.priorityName = priorityName;
	}

	public Short getPriorityPosition() {
		return priorityPosition;
	}

	public void setPriorityPosition(Short priorityPosition) {
		this.priorityPosition = priorityPosition;
	}

}
