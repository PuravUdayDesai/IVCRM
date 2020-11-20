package ivgroup.master.database.dto.owner;

import javax.validation.constraints.NotNull;

public class TopExecutivesList
{
	@NotNull(message = "ExecutiveName cannot be NULL")
	private String executiveName;
	@NotNull(message = "PlRate cannot be NULL")
	private Long plRate;
	
	public TopExecutivesList()
	{
		
	}

	public TopExecutivesList(@NotNull(message = "ExecutiveName cannot be NULL") String executiveName,
			@NotNull(message = "PlRate cannot be NULL") Long plRate) {
		super();
		this.executiveName = executiveName;
		this.plRate = plRate;
	}

	public String getExecutiveName() {
		return executiveName;
	}

	public void setExecutiveName(String executiveName) {
		this.executiveName = executiveName;
	}

	public Long getPlRate() {
		return plRate;
	}

	public void setPlRate(Long plRate) {
		this.plRate = plRate;
	}

}
