package ivgroup.master.database.dto.priority;

import javax.validation.constraints.NotNull;

public class PrioritySelect
{
	@NotNull(message = "PriorityId cannot be NULL")
	private Long priorityId;
	@NotNull(message = "PriorityName cannot be NULL")
	private String priorityName;
	@NotNull(message = "PriorityPosition cannot be NULL")
	private Short priorityPosition;
	
	public PrioritySelect()
	{
		
	}

	public PrioritySelect(
			@NotNull(message = "PriorityId cannot be NULL") Long priorityId,
			@NotNull(message = "PriorityName cannot be NULL") String priorityName,
			@NotNull(message = "PriorityPosition cannot be NULL") Short priorityPosition) {
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
